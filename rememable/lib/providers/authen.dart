import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rememable/models/flashcard.dart';
import 'package:rememable/models/review.dart';
import 'package:rememable/models/user.dart';

class Authen with ChangeNotifier {
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

  Future<User> getUserProfile() async {
    var endpoint = publicAPI + 'users/$_uid';

    try {
      final res = await http.get(Uri.parse(endpoint));
      final data = jsonDecode(res.body);

      if (data == null) return User();
      List<Review> reviewList;
      for (int i = 0; i < data['review_list'].length; i++) {
        reviewList.add(new Review(
          id: data['review_list'][i]['id'],
          flashcardOwnerId: data['review_list'][i]['user_id'],
          comment: data['review_list'][i]['comment'],
          rating: data['review_list'][i]['rating'],
        ));
      }
      List<Flashcard> favList;
      for (int i = 0; i < data['fav_list'].length; i++) {
        favList.add(new Flashcard());
        // new Review(
        // id: data['review_list'][i]['id'],
        // flashcardOwnerId: data['review_list'][i]['user_id'],
        // comment: data['review_list'][i]['comment'],
        // rating: data['review_list'][i]['rating'],
        // )
      }
      List<Flashcard> ownFlashcardList;
      for (int i = 0; i < data['fav_list'].length; i++) {
        ownFlashcardList.add(new Flashcard());
      }
      List<Flashcard> studiedOwner;
      for (int i = 0; i < data['fav_list'].length; i++) {
        studiedOwner.add(new Flashcard());
      }
      User profile = new User(
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
      return profile;
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
          body: {"email": email, "password": password});
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
