import 'package:flutter/material.dart';
import 'package:white_noice_concept_app/constants/app_data.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: SizedBox(
          width: 240,
          height: 180,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(22),
              image: DecorationImage(
                image: NetworkImage(
                  AppData.categories[index].image,
                ),
                colorFilter: const ColorFilter.mode(
                  Colors.black38,
                  BlendMode.srcOver,
                ),
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
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '0${AppData.categories[index].id}',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    AppData.categories[index].desc,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
