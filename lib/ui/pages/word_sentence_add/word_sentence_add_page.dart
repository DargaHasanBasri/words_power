import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:words_power/base/base_stateful_state.dart';
import 'package:words_power/models/word_and_sentence_model.dart';
import 'package:words_power/ui/pages/word_sentence_add/components/write_area.dart';
import 'package:words_power/ui/pages/word_sentence_add/word_sentence_add_view_model.dart';
import 'package:words_power/ui/widgets/custom_button.dart';
import 'package:words_power/utils/custom_colors.dart';
import 'package:words_power/utils/dialog_helper.dart';

class WordSentenceAddPage extends StatefulWidget {
  const WordSentenceAddPage({super.key});

  @override
  State<WordSentenceAddPage> createState() => _WordSentenceAddPageState();
}

class _WordSentenceAddPageState extends BaseStatefulState<WordSentenceAddPage> {
  late final WordSentenceAddViewModel vm;

  @override
  initState() {
    super.initState();
    vm = Provider.of<WordSentenceAddViewModel>(context, listen: false);
    listeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            "images/ic_back.png",
            color: CustomColors.whitePorcelain,
            height: 24,
          ),
          onPressed: () => appRoutes.popIfBackStackNotEmpty(),
        ),
        backgroundColor: CustomColors.backgroundColor,
        title: Text(
          "Word & Sentence Add",
          style: TextStyle(
            color: CustomColors.white,
          ),
        ),
        centerTitle: true,
      ),
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
                      const SizedBox(height: 20),
                      Text(
                        "Word",
                        style: TextStyle(
                          color: CustomColors.whiteSmoke,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 4),
                      WriteArea(
                        englishTextController: vm.wordEnglishTextController,
                        turkishTextController: vm.wordTurkishTextController,
                        writeEnglish: vm.wordWriteEnglish,
                        writeTurkish: vm.wordWriteTurkish,
                        titleEnglish: "English Write Word",
                        titleTurkish: "Türkçe Kelime Yaz",
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Add a picture that reminds you",
                        style: TextStyle(
                          color: CustomColors.whiteSmoke,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          debugPrint("tıklandı!!!");
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
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Container(
                            decoration: BoxDecoration(
                              color: CustomColors.whitePorcelain,
                              borderRadius: BorderRadius.circular(8),
                              image: vm.image.value != null
                                  ? DecorationImage(
                                      image:
                                          FileImage(File(vm.image.value!.path)),
                                      fit: BoxFit.cover,
                                    )
                                  : const DecorationImage(
                                      image: AssetImage(
                                        "images/ic_add_image.png",
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Sentence",
                        style: TextStyle(
                          color: CustomColors.whiteSmoke,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 4),
                      WriteArea(
                        englishTextController: vm.sentenceEnglishTextController,
                        turkishTextController: vm.sentenceTurkishTextController,
                        writeEnglish: vm.sentenceWriteEnglish,
                        writeTurkish: vm.sentenceWriteTurkish,
                        titleEnglish: "English Write Sentence",
                        titleTurkish: "Türkçe Cümle Yaz",
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Gemini Generate Example Sentence",
                        style: TextStyle(
                          color: CustomColors.whiteSmoke,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: _buildGenerateGemini(),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        onClick: () {
                          /*
                          firebaseStorageRepository
                              .storeFileToFirebase(
                            "wordAndSentence/${vm.userModel!.userID}/${DateTime.now().millisecondsSinceEpoch}",
                            File(vm.image.value?.path ?? "null geliyor"),
                          )
                              .then((value) {
                           */
                          String uid = const Uuid().v4();
                          WordAndSentenceModel wordAndSentenceModel =
                              WordAndSentenceModel(
                            userID: uid,
                            wordTurkish: "${vm.wordWriteTurkish.value}",
                            wordEnglish: "${vm.wordWriteEnglish.value}",
                            sentenceTurkish: "${vm.sentenceWriteTurkish.value}",
                            sentenceEnglish: "${vm.sentenceWriteEnglish.value}",
                            authorID: "${vm.userModel!.userID}",
                            authorName: vm.userModel!.name,
                            authorImg: "${vm.userModel!.profilePhoto}",
                            createdAt: DateTime.now(),
                            updatedAt: DateTime.now(),
                            likes: 0,
                            views: 0,
                            coverImg: "",
                          );
                          vm.addWordAndSentence(wordAndSentenceModel);
                        },
                        title: "Add",
                        borderRadius: 10,
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  Widget _buildGenerateGemini() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Ink(
            decoration: BoxDecoration(
              color: CustomColors.whitePorcelain,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Click me for example sentence",
                  style: TextStyle(
                    color: CustomColors.blueCloudBurst,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  listeners() {}
}
