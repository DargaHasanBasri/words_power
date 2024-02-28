import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../utils/custom_colors.dart';

class RecentlyAddedItem extends StatelessWidget {
  final String wordAdded;
  final String sentencesAdded;
  final String byUserName;
  final String dateAdded;
  final String imagesAdded;

  const RecentlyAddedItem(
      {super.key,
      required this.wordAdded,
      required this.sentencesAdded,
      required this.imagesAdded,
      required this.byUserName,
      required this.dateAdded});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.blueBall,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 18),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wordAdded,
                      style: TextStyle(
                        color: CustomColors.whiteSmoke,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      sentencesAdded,
                      style: TextStyle(
                        color: CustomColors.whiteSmoke,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                    const Spacer(),
                    Text(
                      byUserName,
                      style: TextStyle(
                        color: CustomColors.backgroundColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          dateAdded,
                          style: TextStyle(
                            color: CustomColors.textFormFieldBorderColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          "images/ic_favorite.png",
                          width: 30,
                          color: CustomColors.whiteSmoke,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AspectRatio(
                  aspectRatio: 9 / 16,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(imagesAdded),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
