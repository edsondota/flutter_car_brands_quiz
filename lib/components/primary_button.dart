import 'package:flutter/material.dart';
import 'package:flutter_car_brands_quiz/shared/constants.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  PrimaryButton({
    @required this.child,
    @required this.onPressed,
  })  : assert(child != null),
        assert(onPressed != null),
        super();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: kButtonBorderRadius,
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: child,
        textColor: Colors.white,
      ),
    );
  }
}
