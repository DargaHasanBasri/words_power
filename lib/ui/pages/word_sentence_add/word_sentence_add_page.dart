import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:words_power/export.dart';
import 'package:words_power/ui/pages/word_sentence_add/word_sentence_add_view_model.dart';

class WordSentenceAddPage extends StatefulWidget {
  const WordSentenceAddPage({super.key});

  @override
  State<WordSentenceAddPage> createState() => _WordSentenceAddPageState();
}

class _WordSentenceAddPageState extends BaseStatefulState<WordSentenceAddPage> {
  late final WordSentenceAddViewModel vm;

  TextEditingController _wordEnTextController = TextEditingController();
  TextEditingController _wordTrTextController = TextEditingController();
  TextEditingController _sentenceEnTextController = TextEditingController();
  TextEditingController _sentenceTrTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    vm = Provider.of<WordSentenceAddViewModel>(context, listen: false);
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: ValueListenableBuilder(
              valueListenable: vm.image,
              builder: (_, __, ___) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _wordTrTextController,
                      borderRadius: 10,
                      textFieldName: 'Türkçe Kelime',
                      hintText: 'Örneğin: Elma ',
                      onChanged: (String value) {
                        vm.wordAndSentenceModelNotifier.value.wordTurkish =
                            _wordTrTextController.text;
                      },
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _wordEnTextController,
                      borderRadius: 10,
                      textFieldName: 'İngilizce Kelime',
                      hintText: 'Example: Apple ',
                      onChanged: (String value) {
                        vm.wordAndSentenceModelNotifier.value.wordEnglish =
                            _wordEnTextController.text;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _sentenceTrTextController,
                      borderRadius: 10,
                      textFieldName: 'Türkçe Cümle',
                      hintText: 'Örneğin: Eve elma al',
                      onChanged: (String value) {
                        vm.wordAndSentenceModelNotifier.value.sentenceTurkish =
                            _sentenceTrTextController.text;
                      },
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _sentenceEnTextController,
                      borderRadius: 10,
                      textFieldName: 'İngilizce Cümle',
                      hintText: 'Örneğin: Buy apples home',
                      onChanged: (String value) {
                        vm.wordAndSentenceModelNotifier.value.sentenceEnglish =
                            _sentenceEnTextController.text;
                      },
                    ),
                    const SizedBox(height: 20),
                    addExampleFoto(context),
                    const SizedBox(height: 20),
                    CustomButton(
                      onClick: () async {
                        vm.wordAndSentenceModelNotifier.value.createdAt =
                            Timestamp.now();
                        vm.wordAndSentenceModelNotifier.value.updatedAt =
                            Timestamp.now();
                        vm.wordAndSentenceModelNotifier.value.authorID =
                            '${vm.userModel!.userID}';
                        vm.wordAndSentenceModelNotifier.value.userID =
                            '${vm.uid}';
                        debugPrint('${vm.uid}');
                        vm.wordAndSentenceModelNotifier.value.authorName =
                            vm.userModel!.name;
                        vm.wordAndSentenceModelNotifier.value.authorImg =
                            '${vm.userModel!.profilePhoto}';
                        vm.wordAndSentenceModelNotifier.value.likes = 0;
                        vm.wordAndSentenceModelNotifier.value.views = 0;
                        await vm.addWordAndSentence(
                          vm.wordAndSentenceModelNotifier.value,
                        );
                        appRoutes.navigateTo(Routes.mainTab);
                      },
                      title: 'Add',
                      borderRadius: 10,
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      forceMaterialTransparency: true,
      elevation: 0,
      leading: IconButton(
        icon: Image.asset(
          'images/ic_back.png',
          color: CustomColors.black,
          height: 24,
        ),
        onPressed: appRoutes.popIfBackStackNotEmpty,
      ),
      title: Text(
        'Add Word And Sentence',
        style: TextStyle(
          color: CustomColors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget addExampleFoto(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DialogHelper.isImageSource(
          context,
          () {
            vm.pickImage(ImageSource.camera);
            appRoutes.popIfBackStackNotEmpty();
          },
          () {
            vm.pickImage(ImageSource.gallery);
            appRoutes.popIfBackStackNotEmpty();
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0x00000000).withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            vm.isImgPathNull()
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.file(
                        File(vm.image.value!.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/ic_add_foto.png'),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Add a picture that reminds you',
                            style: TextStyle(
                              color: CustomColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void listeners() {}
}
