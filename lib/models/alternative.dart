class Alternative {
  String title;
  bool isSelected;
  bool isCorrect;

  Alternative({
    this.title,
    this.isCorrect = false,
    this.isSelected = false,
  });

  factory Alternative.fromJson(Map<String, dynamic> json) {
    return Alternative(
      title: json['title'] as String,
      isCorrect: json['isCorrect'] as bool,
    );
  }
}
