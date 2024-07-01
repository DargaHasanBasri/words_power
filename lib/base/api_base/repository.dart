import 'package:words_power/base/api_base/api_base.dart';
import 'package:words_power/export.dart';

class Repository {
  final ApiBase _api = ApiBase();

  Stream<List<WordAndSentenceModel>> getProducts() {
    return _api.getDocuments('wordAndSentence').map((data) =>
        data.map((doc) => WordAndSentenceModel.fromMap(doc)).toList());
  }

  Future<UserModel?> getUsers(String userId) async {
    try {
      final data = await _api.getDocumentById('users', userId);
      if (data != null) {
        return UserModel.fromMap(data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
