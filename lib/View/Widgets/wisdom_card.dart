import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wisdom_of_the_day/Model/Models/wisdom_model.dart';
import 'package:wisdom_of_the_day/View/Widgets/loading_indicator.dart';

class WisdomCard extends StatelessWidget {
  final WisdomModel wisdom;
  const WisdomCard({
    Key? key,
    required this.wisdom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isArabic = Get.locale?.languageCode == 'ar';
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListTile(
          iconColor: isDark ? Colors.white : null,
          textColor: isDark ? Colors.white : null,
          leading: Container(
            width: 60,
            height: 60,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl: wisdom.image,
              fit: BoxFit.cover,
              placeholder: (_, __) => const LoadingIndicator(),
              errorWidget: (_, __, ____) => const Icon(Icons.image_outlined),
            ),
          ),
          title: Text(
            '"${isArabic ? wisdom.quoteAr : wisdom.quoteEn}."',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            isArabic ? wisdom.authorAr : wisdom.authorEn,
            style: const TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
