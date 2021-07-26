import 'dart:io';
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';
import 'package:network_to_file_image/network_to_file_image.dart';
import 'package:path/path.dart' as p;
import 'package:async/async.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rememable/models/flashcard.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rememable/models/question.dart';
import 'package:rememable/models/review.dart';

class AllFlashcard with ChangeNotifier {
  List<Flashcard> _flashcard = [];
  List<Review> _review = [];
  List<Question> _question = [];
  int mathAmount = 0;
  int scienceAmount = 0;
  int languageAmount = 0;
  int codingAmount = 0;
  List<int> ratingIndex = [];
  List<Flashcard> get flashcard {
    return _flashcard;
  }
  // User _student;
  // User get student {
  //   return _student;
  // }

  int getLength() {
    return _flashcard.length;
  }

  String getId(int index) {
    return _flashcard[index].id;
  }

  String getNameById(String id) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (id == _flashcard[i].id) {
        return _flashcard[i].name;
      }
    }
  }

  String getOwnerNameById(String id) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (id == _flashcard[i].id) {
        return _flashcard[i].ownerFlashcardName;
      }
    }
  }

  String getImagePathById(String id) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (id == _flashcard[i].id) {
        return _flashcard[i].coverImage;
      }
    }
  }

  String getCategoryById(String id) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (id == _flashcard[i].id) {
        return _flashcard[i].category;
      }
    }
  }

  String getCategoryByIndex(int index) {
    return _flashcard[index].category;
  }

  String getDescriptionById(String id) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (id == _flashcard[i].id) {
        return _flashcard[i].description;
      }
    }
  }

  double getRatingById(String id) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (id == _flashcard[i].id) {
        return _flashcard[i].rating;
      }
    }
  }

  bool inSearch(String id, String word) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (_flashcard[i].id == id) {
        return _flashcard[i].name.toLowerCase().contains(word.toLowerCase());
      }
    }
    return false;
  }

  int getQuestionLength(String id) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (_flashcard[i].id == id) {
        return _flashcard[i].questionList.length;
      }
    }
  }

  void setRatingIndex() {
    List<double> allRating = [];
    ratingIndex = [];
    for (int i = 0; i < _flashcard.length; i++) {
      allRating.add(_flashcard[i].rating);
    }
    for (int i = 0; i < allRating.length; i++) {
      double temp = -1;
      int tempIndex = -1;
      for (int j = 0; j < allRating.length; j++) {
        if (allRating[j] > temp) {
          temp = _flashcard[j].rating;
          tempIndex = j;
        }
      }
      allRating[tempIndex] = -1;
      ratingIndex.add(tempIndex);
    }
    notifyListeners();
  }

  int getIndexByRating(int index) {
    return ratingIndex[index];
  }

  int getIndexByID(String id) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (_flashcard[i].id == id) {
        return i;
      }
    }
  }

  String getQuestionByIndex(String id, int index) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (_flashcard[i].id == id) {
        return _flashcard[i].questionList[index].question;
      }
    }
  }

  String getAnswerByIndex(String id, int index) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (_flashcard[i].id == id) {
        return _flashcard[i].questionList[index].answer;
      }
    }
  }

  int getReviewAmountById(String id) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (_flashcard[i].id == id) {
        return _flashcard[i].reviewAmount;
      }
    }
  }

  int getReviewLength(String id) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (_flashcard[i].id == id) {
        return _flashcard[i].reviewListId.length;
      }
    }
  }

  String getOwnerReviewNameByIndex(String id, int index) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (_flashcard[i].id == id) {
        return _flashcard[i].reviewListId[index].flashcardOwnerName;
      }
    }
  }

  String getCommentByIndex(String id, int index) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (_flashcard[i].id == id) {
        return _flashcard[i].reviewListId[index].comment;
      }
    }
  }

  int getRatingByIndex(String id, int index) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (_flashcard[i].id == id) {
        return _flashcard[i].reviewListId[index].rating;
      }
    }
  }

  String getReviewIdByIndex(String id, int index) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (_flashcard[i].id == id) {
        return _flashcard[i].reviewListId[index].id;
      }
    }
  }

  bool isReviewYet(String id, String name) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (_flashcard[i].id == id) {
        for (int j = 0; j < _flashcard[i].reviewListId.length; j++) {
          if (_flashcard[i].reviewListId[j].flashcardOwnerName == name) {
            return true;
          }
        }
      }
    }
    return false;
  }

  Future<void> logout() async {
    _flashcard = [];
    _review = [];
    _question = [];
    mathAmount = 0;
    scienceAmount = 0;
    languageAmount = 0;
    codingAmount = 0;
    List<int> ratingIndex = [];
    notifyListeners();
  }

  Future<File> getImageFileFromId(String id) async {
    final response = await http.get(
        Uri.parse('https://rememable.herokuapp.com${getImagePathById(id)}'));

    Directory _appDocsDir = await getTemporaryDirectory();
    File fileFromDocsDir(String filename) {
      String pathName = p.join(_appDocsDir.path, filename);
      return File(pathName);
    }

    File file = fileFromDocsDir(getImagePathById(id).split('uploads/')[1]);

    file.writeAsBytesSync(response.bodyBytes);
    return file;
  }

  Future<void> deleteFlashcardDB(String id) async {
    try {
      final res = await http.delete(
          Uri.parse('https://rememable.herokuapp.com/flashcards/${id}'));
      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }

  void deleteFlashcard(String id) {
    for (int i = 0; i < _flashcard.length; i++) {
      if (_flashcard[i].id == id) {
        _flashcard.removeAt(i);
        break;
      }
    }
  }

  Future<void> addNewReview(
    String id,
    int rating,
    String comment,
    String ownerName,
  ) async {
    try {
      String jsonReview =
          "{ \"rating\": ${rating}, \"comment\": \"${comment}\", \"owner_name\": \"${ownerName}\" }";
      var responseReview = await http
          .post(Uri.parse('https://rememable.herokuapp.com/reviews'),
              headers: {'Content-type': 'application/json'}, body: jsonReview)
          .then((value) async {
        final data = jsonDecode(value.body);
        int indexTemp;
        for (var i = 0; i < _flashcard.length; i++) {
          if (_flashcard[i].id == id) {
            indexTemp = i;
            _flashcard[i].reviewListId.add(new Review(
                id: data['id'],
                comment: comment,
                flashcardOwnerName: ownerName,
                rating: rating));
            break;
          }
        }
        Flashcard flashcardTemp = new Flashcard(
          id: _flashcard[indexTemp].id,
          name: _flashcard[indexTemp].name,
          category: _flashcard[indexTemp].category,
          description: _flashcard[indexTemp].description,
          coverImage: _flashcard[indexTemp].coverImage,
          rating: ((_flashcard[indexTemp].rating *
                      _flashcard[indexTemp].reviewAmount) +
                  rating) /
              (_flashcard[indexTemp].reviewAmount + 1),
          reviewAmount: _flashcard[indexTemp].reviewAmount + 1,
          ownerFlashcardName: _flashcard[indexTemp].ownerFlashcardName,
          questionList: _flashcard[indexTemp].questionList,
          reviewListId: _flashcard[indexTemp].reviewListId,
        );
        _flashcard.removeAt(indexTemp);
        _flashcard.insert(indexTemp, flashcardTemp);
        String reviewListTemp = "";
        for (var i = 0; i < _flashcard[indexTemp].reviewListId.length; i++) {
          reviewListTemp += "\"${_flashcard[indexTemp].reviewListId[i].id}\", ";
        }
        reviewListTemp = reviewListTemp.substring(0, reviewListTemp.length - 2);
        String jsonTemp =
            "{\"rating\": ${_flashcard[indexTemp].rating}, \"review_amount\": ${_flashcard[indexTemp].reviewAmount}, \"review_list\": {\"data\": [${reviewListTemp}]}}";
        var responseUpdateFlashcard = await http
            .put(Uri.parse('https://rememable.herokuapp.com/flashcards/${id}'),
                headers: {'Content-type': 'application/json'}, body: jsonTemp)
            .then((value) async {
          final data = jsonDecode(value.body);
          setRatingIndex();
          notifyListeners();
        });
      });
    } catch (err) {
      return throw (err);
    }
  }

  Future<void> editFlashcard(
      String id,
      String flashcard_name,
      String category,
      String description,
      File cover_image,
      List<String> term,
      List<String> definition) async {
    try {
      List<Question> allQuestion = [];
      String cover_image_url = "";
      String jsonQuestionId = "[";
      for (int i = 0; i < term.length; i++) {
        String jsonQuestion =
            "{\"question\": \"${term[i]}\", \"answer\": \"${definition[i]}\"}";
        var response = await http.post(
            Uri.parse('https://rememable.herokuapp.com/questions'),
            headers: {'Content-type': 'application/json'},
            body: jsonQuestion);
        final data = jsonDecode(response.body);
        jsonQuestionId += "\"${data['id']}\",";
        allQuestion.add(new Question(
            id: data['id'],
            question: data['question'],
            answer: data['answer']));
      }
      if (jsonQuestionId[jsonQuestionId.length - 1] != "[") {
        jsonQuestionId = jsonQuestionId.substring(0, jsonQuestionId.length - 1);
      }
      jsonQuestionId += "]";

      List<int> imageBytes = cover_image.readAsBytesSync();
      String imageType = cover_image.path.split('.').last;
      var stream =
          new http.ByteStream(DelegatingStream.typed(cover_image.openRead()));

      var uri = Uri.parse('https://rememable.herokuapp.com/upload');
      int length = imageBytes.length;
      var request = new http.MultipartRequest("POST", uri);
      var multipartFile = new http.MultipartFile('files', stream, length,
          filename: p.basename(cover_image.path),
          contentType: MediaType('image', '${imageType}'));

      request.files.add(multipartFile);
      String jsonTemp = "{";
      var responseImage = await request.send().then((value) {
        value.stream.transform(utf8.decoder).listen((event) async {
          cover_image_url = event.split('url')[1].split('\"')[2];
          jsonTemp += "\"flashcard_name\": \"${flashcard_name}\", ";
          jsonTemp += "\"category\": \"${category}\", ";
          jsonTemp += "\"description\": \"${description}\", ";
          jsonTemp += "\"cover_image\": ${event.toString()},";
          jsonTemp += "\"rating\": 0.0, ";
          jsonTemp += "\"review_amount\": 0, ";
          jsonTemp += "\"question_list\": {\"data\": ${jsonQuestionId}}}";
          var response = await http
              .put(
                  Uri.parse('https://rememable.herokuapp.com/flashcards/${id}'),
                  headers: {'Content-type': 'application/json'},
                  body: jsonTemp)
              .then((value) async {
            final data = jsonDecode(value.body);

            int indexTemp;
            for (var i = 0; i < _flashcard.length; i++) {
              if (_flashcard[i].id == id) {
                indexTemp = i;
              }
            }
            Flashcard tempFlashcard = new Flashcard(
              id: id,
              name: flashcard_name,
              category: category,
              description: description,
              coverImage: data['cover_image'][0]['url'],
              rating: _flashcard[indexTemp].rating,
              reviewAmount: _flashcard[indexTemp].reviewAmount,
              ownerFlashcardName: _flashcard[indexTemp].ownerFlashcardName,
              questionList: allQuestion,
              reviewListId: _flashcard[indexTemp].reviewListId,
            );
            _flashcard.removeAt(indexTemp);
            _flashcard.insert(indexTemp, tempFlashcard);
            notifyListeners();
          });
        });
      });
    } catch (err) {
      return throw (err);
    }
  }

  Future<String> addNewFlashcard(
      String flashcard_name,
      String category,
      String description,
      File cover_image,
      String owner_flashcard_name,
      List<String> term,
      List<String> definition) async {
    try {
      List<Question> allQuestion = [];
      String cover_image_url = "";
      String jsonQuestionId = "[";
      for (int i = 0; i < term.length; i++) {
        String jsonQuestion =
            "{\"question\": \"${term[i]}\", \"answer\": \"${definition[i]}\"}";
        var response = await http.post(
            Uri.parse('https://rememable.herokuapp.com/questions'),
            headers: {'Content-type': 'application/json'},
            body: jsonQuestion);
        final data = jsonDecode(response.body);
        jsonQuestionId += "\"${data['id']}\",";
        allQuestion.add(new Question(
            id: data['id'],
            question: data['question'],
            answer: data['answer']));
      }
      if (jsonQuestionId[jsonQuestionId.length - 1] != "[") {
        jsonQuestionId = jsonQuestionId.substring(0, jsonQuestionId.length - 1);
      }
      jsonQuestionId += "]";

      List<int> imageBytes = cover_image.readAsBytesSync();
      String imageType = cover_image.path.split('.').last;
      var stream =
          new http.ByteStream(DelegatingStream.typed(cover_image.openRead()));

      var uri = Uri.parse('https://rememable.herokuapp.com/upload');
      int length = imageBytes.length;
      var request = new http.MultipartRequest("POST", uri);
      var multipartFile = new http.MultipartFile('files', stream, length,
          filename: p.basename(cover_image.path),
          contentType: MediaType('image', '${imageType}'));

      request.files.add(multipartFile);
      String jsonTemp = "{";
      var responseImage = await request.send().then((value) {
        value.stream.transform(utf8.decoder).listen((event) async {
          cover_image_url = event.split('url')[1].split('\"')[2];
          jsonTemp += "\"flashcard_name\": \"${flashcard_name}\", ";
          jsonTemp += "\"category\": \"${category}\", ";
          jsonTemp += "\"description\": \"${description}\", ";
          jsonTemp += "\"cover_image\": ${event.toString()},";
          jsonTemp += "\"rating\": 0.0, ";
          jsonTemp += "\"review_amount\": 0, ";
          jsonTemp += "\"owner_flashcard_name\": \"${owner_flashcard_name}\", ";
          jsonTemp += "\"question_list\": {\"data\": ${jsonQuestionId}}, ";
          jsonTemp += "\"review_list\": {\"data\": []}}";
          var response = await http
              .post(Uri.parse('https://rememable.herokuapp.com/flashcards'),
                  headers: {'Content-type': 'application/json'}, body: jsonTemp)
              .then((value) async {
            final data = jsonDecode(value.body);
            _flashcard.add(new Flashcard(
              id: data['id'],
              name: data['flashcard_name'],
              category: data['category'],
              description: data['description'],
              coverImage: data['cover_image'][0]['url'],
              rating: data['rating'].toDouble(),
              reviewAmount: data['review_amount'],
              ownerFlashcardName: data['owner_flashcard_name'],
              questionList: allQuestion,
              reviewListId: [],
            ));
            setRatingIndex();
            notifyListeners();
            return "data['id']";
          });
        });
      });
    } catch (err) {
      return throw (err);
    }
  }

  Future<void> flashcardDetails() async {
    try {
      _flashcard = [];
      final res = await http
          .get(Uri.parse('https://rememable.herokuapp.com/flashcards'));
      final data = jsonDecode(res.body);

      final resReviews =
          await http.get(Uri.parse('https://rememable.herokuapp.com/reviews'));
      final dataReviews = jsonDecode(resReviews.body);

      final resQuestions = await http
          .get(Uri.parse('https://rememable.herokuapp.com/questions'));
      final dataQuestions = jsonDecode(resQuestions.body);

      // Get All Review from DB
      for (int i = 0; i < dataReviews.length; i++) {
        _review.add(new Review(
          id: dataReviews[i]['id'],
          comment: dataReviews[i]['comment'],
          rating: dataReviews[i]['rating'],
          flashcardOwnerName: dataReviews[i]['owner_name'],
        ));
      }

      // Get All Review from DB
      for (int i = 0; i < dataQuestions.length; i++) {
        _question.add(new Question(
            id: dataQuestions[i]['id'],
            question: dataQuestions[i]['question'],
            answer: dataQuestions[i]['answer']));
      }

      // Loop for Store all details of flashcard
      for (int i = 0; i < data.length; i++) {
        // Get Question Loop
        List<Question> questionList = [];
        for (int j = 0; j < data[i]['question_list']['data'].length; j++) {
          for (int k = 0; k < _question.length; k++) {
            if (_question[k].id == data[i]['question_list']['data'][j]) {
              questionList.add(_question[k]);
            }
          }
        }

        // Get List of Review ID Loop
        List<Review> reviewList = [];
        for (int j = 0; j < data[i]['review_list']['data'].length; j++) {
          for (int k = 0; k < _review.length; k++) {
            if (data[i]['review_list']['data'][j] == _review[k].id) {
              reviewList.add(_review[k]);
            }
          }
        }

        switch (data[i]['category']) {
          case 'Math':
            mathAmount++;
            break;
          case 'Science':
            scienceAmount++;
            break;
          case 'Language':
            languageAmount++;
            break;
          case 'Coding':
            codingAmount++;
            break;
          default:
            break;
        }

        _flashcard.add(new Flashcard(
          id: data[i]['id'],
          name: data[i]['flashcard_name'],
          category: data[i]['category'],
          description: data[i]['description'],
          coverImage: data[i]['cover_image'][0]['url'],
          rating: data[i]['rating'].toDouble(),
          reviewAmount: data[i]['review_amount'],
          ownerFlashcardName: data[i]['owner_flashcard_name'],
          questionList: questionList,
          reviewListId: reviewList,
        ));
      }
      setRatingIndex();
      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }

  getApplicationDocumentsDirectory() {}
}
