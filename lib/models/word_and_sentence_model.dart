import 'package:cloud_firestore/cloud_firestore.dart';

class WordAndSentenceModel {
  WordAndSentenceModel({
    this.userID,
    this.wordTurkish,
    this.wordEnglish,
    this.sentenceTurkish,
    this.sentenceEnglish,
    this.authorName,
    this.authorID,
    this.createdAt,
    this.likes,
    this.views,
    this.coverImg,
    this.authorImg,
    this.updatedAt,
  });

  factory WordAndSentenceModel.fromMap(Map<String, dynamic> map) {
    return WordAndSentenceModel(
      userID: map['userID'] as String? ?? '',
      wordTurkish: map['wordTurkish'] as String? ?? '',
      wordEnglish: map['wordEnglish'] as String? ?? '',
      sentenceTurkish: map['sentenceTurkish'] as String? ?? '',
      sentenceEnglish: map['sentenceEnglish'] as String? ?? '',
      coverImg: map['coverImg'] as String? ?? '',
      authorName: map['authorName'] as String? ?? '',
      authorImg: map['authorImg'] as String? ?? '',
      authorID: map['authorID'] as String? ?? '',
      createdAt: map['createdAt'] as Timestamp? ?? Timestamp.now(),
      updatedAt: map['updatedAt'] as Timestamp? ?? Timestamp.now(),
      likes: map['likes'] as int? ?? 0,
      views: map['views'] as int? ?? 0,
    );
  }

  String? userID;
  String? wordTurkish; // girilen türkçe kelime
  String? wordEnglish; // girilen ingilizce kelime
  String? sentenceTurkish; // girilen türkçe cümle
  String? sentenceEnglish; // girilen ingilizce cümle
  String? coverImg; // girilen kelimenin resmi
  String? authorName; // word and sentence giren yazar adı
  String? authorImg; // word and sentence giren yazar resmi
  String? authorID; // word and sentence giren yazar id
  Timestamp? createdAt; // oluşturulduğu tarih
  Timestamp? updatedAt; // güncelleme tarihi
  int? likes;
  int? views;

  WordAndSentenceModel copyWith({
    String? userID,
    String? wordTurkish,
    String? wordEnglish,
    String? sentenceTurkish,
    String? sentenceEnglish,
    String? coverImg,
    String? authorName,
    String? authorImg,
    String? authorID,
    Timestamp? createdAt,
    Timestamp? updatedAt,
    int? likes,
    int? views,
  }) {
    return WordAndSentenceModel(
      userID: userID ?? this.userID,
      wordTurkish: wordTurkish ?? this.wordTurkish,
      wordEnglish: wordEnglish ?? this.wordEnglish,
      sentenceTurkish: sentenceTurkish ?? this.sentenceTurkish,
      sentenceEnglish: sentenceEnglish ?? this.sentenceEnglish,
      coverImg: coverImg ?? this.coverImg,
      authorName: authorName ?? this.authorName,
      authorImg: authorImg ?? this.authorImg,
      authorID: authorID ?? this.authorID,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      likes: likes ?? this.likes,
      views: views ?? this.views,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'wordTurkish': wordTurkish,
      'wordEnglish': wordEnglish,
      'sentenceTurkish': sentenceTurkish,
      'sentenceEnglish': sentenceEnglish,
      'coverImg': coverImg,
      'authorName': authorName,
      'authorImg': authorImg,
      'authorID': authorID,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'likes': likes,
      'views': views,
    };
  }
}
