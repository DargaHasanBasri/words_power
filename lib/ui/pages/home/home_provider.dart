import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_power/ui/pages/home/home_page.dart';
import 'package:words_power/ui/pages/home/home_view_model.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return HomeViewModel();
      },
      child: const HomePage(),
    );
  }
}
