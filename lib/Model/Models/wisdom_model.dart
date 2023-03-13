class WisdomModel {
  final String quoteEn;
  final String quoteAr;
  final String authorEn;
  final String authorAr;
  final String image;

  const WisdomModel({
    required this.quoteEn,
    required this.quoteAr,
    required this.authorEn,
    required this.authorAr,
    required this.image,
  });

  static WisdomModel fromJson(Map<String, dynamic> json) => WisdomModel(
        quoteEn: json['quoteEn'],
        quoteAr: json['quoteAr'],
        authorEn: json['authorEn'],
        authorAr: json['authorAr'],
        image: json['image'],
      );

  static Map<String, dynamic> toJson(WisdomModel model) => {
        "quoteEn": model.quoteEn,
        "quoteAr": model.quoteAr,
        "authorEn": model.authorEn,
        "authorAr": model.authorAr,
        "image": model.image,
      };
}
