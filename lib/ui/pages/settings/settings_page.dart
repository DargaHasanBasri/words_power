import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/settings/components/settings_item.dart';
import 'package:words_power/ui/pages/settings/settings_view_model.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends BaseStatefulState<SettingsPage> {
  late final SettingsViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<SettingsViewModel>(context, listen: false);
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.8,

            /// Container yerine coloredBox önerildi
            child: ColoredBox(
              color: AppColors.backgroundColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 24),
                child: _buildUserProfile(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.whitePorcelain,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: _buildSettingsItems(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItems() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blueCloudBurst.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            SettingsItem(
              title: 'Kişisel Bilgilerim',
              onClick: () {
                const Text('Kişisel Bilgilerim tıklandı!!!');
                appRoutes.navigateTo(
                  Routes.personalInformations,
                  arguments: vm.userModel,
                );
              },
              iconAddress: 'images/ic_person_info.png',
            ),
            const SizedBox(height: 30),
            SettingsItem(
              title: 'Güvenlik ve Gizlilik',
              onClick: () {
                const Text('Güvenlik ve Gizlilik tıklandı!!!');
              },
              iconAddress: 'images/ic_security.png',
            ),
            const SizedBox(height: 30),
            SettingsItem(
              title: 'FAQ',
              onClick: () {
                const Text('FAQ tıklandı!!!');
              },
              iconAddress: 'images/ic_faq.png',
            ),
            const SizedBox(height: 30),
            SettingsItem(
              title: 'About',
              onClick: () {
                const Text('About tıklandı!!!');
              },
              iconAddress: 'images/ic_about.png',
            ),
            const SizedBox(height: 30),
            SettingsItem(
              title: 'Log out',
              onClick: () async {
                await vm.logOut();
                await appRoutes.navigateTo(
                  Routes.login,
                  arguments: false,
                );
                const Text('Log out tıklandı!!!');
              },
              iconAddress: 'images/ic_log_out.png',
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfile() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.backgroundColor.withOpacity(0.5),
          radius: 56,
          child: CircleAvatar(
            radius: 54,
            backgroundImage: CachedNetworkImageProvider(
              vm.userModel?.profilePhoto ?? 'Null',
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          vm.userModel?.name ?? 'NULL',
          style: TextStyle(
            fontSize: 22,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  void listeners() {}
}
