import 'dart:ffi';
import 'question.dart';

class Flashcard {
  final String id;
  final String name;
  final String category;
  final String coverImage;
  final Float rating;
  final int review_amount;
  final String ownerFlashcardId;
  final List<Question> questionList;
  final List<String> favOwner;
  final List<String> reviewListId;
  final List<String> studiedFlashcardId;
  const Flashcard({
    this.id,
    this.name,
    this.category,
    this.coverImage,
    this.rating,
    this.review_amount,
    this.ownerFlashcardId,
    this.questionList,
    this.favOwner,
    this.reviewListId,
    this.studiedFlashcardId,
  });
}
