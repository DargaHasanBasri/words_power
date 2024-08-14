import 'package:flutter/material.dart';

final class AppPaddings {
  AppPaddings._();

  static const pagePaddingAll = EdgeInsets.all(20);

  static const pagePaddingAllMiddle = EdgeInsets.all(10);

  static const pagePaddingSymmetricXLarge = EdgeInsets.symmetric(
    vertical: 20,
    horizontal: 20,
  );
  static const pagePaddingSymmetric = EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 24,
  );
  static const pagePaddingSymmetricSmall = EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 10,
  );

  static const pagePaddingHorizontal = EdgeInsets.symmetric(
    horizontal: 20,
  );

  static const pagePaddingHorizontalLarge = EdgeInsets.symmetric(
    horizontal: 16,
  );
  static const pagePaddingHorizontalMiddle = EdgeInsets.symmetric(
    horizontal: 10,
  );
  static const pagePaddingHorizontalSmall = EdgeInsets.symmetric(
    horizontal: 8,
  );

  static const pagePaddingVertical = EdgeInsets.symmetric(
    vertical: 20,
  );

  static const pagePaddingVerticalLarge = EdgeInsets.symmetric(
    vertical: 16,
  );

  static const pagePaddingVerticalSmall = EdgeInsets.symmetric(
    vertical: 10,
  );

  static const pagePaddingOnlyTopLeft = EdgeInsets.only(
    top: 20,
    left: 24,
  );
  static const pagePaddingOnlyBottom = EdgeInsets.only(
    bottom: 12,
  );
}
