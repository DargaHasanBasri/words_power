import '../../../export.dart';
import 'personal_informations_page.dart';
import 'personal_informations_view_model.dart';

class PersonalInformationsProvider extends StatelessWidget {
  final UserModel? userModel;
  const PersonalInformationsProvider(this.userModel, {super.key});

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
