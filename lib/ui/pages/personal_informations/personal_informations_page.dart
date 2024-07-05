import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/personal_informations/personal_informations_page_mixin.dart';
import 'package:words_power/ui/pages/personal_informations/personal_informations_view_model.dart';

class PersonalInformationsPage extends StatefulWidget {
  const PersonalInformationsPage({super.key});

  @override
  State<PersonalInformationsPage> createState() =>
      _PersonalInformationsPageState();
}

class _PersonalInformationsPageState
    extends BaseStatefulState<PersonalInformationsPage>
    with PersonalInformationsPageMixin {
  late PersonalInformationsViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = Provider.of<PersonalInformationsViewModel>(context, listen: false);
    emailController.text = vm.userModel?.email ?? 'null';
    fullNameController.text = vm.userModel?.name ?? 'null';
    userNameController.text = vm.userModel?.name ?? 'null';
    passwordController.text = vm.userModel?.password ?? 'null';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerRight,
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: ProjectPadding.pagePaddingVerticalLarge,
                    child: _userInfoContainer(
                      vm.userModel?.name ?? 'NULL',
                      'UI/UX Designer',
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 50,
                    child: _userProfile(),
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: vm.userNewModel,
                builder: (_, __, ___) {
                  return Padding(
                    padding: ProjectPadding.pagePaddingSymmetricXLarge,
                    child: _userInfo(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userInfo() {
    return Column(
      children: [
        CustomTextFormField(
          controller: emailController,
          textFieldName: 'Email',
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: fullNameController,
          textFieldName: 'Full Name',
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: userNameController,
          textFieldName: 'User Name',
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          controller: passwordController,
          textFieldName: 'Password',
        ),
        const SizedBox(height: 50),
        CustomButton(
          onClick: () async {
            debugPrint('Update tıklantı');
            final UserModel model = UserModel(
              password: passwordController.text,
              email: emailController.text,
              name: fullNameController.text,
              profilePhoto: vm.userModel?.profilePhoto,
              userID: vm.userModel?.userID,
            );
            await vm.updateUserInfo(model);
            await vm.uploadProfileImage();
            appRoutes.navigateToReplacement(Routes.mainTab);
          },
          title: 'Update',
        ),
      ],
    );
  }

  Widget _userProfile() {
    return ValueListenableBuilder(
      valueListenable: vm.image,
      builder: (_, __, ___) {
        return Stack(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 120,
              width: 110,
              decoration: BoxDecoration(
                color: CustomColors.white,
                borderRadius: BorderRadius.circular(2),
                image: vm.image.value != null
                    ? DecorationImage(
                        image: FileImage(File(vm.image.value!.path)),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: CachedNetworkImageProvider(
                          vm.userModel?.profilePhoto ?? 'Null',
                        ),
                        fit: BoxFit.cover,
                      ),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.black,
                    offset: const Offset(5, 5),
                    blurRadius: 3,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: -20,
              child: CircleAvatar(
                child: IconButton(
                  onPressed: () {
                    debugPrint('edit tıklandı');
                    DialogHelper.isImageSource(
                      context,
                      () async {
                        await vm.pickImage(ImageSource.camera);
                        appRoutes.popIfBackStackNotEmpty();
                      },
                      () async {
                        await vm.pickImage(ImageSource.gallery);
                        appRoutes.popIfBackStackNotEmpty();
                      },
                    );
                  },
                  icon: Image.asset(
                    'images/ic_edit.png',
                    height: 30,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _userInfoContainer(String? name, String? job) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColors.backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColors.black,
            offset: const Offset(5, 3),
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: ProjectPadding.pagePaddingSymmetricXLarge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name ?? '',
              style: TextStyle(
                color: CustomColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              job ?? '',
              style: TextStyle(
                color: CustomColors.white.withOpacity(0.5),
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Image.asset(
          'images/ic_back.png',
          color: CustomColors.whitePorcelain,
          height: 24,
        ),
        onPressed: appRoutes.popIfBackStackNotEmpty,
      ),
      backgroundColor: CustomColors.backgroundColor,
      title: Text(
        'Kişisel Bilgilerim',
        style: TextStyle(
          color: CustomColors.white,
        ),
      ),
      centerTitle: true,
    );
  }
}
