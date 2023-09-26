import 'package:flutter/material.dart';

import 'views/category_bar.dart';
import 'views/home_app_bar.dart';
import 'views/home_body.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HomeBody(),
              const VerticalDivider(
                color: Colors.grey,
                width: 1,
              ),
              CategoryBar(),
            ],
          ),
          const HomeAppBar(),
        ],
      ),
      // body: SafeArea(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(30),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [

      //             SizedBox(
      //               child: Stack(
      //                 children: [
      //                   Positioned(
      //                     left: 0,
      //                     right: 0,
      //                     child: Container(
      //                       height: 300,
      //                       margin: const EdgeInsets.only(right: 50),
      //                       decoration: BoxDecoration(
      //                         borderRadius: BorderRadius.circular(10),
      //                       ),
      //                     ),
      //                   ),
      //                   Positioned(
      //                     top: 10,
      //                     left: 5,
      //                     child: IconButton(
      //                       onPressed: () {},
      //                       icon: const Icon(
      //                         Icons.bookmark,
      //                         color: Colors.white,
      //                         size: 30,
      //                       ),
      //                     ),
      //                   ),
      //                   Positioned(
      //                     bottom: 10,
      //                     left: 20,
      //                     right: 140,
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: const [
      //                         Text(
      //                           '04',
      //                           textAlign: TextAlign.start,
      //                           style: TextStyle(
      //                             fontSize: 40,
      //                             color: Colors.white,
      //                             fontWeight: FontWeight.w600,
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 15,
      //                         ),
      //                         Text(
      //                           'Being in the forest',
      //                           style: TextStyle(
      //                             fontSize: 10,
      //                             color: Colors.white,
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 40,
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                   Positioned(
      //                     right: 0,
      //                     top: 40,
      //                     child: Container(
      //                       width: 100,
      //                       height: 100,
      //                       decoration: const BoxDecoration(
      //                         color: Colors.white,
      //                         shape: BoxShape.circle,
      //                         boxShadow: [
      //                           BoxShadow(
      //                             offset: Offset(10, 20),
      //                             spreadRadius: -35,
      //                             blurRadius: 30,
      //                           ),
      //                         ],
      //                       ),
      //                       child: const Center(
      //                         child: Icon(
      //                           Icons.ac_unit_rounded,
      //                           size: 34,
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 70,
      //             ),
      //             ColoredBox(
      //               color: Colors.red,
      //               child: ListView.separated(
      //                 shrinkWrap: true,
      //                 itemCount: AppData.sounds.length,
      //                 itemBuilder: (context, index) => MusicItems(
      //                   imageUrl: AppData.sounds[index].image,
      //                   title: AppData.sounds[index].name,
      //                   seconds: AppData.sounds[index].seconds,
      //                 ),
      //                 separatorBuilder: (_, __) => const SizedBox(
      //                   height: 30,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Container(
      //         width: 75,
      //         decoration: BoxDecoration(
      //           border: Border(
      //             left: BorderSide(
      //               color: Colors.grey.shade400,
      //               width: 1,
      //             ),
      //           ),
      //         ),
      //         child: RotatedBox(
      //           quarterTurns: 3,
      //           child: Padding(
      //             padding: const EdgeInsets.only(left: 50, right: 20),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 const RotatedBox(
      //                   quarterTurns: 1,
      //                   child: CircleAvatar(
      //                     radius: 16,
      //                     backgroundImage: NetworkImage(
      //                       'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
      //                     ),
      //                   ),
      //                 ),
      //                 Wrap(
      //                   alignment: WrapAlignment.spaceBetween,
      //                   spacing: 30,
      //                   children: List.generate(
      //                     AppData.categories.length,
      //                     (index) => ChoiceChip(
      //                       label: Row(
      //                         children: [
      //                           if (selectedTab == AppData.categories[index])
      //                             const Padding(
      //                               padding: EdgeInsets.only(right: 8),
      //                               child: CircleAvatar(
      //                                 backgroundColor: Colors.blue,
      //                                 radius: 3.5,
      //                               ),
      //                             )
      //                           else
      //                             const SizedBox(),
      //                           Text(
      //                             AppData.categories[index],
      //                             style: TextStyle(
      //                               fontWeight: FontWeight.w300,
      //                               color: Colors.grey.shade500,
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                       elevation: 0,
      //                       pressElevation: 0,
      //                       selected: false,
      //                       backgroundColor: Colors.transparent,
      //                       disabledColor: Colors.transparent,
      //                       selectedColor: Colors.transparent,
      //                       onSelected: (value) {
      //                         setState(() {
      //                           selectedTab = AppData.categories[index];
      //                         });
      //                       },
      //                     ),
      //                   ),
      //                 ),
      //                 SvgPicture.asset(
      //                   'assets/icons/menu.svg',
      //                   width: 40,
      //                   height: 40,
      //                   colorFilter: const ColorFilter.mode(
      //                     Color(0xff666666),
      //                     BlendMode.srcIn,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class MusicItems extends StatelessWidget {
  const MusicItems({
    required this.imageUrl,
    required this.title,
    required this.seconds,
    super.key,
  });

  final String imageUrl;
  final String title;
  final double seconds;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black26,
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircleAvatar(
                backgroundColor: Colors.black38,
                radius: 1,
                child: Icon(
                  Icons.waves,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(
              height: 8,
            ),
            Text(
              '${seconds}s',
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        )
      ],
    );
  }
}
