import 'package:flutter/material.dart';
import 'package:white_noice_concept_app/resources/images.dart';

class ActiveAlbum extends StatelessWidget {
  const ActiveAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 300,
        child: ColoredBox(
          color: Colors.red,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              image: const DecorationImage(
                image: NetworkImage(Images.forestImage),
                fit: BoxFit.cover,
              ),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(10, 10),
                  spreadRadius: -15,
                  blurRadius: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
