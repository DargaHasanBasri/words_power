import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:words_power/ui/pages/main_tab/main_tab_provider.dart';
import 'package:words_power/ui/pages/welcome/welcome_provider.dart';

import '../services/authentication_service.dart';
import '../services/localstorage_service.dart';
import '../utils/custom_colors.dart';
import '../utils/firebase_storage_repository.dart';
import '../utils/utility.dart';

abstract class BaseStatefulState<T extends StatefulWidget> extends State<T> {
  Utility utility = Utility();
  AuthenticationService userInfo = AuthenticationService();
  FirebaseStorageRepository firebaseStorageRepository =
      FirebaseStorageRepository();

  LocalStorageService localStorage = LocalStorageService();

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
    try {
      if (_progressOverlayEntry != null && _progressOverlayEntry!.mounted) {
        _progressOverlayEntry!.remove();
        _progressOverlayEntry = null;
      }
    } catch (e) {
      //
    }
  }

  void startTimer() {
    if (_timeoutTimer != null) _timeoutTimer!.cancel();
    const oneSec = const Duration(seconds: 1);
    _timeoutTimer = new Timer.periodic(
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
              color: Colors.black.withOpacity(0.4),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: CustomColors.buttonBackground,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
