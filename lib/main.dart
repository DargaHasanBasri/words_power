import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:words_power/firebase_options.dart';
import 'package:words_power/ui/pages/home/home_provider.dart';
import 'package:words_power/ui/pages/main_tab/main_tab_provider.dart';
import 'package:words_power/ui/pages/welcome/welcome_provider.dart';
import 'package:words_power/ui/pages/word_sentence_add/word_sentence_add_provider.dart';
import 'package:words_power/ui/pages/word_sentence_add/word_sentence_add_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Words Power',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomeProvider(),
    );
  }
}
