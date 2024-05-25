import 'package:flutter/material.dart';
import 'package:white_noice_concept_app/models/category_model.dart';
import 'package:white_noice_concept_app/values/app_constants.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    required this.category,
    this.isActive = false,
    this.showDetailView = false,
    super.key,
  });

  final bool isActive;
  final bool showDetailView;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSize(
          alignment: Alignment.centerRight,
          duration: AppConstants.defaultDuration,
          child: Row(
            children: [
              if (isActive) ...[
                const CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.blue,
                ),
                const SizedBox(width: 12),
              ],
              Text(
                category.name.toUpperCase(),
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        if (showDetailView)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: 240,
                height: 180,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                    image: DecorationImage(
                      image: NetworkImage(category.image),
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
                          '0${category.id}',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          category.desc,
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
          ),
      ],
    );
  }
}
