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
  String _uid;
  var publicAPI = 'https://rememable.herokuapp.com/';

  bool get isAuth {
    return _token != null;
  }

  String get token {
    return _token;
  }

  String get uid {
    return _uid;
  }

  User get profile {
    return _profile;
  }

  String getEmail() {
    return _profile.email;
  }

  bool isFav(String id) {
    for (int i = 0; i < _profile.favList.length; i++) {
      if (id == _profile.favList[i]) {
        return true;
      }
    }
    return false;
  }

  bool isStudied(String id) {
    for (int i = 0; i < _profile.studiedOwner.length; i++) {
      if (id == _profile.studiedOwner[i]) {
        return true;
      }
    }
    return false;
  }

  Future<void> addStudied(String id) async {
    _profile.studiedOwner.add(id);
    String jsonTemp = "{\"studied_flashcard_list\": {\"data\": [";
    int i = 0;
    for (i = 0; i < _profile.studiedOwner.length; i++) {
      jsonTemp += "\"${_profile.studiedOwner[i]}\",";
    }
    if (_profile.studiedOwner.length != 0) {
      jsonTemp = jsonTemp.substring(0, jsonTemp.length - 1);
    }

    jsonTemp = jsonTemp + "]}}";

    try {
      var response = await http.put(Uri.parse(publicAPI + 'users/$_uid'),
          headers: {'Content-type': 'application/json'}, body: jsonTemp);
      // final data = jsonDecode(response.body);
      // print(data.toString());
    } catch (err) {
      return throw (err);
    }

    notifyListeners();
  }

  Future<void> addOwnerFlashcardId(String id) async {
    _profile.ownFlashcardList.add(id);
    String jsonTemp = "{\"own_flashcard_list\": {\"data\": [";
    int i = 0;
    for (i = 0; i < _profile.ownFlashcardList.length; i++) {
      jsonTemp += "\"${_profile.ownFlashcardList[i]}\",";
    }
    if (_profile.ownFlashcardList.length != 0) {
      jsonTemp = jsonTemp.substring(0, jsonTemp.length - 1);
    }

    jsonTemp = jsonTemp + "]}}";

    try {
      var response = await http.put(Uri.parse(publicAPI + 'users/$_uid'),
          headers: {'Content-type': 'application/json'}, body: jsonTemp);
      final data = jsonDecode(response.body);
      // print(data.toString());
    } catch (err) {
      return throw (err);
    }

    notifyListeners();
  }

  Future<void> manageFav(String id) async {
    int indexTemp = _profile.favList.indexOf(id);

    if (indexTemp == -1) {
      _profile.favList.add(id);
    } else {
      _profile.favList.remove(id);
    }
    String jsonTemp = "{\"fav_list\": {\"data\": [";
    int i = 0;
    for (i = 0; i < _profile.favList.length; i++) {
      jsonTemp += "\"${_profile.favList[i]}\",";
    }
    if (_profile.favList.length != 0) {
      jsonTemp = jsonTemp.substring(0, jsonTemp.length - 1);
    }

    jsonTemp = jsonTemp + "]}}";

    // print(jsonTemp);
    try {
      var response = await http.put(Uri.parse(publicAPI + 'users/$_uid'),
          headers: {'Content-type': 'application/json'}, body: jsonTemp);
      // body: jsonEncode(_profile.favList));
    } catch (err) {
      return throw (err);
    }

    notifyListeners();
  }

  bool ownerCheck(String id) {
    if (_profile.ownFlashcardList.indexOf(id) == -1) {
      return false;
    }
    return true;
    // for (int i = 0; i < _profile.ownFlashcardList.length; i++) {
    //   if (id == _profile.ownFlashcardList[i]) {
    //     return true;
    //   }
    // }
    // return false;
  }

  int favLength() {
    return _profile.favList.length;
  }

  String getFavIdByIndex(int index) {
    return _profile.favList[index];
  }

  int getOwnLength() {
    return _profile.ownFlashcardList.length;
  }

  String getOwnIdByIndex(int index) {
    return _profile.ownFlashcardList[index];
  }

  int getStudiedLength() {
    return _profile.studiedOwner.length;
  }

  String getStudiedIdByIndex(int index) {
    return _profile.studiedOwner[index];
  }

  String getName() {
    return _profile.name;
  }

  Future<void> getUserProfile() async {
    var endpoint = publicAPI + 'users/$_uid';
    try {
      final res = await http.get(Uri.parse(endpoint));
      final data = jsonDecode(res.body);

      if (data == null) return User();
      List<String> reviewList = [];
      for (int i = 0; i < data['review_list']['data'].length; i++) {
        reviewList.add(data['review_list']['data'][i].toString());
      }
      List<String> favList = [];
      for (int i = 0; i < data['fav_list']['data'].length; i++) {
        favList.add(data['fav_list']['data'][i].toString());
      }
      List<String> ownFlashcardList = [];
      for (int i = 0; i < data['own_flashcard_list']['data'].length; i++) {
        ownFlashcardList.add(data['own_flashcard_list']['data'][i].toString());
      }
      List<String> studiedOwner = [];
      for (int i = 0; i < data['studied_flashcard_list']['data'].length; i++) {
        studiedOwner.add(data['studied_flashcard_list']['data'][i].toString());
      }
      // print(studiedOwner);
      _profile = new User(
        id: data['id'],
        name: data['name'],
        email: data['email'],
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
      notifyListeners();
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
      _uid = data['user']['id'];

      // final prefs = await SharedPreferences.getInstance();
      // final user = json.encode({'token': _token, 'uid': _uid});
      // prefs.setString('user', user);

      notifyListeners();

      return true;
    } catch (err) {
      return throw (err);
    }
  }

  // Future<void> updateAddFavList(String flashcard_id) async {
  //   var endpoint = publicAPI + 'user/$flashcard_id';

  //   try {
  //     final res = await http
  //         .post(Uri.parse(endpoint), body: {"id": flashcard_id, "": password});
  //     final data = jsonDecode(res.body);

  //     if (res.statusCode == 400) return false;

  //     _token = data['jwt'];
  //     _uid = data['user']['id'];

  //     // final prefs = await SharedPreferences.getInstance();
  //     // final user = json.encode({'token': _token, 'uid': _uid});
  //     // prefs.setString('user', user);

  //     notifyListeners();

  //     return true;
  //   } catch (err) {
  //     return throw (err);
  //   }
  // }

  // Future<bool> autoLogin() async {
  //   final prefs = await SharedPreferences.getInstance();

  //   if (!prefs.containsKey('user')) return false;

  //   final user = json.decode(prefs.getString('user'));
  //   _token = user['token'];
  //   _uid = user['uid'];
  //   notifyListeners();

  //   return true;
  // }

  Future<void> logout() async {
    // final prefs = await SharedPreferences.getInstance();
    _token = null;
    _uid = null;
    // prefs.clear();
    notifyListeners();
  }
}
