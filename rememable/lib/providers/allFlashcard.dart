import 'package:flutter/material.dart';
import 'package:rememable/models/flashcard.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rememable/models/question.dart';
import 'package:rememable/models/review.dart';

class AllFlashcard with ChangeNotifier {
  List<Flashcard> _flashcard = [];
  List<Flashcard> get flashcard {
    return _flashcard;
  }
  // User _student;
  // User get student {
  //   return _student;
  // }

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

  Future<void> flashcardDetails() async {
    try {
      final res = await http
          .get(Uri.parse('https://rememable.herokuapp.com/flashcards'));
      final data = jsonDecode(res.body);

      for (int i = 0; i < data.length; i++) {
        // Get Question Loop
        List<Question> questionList = [];
        for (int j = 0; j < data[i]['question_list'].length; j++) {
          questionList.add(new Question(
            id: data[i]['question_list'][j]['id'],
            question: data[i]['question_list'][j]['question'],
            answer: data[i]['question_list'][j]['answer'],
          ));
        }

        // Get Favorite Owner ID Loop
        List<String> favOwner = [];
        for (int j = 0; j < data[i]['fav_owner'].length; j++) {
          favOwner.add(data[i]['fav_owner'][j]['id']);
        }

        // Get List of Review ID Loop
        List<Review> reviewList = [];
        for (int j = 0; j < data[i]['review_list'].length; j++) {
          reviewList.add(new Review(
            id: data[i]['review_list'][j]['id'],
            flashcardOwnerId: data[i]['review_list'][j]['user_id'],
            comment: data[i]['review_list'][j]['comment'],
            rating: data[i]['review_list'][j]['rating'],
          ));
        }

        // Get List of Studied Flashcard ID Loop
        List<String> studiedFlashcardId = [];
        for (int j = 0; j < data[i]['studied_flashcard'].length; j++) {
          studiedFlashcardId.add(data[i]['studied_flashcard'][j]['id']);
        }
        // print(data[i]['flashcard_name']);
        // Double ratingTemp = 2;
        _flashcard.add(new Flashcard(
          id: data[i]['id'],
          name: data[i]['flashcard_name'],
          category: data[i]['category'],
          description: data[i]['description'],
          coverImage: data[i]['cover_image'][0]['url'],
          // rating: double.tryParse(data[i]['rating'].toString()),
          rating: data[i]['rating'].toDouble(),
          reviewAmount: data[i]['review_amount'],
          ownerFlashcardId: data[i]['owner_flashcard']['id'],
          ownerFlashcardName: data[i]['owner_flashcard']['name'],
          questionList: questionList,
          favOwner: favOwner,
          reviewListId: reviewList,
          studiedFlashcardId: studiedFlashcardId,
        ));
      }
      // print(_flashcard[0].id);

      //     {
      //       User temp = User(
      //         name: querySnapshot.get('name'),
      //         email: querySnapshot.get('email'),
      //         id: '6GL6X9a0wFZNAxS8y1yb',
      //         role: querySnapshot.get('role'),
      //         appointments: [],
      //         lectures: [],
      //         favoriteLectures: [],
      //       );
      //       _student = temp;

      //       List<dynamic> favTemp = querySnapshot.get('favLecturers');
      //       favTemp.forEach((element) {
      //         _student.favoriteLectures.add(element);
      //       });
      //     });

      //     await FirebaseFirestore.instance
      //         .collection('users/6GL6X9a0wFZNAxS8y1yb/appointment')
      //         .get()
      //         .then((value) {
      //       value.docs.forEach((
      //         element,
      //       ) {
      //         _student.appointments.add(AppointmentDetails(
      //           id: element.id,
      //           lectureId: element.data()['lectureId'],
      //           lecturerId: element.data()['lecturerId'],
      //           status: element.data()['status'],
      //         ));
      //       });
      //     });

      //     await FirebaseFirestore.instance
      //         .collection('users/6GL6X9a0wFZNAxS8y1yb/lectures')
      //         .get()
      //         .then((value) {
      //       value.docs.forEach((element) {
      //         _student.lectures.add(LectureDetails(
      //           id: element.id,
      //           subjectId: element.get('subjectId'),
      //           name: element.get('subjectName'),
      //           room: element.get('room'),
      //           day: element.get('day'),
      //           from: element.get('from'),
      //           to: element.get('to'),
      //           type: element.get('type'),
      //         ));
      //       });
      //     });
      notifyListeners();
    } catch (err) {
      return throw (err);
    }
  }

  // Future<void> addLecturetoDB(
  //   String lectureId,
  //   bool addBool,
  //   String subjectId,
  //   String subjectName,
  //   String location,
  //   String day,
  //   String from,
  //   String to,
  //   String type,
  //   String userId,
  // ) async {
  //   try {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     await Firebase.initializeApp();

  //     if (addBool) {
  //       FirebaseFirestore.instance.collection('users/${userId}/lectures').add({
  //         'subjectId': subjectId,
  //         'subjectName': subjectName,
  //         'room': location,
  //         'day': day,
  //         'from': from,
  //         'to': to,
  //         'type': type,
  //       });
  //       student.lectures.clear();
  //       await FirebaseFirestore.instance
  //           .collection('users/${userId}/lectures')
  //           .get()
  //           .then((value) {
  //         value.docs.forEach((element) {
  //           _student.lectures.add(LectureDetails(
  //             id: element.id,
  //             subjectId: element.get('subjectId'),
  //             name: element.get('subjectName'),
  //             room: element.get('room'),
  //             day: element.get('day'),
  //             from: element.get('from'),
  //             to: element.get('to'),
  //             type: element.get('type'),
  //           ));
  //         });
  //       });
  //     } else {
  //       var tempIndex = 0;
  //       for (var lectureIndex = 0;
  //           lectureIndex < student.lectures.length;
  //           lectureIndex++) {
  //         if (student.lectures[lectureIndex].id == lectureId) {
  //           tempIndex = lectureIndex;
  //         }
  //         student.lectures.removeAt(tempIndex);
  //         student.lectures.insert(
  //             tempIndex,
  //             LectureDetails(
  //               id: lectureId,
  //               subjectId: subjectId,
  //               name: subjectName,
  //               room: location,
  //               day: day,
  //               from: from,
  //               to: to,
  //               type: type,
  //             ));
  //       }
  //       FirebaseFirestore.instance
  //           .collection('users/${userId}/lectures')
  //           .doc(lectureId)
  //           .set({
  //         'subjectId': subjectId,
  //         'subjectName': subjectName,
  //         'room': location,
  //         'day': day,
  //         'from': from,
  //         'to': to,
  //         'type': type
  //       }).catchError((err) {
  //         print(err);
  //       });
  //     }
  //     notifyListeners();
  //   } catch (err) {
  //     return throw (err);
  //   }
  // }

  // Future<void> deleteLecture(String lectureId) async {
  //   try {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     await Firebase.initializeApp();
  //     FirebaseFirestore.instance
  //         .doc('users/6GL6X9a0wFZNAxS8y1yb/lectures/${lectureId}')
  //         .delete();
  //     this.studentDetails();
  //   } catch (err) {
  //     return throw (err);
  //   }
  // }

  // Future<void> addAppointtoDB(String lectureId, String lecturerId) async {
  //   try {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     await Firebase.initializeApp();
  //     String appointmentId = "";
  //     FirebaseFirestore.instance
  //         .collection('users/6GL6X9a0wFZNAxS8y1yb/appointment')
  //         .add({
  //       'lectureId': lectureId,
  //       'lecturerId': lecturerId,
  //       'status': 'Pending',
  //     }).then((value) {
  //       appointmentId = value.id;
  //       FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(lecturerId)
  //           .collection('appointment')
  //           .doc(appointmentId)
  //           .set({
  //         'lectureId': lectureId,
  //         'lecturerId': "6GL6X9a0wFZNAxS8y1yb",
  //         'status': 'Pending',
  //       });
  //     });
  //     _student.appointments.clear();
  //     await FirebaseFirestore.instance
  //         .collection('users/6GL6X9a0wFZNAxS8y1yb/appointment')
  //         .get()
  //         .then((value) {
  //       value.docs.forEach((
  //         element,
  //       ) {
  //         _student.appointments.add(AppointmentDetails(
  //           id: element.id,
  //           lectureId: element.data()['lectureId'],
  //           lecturerId: element.data()['lecturerId'],
  //           status: element.data()['status'],
  //         ));
  //       });
  //     });
  //     notifyListeners();
  //   } catch (err) {
  //     return throw (err);
  //   }
  // }

  // Future<void> teacherDetails() async {
  //   try {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     await Firebase.initializeApp();

  //     await FirebaseFirestore.instance
  //         .doc('users/cjreWa9KOQom1YywjMBw')
  //         .get()
  //         .then((querySnapshot) async {
  //       User temp = User(
  //         name: querySnapshot.get('name'),
  //         email: querySnapshot.get('email'),
  //         id: 'cjreWa9KOQom1YywjMBw',
  //         role: querySnapshot.get('role'),
  //         appointments: [],
  //         lectures: [],
  //       );
  //       _student = temp;
  //     });

  //     await FirebaseFirestore.instance
  //         .collection('users/cjreWa9KOQom1YywjMBw/appointment')
  //         .get()
  //         .then((value) {
  //       value.docs.forEach((
  //         element,
  //       ) {
  //         _student.appointments.add(AppointmentDetails(
  //           id: element.id,
  //           lectureId: element.data()['lectureId'],
  //           lecturerId: element.data()['lecturerId'],
  //           status: element.data()['status'],
  //         ));
  //       });
  //     });

  //     await FirebaseFirestore.instance
  //         .collection('users/cjreWa9KOQom1YywjMBw/lectures')
  //         .get()
  //         .then((value) {
  //       value.docs.forEach((element) {
  //         _student.lectures.add(LectureDetails(
  //           id: element.id,
  //           subjectId: element.get('subjectId'),
  //           name: element.get('subjectName'),
  //           room: element.get('room'),
  //           day: element.get('day'),
  //           from: element.get('from'),
  //           to: element.get('to'),
  //           type: element.get('type'),
  //         ));
  //       });
  //     });
  //     notifyListeners();
  //   } catch (err) {
  //     return throw (err);
  //   }
  // }

  // String name() {
  //   return _student.name;
  // }

  // String id() {
  //   return _student.id;
  // }

  // String printFav() {
  //   return _student.favoriteLectures.toString();
  // }

  // void manageFav(String id) {
  //   int index = _student.favoriteLectures.indexOf(id);
  //   if (index == -1) {
  //     _student.favoriteLectures.add(id);
  //   } else {
  //     _student.favoriteLectures.remove(id);
  //   }
  //   FirebaseFirestore.instance
  //       .doc('users/6GL6X9a0wFZNAxS8y1yb')
  //       .update({'favLecturers': _student.favoriteLectures});
  //   notifyListeners();
  // }

  // bool checkFav(String id) {
  //   int index = _student.favoriteLectures.indexOf(id);
  //   if (index == -1) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  // void delFav(String id) {
  //   notifyListeners();
  // }

  // int appointmentLength() {
  //   return _student.appointments.length;
  // }

  // void addLecture(String id, String subjectId, String name, String room,
  //     String day, String from, String to, String type) {
  //   _student.lectures.add(LectureDetails(
  //       id: id,
  //       name: name,
  //       subjectId: subjectId,
  //       room: room,
  //       day: day,
  //       from: from,
  //       to: to,
  //       type: type));
  //   notifyListeners();
  // }

  // String subjectIdFromAppointment(int appointmentIndex) {
  //   return _student.appointments[appointmentIndex].lectureId;
  // }

  // String appointmentStatus(int appointmentIndex) {
  //   return _student.appointments[appointmentIndex].status;
  // }

  // String lecturerIdFromAppointment(int appointmentIndex) {
  //   return _student.appointments[appointmentIndex].lecturerId;
  // }

  // String lectureIdFromAppointment(int appointmentIndex) {
  //   return _student.appointments[appointmentIndex].lectureId;
  // }

  // int lectureLength() {
  //   return _student.lectures.length;
  // }

  // String lectureId(int lectureIndex) {
  //   return _student.lectures[lectureIndex].id;
  // }

  // String subjectId(String lectureId) {
  //   for (var lectureIndex = 0;
  //       lectureIndex < _student.lectures.length;
  //       lectureIndex++) {
  //     if (_student.lectures[lectureIndex].id.toString() ==
  //         lectureId.toString()) {
  //       return _student.lectures[lectureIndex].subjectId;
  //     }
  //   }
  // }

  // String subjectName(String lectureId) {
  //   for (var lectureIndex = 0;
  //       lectureIndex < _student.lectures.length;
  //       lectureIndex++) {
  //     if (_student.lectures[lectureIndex].id.toString() ==
  //         lectureId.toString()) {
  //       return _student.lectures[lectureIndex].name;
  //     }
  //   }
  // }

  // String room(String lectureId) {
  //   for (var lectureIndex = 0;
  //       lectureIndex < _student.lectures.length;
  //       lectureIndex++) {
  //     if (_student.lectures[lectureIndex].id.toString() ==
  //         lectureId.toString()) {
  //       return _student.lectures[lectureIndex].room;
  //     }
  //   }
  // }

  // int day(String lectureId) {
  //   for (var lectureIndex = 0;
  //       lectureIndex < _student.lectures.length;
  //       lectureIndex++) {
  //     if (_student.lectures[lectureIndex].id.toString() ==
  //         lectureId.toString()) {
  //       switch (_student.lectures[lectureIndex].day) {
  //         case "Sun":
  //           {
  //             return 0;
  //           }
  //           break;
  //         case "Mon":
  //           {
  //             return 1;
  //           }
  //           break;
  //         case "Tue":
  //           {
  //             return 2;
  //           }
  //           break;
  //         case "Wed":
  //           {
  //             return 3;
  //           }
  //           break;
  //         case "Thu":
  //           {
  //             return 4;
  //           }
  //           break;
  //         case "Fri":
  //           {
  //             return 5;
  //           }
  //           break;
  //         case "Sat":
  //           {
  //             return 6;
  //           }
  //           break;
  //       }
  //     }
  //   }
  // }

  // int fromHr(String lectureId) {
  //   for (var lectureIndex = 0;
  //       lectureIndex < _student.lectures.length;
  //       lectureIndex++) {
  //     if (_student.lectures[lectureIndex].id.toString() ==
  //         lectureId.toString()) {
  //       String tempTime = _student.lectures[lectureIndex].from;
  //       String tempHr = tempTime.substring(0, 2);
  //       if (tempTime.substring(tempTime.length - 2) == "AM" ||
  //           (tempTime.substring(tempTime.length - 2).toString() == "PM" &&
  //               tempHr.toString() == "12")) {
  //         return int.parse(tempHr);
  //       } else {
  //         return int.parse(tempHr) + 12;
  //       }
  //     }
  //   }
  //   return 0;
  // }

  // int toHr(String lectureId) {
  //   for (var lectureIndex = 0;
  //       lectureIndex < _student.lectures.length;
  //       lectureIndex++) {
  //     if (_student.lectures[lectureIndex].id.toString() ==
  //         lectureId.toString()) {
  //       String tempTime = _student.lectures[lectureIndex].to;
  //       String tempHr = tempTime.substring(0, 2);
  //       if (tempTime.substring(tempTime.length - 2) == "AM" ||
  //           (tempTime.substring(tempTime.length - 2).toString() == "PM" &&
  //               tempHr.toString() == "12")) {
  //         return int.parse(tempHr);
  //       } else {
  //         return int.parse(tempHr) + 12;
  //       }
  //     }
  //   }
  //   return 0;
  // }

  // int fromMn(String lectureId) {
  //   for (var lectureIndex = 0;
  //       lectureIndex < _student.lectures.length;
  //       lectureIndex++) {
  //     if (_student.lectures[lectureIndex].id.toString() ==
  //         lectureId.toString()) {
  //       String temp = _student.lectures[lectureIndex].from;
  //       temp = temp.substring(3, 5);
  //       return int.parse(temp);
  //     }
  //   }
  // }

  // int toMn(String lectureId) {
  //   for (var lectureIndex = 0;
  //       lectureIndex < _student.lectures.length;
  //       lectureIndex++) {
  //     if (_student.lectures[lectureIndex].id.toString() ==
  //         lectureId.toString()) {
  //       String temp = _student.lectures[lectureIndex].to;
  //       temp = temp.substring(3, 5);
  //       return int.parse(temp);
  //     }
  //   }
  // }

  // String type(String lectureId) {
  //   for (var lectureIndex = 0;
  //       lectureIndex < _student.lectures.length;
  //       lectureIndex++) {
  //     if (_student.lectures[lectureIndex].id.toString() ==
  //         lectureId.toString()) {
  //       return _student.lectures[lectureIndex].type;
  //     }
  //   }
  // }
}
