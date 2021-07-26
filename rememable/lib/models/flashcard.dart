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
  final String ownerFlashcardName;
  final List<Question> questionList;
  final List<Review> reviewListId;
  const Flashcard({
    this.id,
    this.name,
    this.category,
    this.description,
    this.coverImage,
    this.rating,
    this.reviewAmount,
    this.ownerFlashcardName,
    this.questionList,
    this.reviewListId,
  });
}
