class WordAndSentenceModel {
  final String userID;
  final String wordTurkish; // girilen türkçe kelime
  final String wordEnglish; // girilen inglizce kelime
  final String sentenceTurkish; // girilen türkçe cümle
  final String sentenceEnglish; // girilen inglizce cümle
  final String? coverImg; // girilen kelimenin resmi
  final String authorName; // word and sentence giren yazar adı
  final String? authorImg; // word and sentence giren yazar resmi
  final String authorID; // word and sentence giren yazar id
  final DateTime createdAt; // oluşturulduğu tarih
  final DateTime? updatedAt; // güncelleme tarihi
  final int likes;
  final int views;

  const WordAndSentenceModel({
    required this.userID,
    required this.wordTurkish,
    required this.wordEnglish,
    required this.sentenceTurkish,
    required this.sentenceEnglish,
    this.coverImg,
    required this.authorName,
    this.authorImg,
    required this.authorID,
    required this.createdAt,
    this.updatedAt,
    required this.likes,
    required this.views,
  });

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
    DateTime? createdAt,
    DateTime? updatedAt,
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

  factory WordAndSentenceModel.fromMap(Map<String, dynamic> map) {
    return WordAndSentenceModel(
      userID: map['userID'] as String,
      wordTurkish: map['wordTurkish'] as String,
      wordEnglish: map['wordEnglish'] as String,
      sentenceTurkish: map['sentenceTurkish'] as String,
      sentenceEnglish: map['sentenceEnglish'] as String,
      coverImg: map['coverImg'] as String,
      authorName: map['authorName'] as String,
      authorImg: map['authorImg'] as String,
      authorID: map['authorID'] as String,
      createdAt: map['createdAt'] as DateTime,
      updatedAt: map['updatedAt'] as DateTime,
      likes: map['likes'] as int,
      views: map['views'] as int,
    );
  }
}
