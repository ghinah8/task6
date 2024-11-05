import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/core/const_data/app_colors.dart';
import 'package:task6/core/const_data/text_style.dart';
import 'package:task6/core/services/media_query_service.dart';
import 'package:task6/view/side_menu/sidemenu_controller/sidemenu_controller.dart';
import 'package:task6/view/side_menu/widget/custom_sidemenu.dart';

class SidemenuScreen extends StatelessWidget {
  const SidemenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.responsive(context); // Initialize responsive scaling

    return Scaffold(
      backgroundColor: ColorsApp.signinText1Color,
      body: GetBuilder<SidemenuController>(
          init: SidemenuController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.only(
                left: 30 * Responsive.responsiveWidth, // Responsive padding
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:
                        60 * Responsive.responsiveHeight, // Responsive height
                  ),
                  CircleAvatar(
                    backgroundImage: const AssetImage(
                      'asset/images/image 21.png',
                    ),
                    minRadius: 10 * Responsive.responsiveWidth,
                    maxRadius: 55 * Responsive.responsiveWidth,
                  ),
                  SizedBox(
                    height: 10 * Responsive.responsiveHeight,
                  ),
                  Text(
                    controller.profileName,
                    style: FontStyles.textStyleprofilename.copyWith(
                      fontSize: 18 *
                          Responsive.responsiveWidth, // Responsive font size
                    ),
                  ),
                  SizedBox(
                    height: 50 * Responsive.responsiveHeight,
                  ),
                  CustomSidemenu(
                    name: 'Profile',
                    icon: Icons.person_2_outlined,
                    onpressed: () {
                      Get.toNamed('/profilescreen');
                    },
                    padding:
                        180 * Responsive.responsiveWidth, // Responsive padding
                  ),
                  CustomSidemenu(
                    name: 'My Cart',
                    icon: Icons.shopping_bag_outlined,
                    onpressed: () {},
                    padding: 170 * Responsive.responsiveWidth,
                  ),
                  CustomSidemenu(
                    name: 'Favorite',
                    icon: Icons.favorite_border_outlined,
                    onpressed: () {},
                    padding: 170 * Responsive.responsiveWidth,
                  ),
                  CustomSidemenu(
                    name: 'Orders',
                    icon: Icons.emoji_transportation_outlined,
                    onpressed: () {},
                    padding: 178 * Responsive.responsiveWidth,
                  ),
                  CustomSidemenu(
                    name: 'Notifications',
                    icon: Icons.notifications_outlined,
                    onpressed: () {},
                    padding: 146 * Responsive.responsiveWidth,
                  ),
                  CustomSidemenu(
                    name: 'Settings',
                    icon: Icons.settings_outlined,
                    onpressed: () {},
                    padding: 170 * Responsive.responsiveWidth,
                  ),
                  SizedBox(
                    height: 15 * Responsive.responsiveHeight,
                  ),
                  const Divider(
                    indent: 4,
                    endIndent: 15,
                    color: ColorsApp.white,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10 * Responsive.responsiveHeight,
                  ),
                  CustomSidemenu(
                    name: 'Sign Out',
                    icon: Icons.logout_outlined,
                    onpressed: () {
                      controller.logoutUser();
                    },
                    padding: 165 * Responsive.responsiveWidth,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
