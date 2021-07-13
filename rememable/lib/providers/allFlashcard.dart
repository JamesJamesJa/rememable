import 'dart:io';
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

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

  Future<void> addNewFlashcard(
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
          filename: basename(cover_image.path),
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
          });
        });
      });
      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }

  Future<void> flashcardDetails() async {
    try {
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
      // List<Review> allReview = [];
      for (int i = 0; i < dataReviews.length; i++) {
        _review.add(new Review(
          id: dataReviews[i]['id'],
          comment: dataReviews[i]['comment'],
          rating: dataReviews[i]['rating'],
          flashcardOwnerName: dataReviews[i]['owner_name'],
        ));
      }

      // Get All Review from DB
      // List<Question> allQuestion = [];
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
            // questionList.add(new Question(
            //   id: data[i]['question_list'][j]['id'],
            //   question: data[i]['question_list'][j]['question'],
            //   answer: data[i]['question_list'][j]['answer'],
            // ));
          }
        }

        // // Get Favorite Owner ID Loop     // Not use
        // List<String> favOwner = [];
        // for (int j = 0; j < data[i]['fav_owner'].length; j++) {
        //   favOwner.add(data[i]['fav_owner'][j]['id']);
        // }

        // Get List of Review ID Loop
        List<Review> reviewList = [];
        for (int j = 0; j < data[i]['review_list']['data'].length; j++) {
          for (int k = 0; k < _review.length; k++) {
            if (data[i]['review_list']['data'][j] == _review[k].id) {
              reviewList.add(_review[k]);
            }
          }
          // reviewList.add(new Review(     // Not use
          //   id: data[i]['review_list'][j]['id'],
          //   flashcardOwnerName: data[i]['review_list'][j]['user_id'],
          //   comment: data[i]['review_list'][j]['comment'],
          //   rating: data[i]['review_list'][j]['rating'],
          // ));
        }

        // // Get List of Studied Flashcard ID Loop     // Not use
        // List<String> studiedFlashcardId = [];
        // for (int j = 0; j < data[i]['studied_flashcard'].length; j++) {
        //   studiedFlashcardId.add(data[i]['studied_flashcard'][j]['id']);
        // }

        switch (data[i]['category']) {
          case 'Math':
            mathAmount++;
            // print('Math ${mathAmount}');
            break;
          case 'Science':
            scienceAmount++;
            // print('Science ${scienceAmount}');
            break;
          case 'Language':
            languageAmount++;
            // print('Language ${languageAmount}');
            break;
          case 'Coding':
            codingAmount++;
            // print('Coding ${codingAmount}');
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
}
