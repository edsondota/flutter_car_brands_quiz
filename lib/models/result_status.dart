enum ResultStatus {
  zero,
  bad,
  good,
  excellent,
}

extension ResultStatusText on ResultStatus {
  String description() {
    switch (this) {
      case ResultStatus.zero:
        return 'You missed all the answers. Don\'t be sad, you can try again!';
      case ResultStatus.bad:
        return 'You got some answers right, I believe you are on the right track, try again!';
      case ResultStatus.good:
        return 'Very well! You almost got all the questions right, try again whenever you want.';
      case ResultStatus.excellent:
        return 'Do you work with cars? Congratulations, you got all the questions right!';
      default:
        return 'You missed all the answers. Don\'t be sad, you can try again!';
    }
  }
}
