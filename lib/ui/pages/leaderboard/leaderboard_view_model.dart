import 'package:flutter/cupertino.dart';
import 'package:words_power/base/base_view_model.dart';

class LeaderboardViewModel extends BaseViewModel {
  ValueNotifier<int> currentTabIndex = ValueNotifier(1);
}
