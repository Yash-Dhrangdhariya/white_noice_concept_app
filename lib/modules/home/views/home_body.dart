import 'package:flutter/material.dart';
import 'package:white_noice_concept_app/modules/home/widgets/active_album.dart';
import 'package:white_noice_concept_app/values/app_colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: const [
            SizedBox(
              height: 60,
            ),
            Text(
              'Forest collection',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ActiveAlbum(),
          ],
        ),
      ),
    );
  }
}
