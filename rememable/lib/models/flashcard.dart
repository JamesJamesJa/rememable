import 'package:rememable/models/review.dart';

import 'question.dart';

class Flashcard {
  final String id;
  final String name;
  final String category;
  final String description;
  final String coverImage;
  final double rating;
  final int reviewAmount;
  final String ownerFlashcardId;
  final String ownerFlashcardName;
  final List<Question> questionList;
  final List<String> favOwner;
  final List<Review> reviewListId;
  final List<String> studiedFlashcardId;
  const Flashcard({
    this.id,
    this.name,
    this.category,
    this.description,
    this.coverImage,
    this.rating,
    this.reviewAmount,
    this.ownerFlashcardId,
    this.ownerFlashcardName,
    this.questionList,
    this.favOwner,
    this.reviewListId,
    this.studiedFlashcardId,
  });
}

// favList.add(new Flashcard(
//           id: data['fav_list'][i]['id'],
//           name: data['fav_list'][i]['flashcard_name'],
//           category: data['fav_list'][i]['category'],
//           // coverImage: data['fav_list'][i]['coverImage'],
//           rating: data['fav_list'][i]['rating'],
//           reviewAmount: data['fav_list'][i]['review_amount'],
//           ownerFlashcardId: data['fav_list'][i]['owner_flashcard'],
//           questionList: new List<Question>(),
//           favOwner: new List<String>(),
//           reviewListId: new List<String>(),
//           studiedFlashcardId: new List<String>(),
//         ));

// reviewList.add(
//   new Review(
//   id: data['review_list'][i]['id'],
//   flashcardOwnerId: data['review_list'][i]['user_id'],
//   comment: data['review_list'][i]['comment'],
//   rating: data['review_list'][i]['rating'],
// ));
