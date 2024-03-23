import 'package:flutter/material.dart';

import '../../../../utils/custom_colors.dart';

class FavoriteItem extends StatelessWidget {
  final String word;
  final String sentence;
  final String imageAddress;
  final String whoPersonWrote;
  final String dateAdded;
  final String numberViews;
  const FavoriteItem({
    super.key,
    required this.word,
    required this.sentence,
    required this.imageAddress,
    required this.dateAdded,
    required this.whoPersonWrote,
    required this.numberViews,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: AspectRatio(
                aspectRatio: 0.8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(
                        imageAddress,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 8),
                Text(
                  word,
                  style: TextStyle(
                    fontSize: 22,
                    color: CustomColors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  sentence,
                  style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      whoPersonWrote,
                      style: TextStyle(
                        fontSize: 16,
                        color: CustomColors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "images/ic_favorite.png",
                        width: 20,
                        color: CustomColors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$numberViews views",
                      style: TextStyle(
                        fontSize: 14,
                        color: CustomColors.white,
                      ),
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 2,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          dateAdded,
                          style: TextStyle(
                            fontSize: 14,
                            color: CustomColors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
