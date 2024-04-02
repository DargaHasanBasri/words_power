import '../../../export.dart';
import 'personal_informations_page.dart';

mixin PersonalInformationsPageMixin on State<PersonalInformationsPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}
