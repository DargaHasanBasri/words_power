import 'package:firebase_auth/firebase_auth.dart';
import 'package:words_power/base/api_base/api_base.dart';
import 'package:words_power/export.dart';

class Repository {
  final ApiBase _api = ApiBase();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addWordAndSentence(WordAndSentenceModel model) async {
    try {
      if (model.userID != null) {
        await _api.addDocument('wordAndSentence', model.userID!, model.toMap());

        await _api.addSubCollection(
          'users',
          _auth.currentUser!.uid,
          'wordAndSentence',
          model.userID,
          model.toMap(),
        );
      }
    } catch (e) {
      print("Error removing follower: $e");
    }
  }

  Stream<List<WordAndSentenceModel>> getUserPosts(String userId) {
    return _api
        .getSubCollectionDocuments(
          'users',
          userId,
          'wordAndSentence',
        )
        .map(
          (data) =>
              data.map((doc) => WordAndSentenceModel.fromMap(doc)).toList(),
        );
  }

  Stream<List<WordAndSentenceModel>> getAllPosts() {
    return _api.getDocuments('wordAndSentence').map((data) =>
        data.map((doc) => WordAndSentenceModel.fromMap(doc)).toList());
  }

  Stream<List<UserModel>> getFollowedUsers(List<String> followedUserIds) {
    return _api.getDocuments('users').map((data) => data
        .map((doc) => UserModel.fromMap(doc))
        .where((user) => followedUserIds.contains(user.userID))
        .toList());
  }

  Stream<List<UserModel>> getTop100Users() {
    return _api.getDocuments('users').map((data) {
      List<UserModel> users =
          data.map((doc) => UserModel.fromMap(doc)).toList();

      users.sort((a, b) {
        int aScore = a.score ?? 0;
        int bScore = b.score ?? 0;
        return bScore.compareTo(aScore);
      });

      return users.take(100).toList();
    });
  }

  Future<void> addFollowing(
    String currentUserId,
    String followUserId,
  ) async {
    try {
      final user = await getUser(currentUserId);
      if (user != null && !user.followings!.contains(followUserId)) {
        user.followings!.add(followUserId);
        await updateDocumentField(
            'users', currentUserId, 'followings', user.followings);
      }
    } catch (e) {
      print("Error adding following: $e");
    }
  }

  Future<void> addFollower(
    String followUserId,
    String currentUserId,
  ) async {
    try {
      final user = await getUser(followUserId);
      if (user != null && !user.followers!.contains(currentUserId)) {
        user.followers!.add(currentUserId);
        await updateDocumentField(
            'users', followUserId, 'followers', user.followers);
      }
    } catch (e) {
      print("Error adding follower: $e");
    }
  }

  Future<void> removeFollowing(
    String currentUserId,
    String unfollowUserId,
  ) async {
    try {
      final user = await getUser(currentUserId);
      if (user != null && user.followings != null) {
        user.followings!.remove(unfollowUserId);
        await updateDocumentField(
            'users', currentUserId, 'followings', user.followings);
      }
    } catch (e) {
      print("Error removing following: $e");
    }
  }

  Future<void> removeFollower(
    String unfollowUserId,
    String currentUserId,
  ) async {
    try {
      final user = await getUser(unfollowUserId);
      if (user != null && user.followers != null) {
        user.followers!.remove(currentUserId);
        await updateDocumentField(
            'users', unfollowUserId, 'followers', user.followers);
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
