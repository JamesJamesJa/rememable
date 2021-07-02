import 'flashcard.dart';
import 'review.dart';

class User {
  final String id;
  final String name;
  final String email;
  final List<Review> reviewList;
  final List<Flashcard> ownFlashcardList;
  final List<Flashcard> favList;
  final List<Flashcard> studiedOwner;

  const User({
    this.id,
    this.name,
    this.email,
    this.reviewList,
    this.ownFlashcardList,
    this.favList,
    this.studiedOwner,
  });
}

// class LectureDetails {
//   final String id;
//   final String subjectId;
//   final String name;
//   final String room;
//   final String day;
//   final String from;
//   final String to;
//   final String type;
//   const LectureDetails({
//     this.id,
//     this.subjectId,
//     this.name,
//     this.room,
//     this.day,
//     this.from,
//     this.to,
//     this.type,
//   });
// }

// class FavoriteLectureLists {
//   final String lectureId;
//   const FavoriteLectureLists({
//     this.lectureId,
//   });
// }

// class AppointmentDetails {
//   final String id;
//   final String lectureId;
//   final String lecturerId;
//   final String status;
//   const AppointmentDetails({
//     this.id,
//     this.lectureId,
//     this.lecturerId,
//     this.status,
//   });
// }
