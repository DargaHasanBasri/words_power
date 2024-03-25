import '../../../export.dart';
import 'package:words_power/base/base_view_model.dart';

class RegisterViewModel extends BaseViewModel {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  TextEditingController controllerMailAddress = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  ValueNotifier<String> name = ValueNotifier("");
  ValueNotifier<String> mailAddress = ValueNotifier("");
  ValueNotifier<String> password = ValueNotifier("");
  ValueNotifier<bool> isRegister = ValueNotifier(false);

  bool isEmpty() =>
      mailAddress.value.isNotEmpty &&
      password.value.isNotEmpty &&
      name.value.isNotEmpty;

  Future<void> register() async {
    if (isEmpty()) {
      isRegister.value = await AuthenticationService().signUp(
        email: mailAddress.value,
        password: password.value,
        userName: name.value,
      );
    }
  }
}
