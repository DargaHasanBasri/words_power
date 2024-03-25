import '../../../export.dart';
import 'register_page.dart';
import 'register_view_model.dart';

class RegisterProvider extends StatelessWidget {
  const RegisterProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return RegisterViewModel();
      },
      child: const RegisterPage(),
    );
  }
}
