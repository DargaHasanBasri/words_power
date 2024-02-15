import 'package:flutter/cupertino.dart';
import 'package:words_power/base/base_view_model.dart';
import 'package:words_power/ui/pages/category/category_provider.dart';
import 'package:words_power/ui/pages/home/home_provider.dart';
import 'package:words_power/ui/pages/onboarding/onboarding_provider.dart';

class MainTabViewModel extends BaseViewModel {
  List pages = [
    const HomeProvider(),
    const CategoryProvider(),
    const OnboardingProvider(),
    const HomeProvider(),
  ];

  ValueNotifier<int> currentIndex = ValueNotifier(0);
}
