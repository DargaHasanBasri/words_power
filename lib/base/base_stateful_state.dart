import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:words_power/base/api_base/repository.dart';
import 'package:words_power/route/app_routes.dart';
import 'package:words_power/services/localstorage_service.dart';
import 'package:words_power/services/service_locator.dart';
import 'package:words_power/utils/firebase_storage_repository.dart';

import '../export.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  Utility utility = Utility();
  LocalStorageService localStorage = LocalStorageService();
  final AppRoutes appRoutes = locator<AppRoutes>();
  final Repository repository = locator<Repository>();
  AuthenticationService userInfo = AuthenticationService();
  FirebaseStorageRepository firebaseStorageRepository =
      FirebaseStorageRepository();
  final firebaseAuth = FirebaseAuth.instance;

  late OverlayEntry? _progressOverlayEntry;
  BuildContext? progressContext;
  Timer? _timeoutTimer;
  static const TIMEOUT = 14;
  int _start = TIMEOUT;

  @override
  void initState() {
    super.initState();
    _progressOverlayEntry = null;
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Widget showProgress(BuildContext context) {
    if (_progressOverlayEntry != null) {
      return Container();
    }
    _progressOverlayEntry = _createdProgressEntry(context);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(_progressOverlayEntry!);
      startTimer();
    });

    return Container();
  }

  void hideProgress() {
    if (_progressOverlayEntry != null && _progressOverlayEntry!.mounted) {
      _progressOverlayEntry!.remove();
      _progressOverlayEntry = null;
    }
  }

  void startTimer() {
    if (_timeoutTimer != null) _timeoutTimer!.cancel();
    const oneSec = Duration(seconds: 1);
    _timeoutTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          _start = TIMEOUT;
          if (_progressOverlayEntry != null) hideProgress();
          timer.cancel();
        } else {
          _start--;
        }
      },
    );
  }

  OverlayEntry _createdProgressEntry(BuildContext context) => OverlayEntry(
        builder: (BuildContext context) => Stack(
          children: <Widget>[
            Container(
              color: AppColors.black.withOpacity(0.4),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: AppColors.buttonBackground,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
