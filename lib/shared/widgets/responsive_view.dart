import 'package:flutter/material.dart';
import 'package:money_app/shared/constants/app_values.dart';

class ResponsiveView extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const ResponsiveView({
    Key? key,
    required this.child,
    this.maxWidth = AppValues.tabletWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: child,
      ),
    );
  }
}
