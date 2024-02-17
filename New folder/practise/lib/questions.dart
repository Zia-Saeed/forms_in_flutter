class QuizQuestions {
  const QuizQuestions(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> getShuffledAnswer() {
    final List<String> shuffledList = answers;
    shuffledList.shuffle();
    return shuffledList;
  }
}
