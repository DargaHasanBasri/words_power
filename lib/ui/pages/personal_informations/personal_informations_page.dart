import '../../../export.dart';
import 'personal_informations_view_model.dart';

class PersonalInformationsPage extends StatefulWidget {
  const PersonalInformationsPage({super.key});

  @override
  State<PersonalInformationsPage> createState() =>
      _PersonalInformationsPageState();
}

class _PersonalInformationsPageState extends BaseStatefulState<PersonalInformationsPage> {
  late PersonalInformationsViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<PersonalInformationsViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
