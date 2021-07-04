import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rememable/models/flashcard.dart';
import 'package:rememable/models/question.dart';
import 'package:rememable/models/review.dart';
import 'package:rememable/models/user.dart';

class Authen with ChangeNotifier {
  User _profile;
  String _token;
  int _uid;
  var publicAPI = 'https://rememable.herokuapp.com/';

  bool get isAuth {
    return _token != null;
  }

  String get token {
    return _token;
  }

  int get uid {
    return _uid;
  }

  User get profile {
    return _profile;
  }

  bool ownerCheck(String id) {
    for (int i = 0; i < _profile.ownFlashcardList.length; i++) {
      if (id == _profile.ownFlashcardList[i]) {
        return true;
      }
    }
    return false;
  }

  Future<void> getUserProfile() async {
    var endpoint = publicAPI + 'users/$_uid';

    try {
      final res = await http.get(Uri.parse(endpoint));
      final data = jsonDecode(res.body);

      if (data == null) return User();
      List<String> reviewList;
      for (int i = 0; i < data['review_list'].length; i++) {
        reviewList.add(data['review_list'][i]['id']);
      }
      List<String> favList;
      for (int i = 0; i < data['fav_list'].length; i++) {
        favList.add(data['fav_list'][i]['id']);
      }
      List<String> ownFlashcardList;
      for (int i = 0; i < data['own_flashcards_list'].length; i++) {
        ownFlashcardList.add(data['own_flashcards_list'][i]['id']);
      }
      List<String> studiedOwner;
      for (int i = 0; i < data['studied_owner'].length; i++) {
        studiedOwner.add(data['studied_owner'][i]['id']);
      }
      _profile = new User(
        id: data['id'],
        name: data['name'],
        reviewList: reviewList,
        favList: favList,
        ownFlashcardList: ownFlashcardList,
        studiedOwner: studiedOwner,

        // 'phone_num': data['phone_num'],
        // 'email': data['email'],
        // 'picture': data['picture'],
        // 'address': data['address'],
        // 'sub_district': data['sub_district'],
        // 'district': data['district'],
        // 'province': data['province'],
        // 'country': data['country'],
        // 'zip_code': data['zip_code'],
      );
      // return profile;
    } catch (err) {
      return throw (err);
    }
  }

  // Future<void> signup(
  //     String firstName,
  //     String lastName,
  //     String email,
  //     String phoneNum,
  //     String password,
  //     String addressInfo,
  //     String subDistrict,
  //     String district,
  //     String province,
  //     String country,
  //     String zipCode) async {
  //   var endpoint = publicAPI + 'users/signup';

  //   try {
  //     final res = await http.post(Uri.parse(endpoint), body: {
  //       'firstName': firstName,
  //       'lastName': lastName,
  //       'email': email,
  //       'phoneNum': phoneNum,
  //       'password': password,
  //       'address': addressInfo,
  //       'sub_district': subDistrict,
  //       'district': district,
  //       'province': province,
  //       'country': country,
  //       'zip_code': zipCode
  //     });
  //     final data = jsonDecode(res.body);

  //     if (data == null) return;

  //     if (res.statusCode == 201) {
  //       _token = data['token'];
  //       _uid = data['uid'];
  //     } else if (res.statusCode == 400) {
  //       print('Something went wrong. Please Try Again');
  //     }

  //     notifyListeners();
  //   } catch (err) {
  //     return throw (err);
  //   }
  // }

  Future<bool> login(String email, String password) async {
    var endpoint = publicAPI + 'auth/local';

    try {
      final res = await http.post(Uri.parse(endpoint),
          body: {"identifier": email, "password": password});
      final data = jsonDecode(res.body);

      if (res.statusCode == 400) return false;

      _token = data['jwt'];
      _uid = data['user.id'];

      // final prefs = await SharedPreferences.getInstance();
      // final user = json.encode({'token': _token, 'uid': _uid});
      // prefs.setString('user', user);

      notifyListeners();

      return true;
    } catch (err) {
      return throw (err);
    }
  }

  // Future<bool> autoLogin() async {
  //   final prefs = await SharedPreferences.getInstance();

  //   if (!prefs.containsKey('user')) return false;

  //   final user = json.decode(prefs.getString('user'));
  //   _token = user['token'];
  //   _uid = user['uid'];
  //   notifyListeners();

  //   return true;
  // }

  // Future<void> logout() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   _token = null;
  //   _uid = null;
  //   prefs.clear();
  //   notifyListeners();
  // }
}
