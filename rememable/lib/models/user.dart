class User {
  final String id;
  final String name;
  final String email;
  final List<String> reviewList;
  final List<String> ownFlashcardList;
  final List<String> favList;
  final List<String> studiedOwner;

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
