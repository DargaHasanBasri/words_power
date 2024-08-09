import 'package:words_power/base/api_base/api_base.dart';
import 'package:words_power/export.dart';

class Repository {
  final ApiBase _api = ApiBase();

  Stream<List<WordAndSentenceModel>> getProducts() {
    return _api.getDocuments('wordAndSentence').map((data) =>
        data.map((doc) => WordAndSentenceModel.fromMap(doc)).toList());
  }

  Stream<List<UserModel>> getUsers() {
    return _api
        .getDocuments('users')
        .map((data) => data.map((doc) => UserModel.fromMap(doc)).toList());
  }

  Stream<List<UserModel>> getFollowedUsers(List<String> followedUserIds) {
    return _api.getDocuments('users').map((data) => data
        .map((doc) => UserModel.fromMap(doc))
        .where((user) => followedUserIds.contains(user.userID))
        .toList());
  }

  Future<void> removeFollowing(String currentUserId, String unfollowUserId) async {
    try {
      final user = await getUser(currentUserId);
      if (user != null && user.followings != null) {
        user.followings!.remove(unfollowUserId);
        await updateDocumentField('users', currentUserId, 'followings', user.followings);
      }
    } catch (e) {
      print("Error removing following: $e");
    }
  }

  Future<void> removeFollower(String unfollowUserId, String currentUserId) async {
    try {
      final user = await getUser(unfollowUserId);
      if (user != null && user.followers != null) {
        user.followers!.remove(currentUserId);
        await updateDocumentField('users', unfollowUserId, 'followers', user.followers);
      }
    } catch (e) {
      print("Error removing follower: $e");
    }
  }



  Future<UserModel?> getUser(String userId) async {
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

  Future<void> updateDocumentField(
    String collectionPath,
    String docId,
    String fieldName,
    dynamic value,
  ) async {
    try {
      await _api.updateDocument(
        collectionPath,
        docId,
        {fieldName: value},
      );
    } catch (e) {
      print("Error updating document field: $e");
    }
  }

  Future<String?> uploadImage(
    File file,
    String docId,
    String storageFileName,
  ) async {
    try {
      String storagePath =
          '$storageFileName/$docId/${file.path.split('/').last}';
      return await _api.uploadFile(file.path, storagePath);
    } catch (e) {
      print("Error uploading word and sentence image: $e");
      return null;
    }
  }
}
