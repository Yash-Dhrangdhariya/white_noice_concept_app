import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sprintf/sprintf.dart';

import '../../../models/category_model.dart';
import '../../../resources/vectors.dart';

class AlbumTile extends StatelessWidget {
  const AlbumTile({required this.category, super.key});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.44,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: const BorderRadius.all(Radius.circular(22)),
              image: DecorationImage(
                image: NetworkImage(category.image),
                fit: BoxFit.cover,
              ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(10, 10),
                  spreadRadius: -16,
                  blurRadius: 40,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const Spacer(),
                Text(
                  sprintf('%02d', [category.id]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  category.desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 46,
            left: MediaQuery.sizeOf(context).width * 0.32,
            child: Container(
              width: 92,
              height: 92,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(10, 20),
                    spreadRadius: -35,
                    blurRadius: 30,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                Vectors.forest,
                width: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
