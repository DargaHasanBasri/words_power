import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/personal_informations/personal_informations_page.dart';

mixin PersonalInformationsPageMixin on State<PersonalInformationsPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
