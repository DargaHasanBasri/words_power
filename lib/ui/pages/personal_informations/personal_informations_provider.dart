import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/personal_informations/personal_informations_page.dart';
import 'package:words_power/ui/pages/personal_informations/personal_informations_view_model.dart';

class PersonalInformationsProvider extends StatelessWidget {
  const PersonalInformationsProvider(this.userModel, {super.key});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return PersonalInformationsViewModel(userModel);
      },
      child: const PersonalInformationsPage(),
    );
  }
}
