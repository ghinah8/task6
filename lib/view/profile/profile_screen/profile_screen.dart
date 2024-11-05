import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/core/const_data/app_colors.dart';
import 'package:task6/core/const_data/text_style.dart';
import 'package:task6/core/services/media_query_service.dart';
import 'package:task6/view/profile/profile_controller/profile_controller.dart';
import 'package:task6/widget/custom_%20button.dart';
import 'package:task6/widget/custom_back.dart';
import 'package:task6/widget/custom_textfield.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize responsive values based on screen size
    Responsive.responsive(context);

    return Scaffold(
      backgroundColor: ColorsApp.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Profile',
            style: FontStyles.textStyleprofiletitle.copyWith(
              fontSize: 20 * Responsive.responsiveWidth,
            ), // Adjust font size
          ),
        ),
        backgroundColor: ColorsApp.white,
        leading: Padding(
          padding: EdgeInsets.only(
            left: 15 * Responsive.responsiveWidth,
            top: 8 * Responsive.responsiveHeight,
          ),
          child: CustomBack(
            onpressed: () {
              Get.back();
            },
            color: ColorsApp.textfieldcolor,
          ),
        ),
      ),
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25 * Responsive.responsiveWidth,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 45 * Responsive.responsiveHeight),
                    CircleAvatar(
                      backgroundImage: AssetImage('asset/images/image 21.png'),
                      radius: 40 * Responsive.responsiveWidth,
                    ),
                    SizedBox(height: 20 * Responsive.responsiveHeight),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your Name',
                        style: FontStyles.textStyleyourname.copyWith(
                          fontSize: 16 * Responsive.responsiveWidth,
                        ),
                      ),
                    ),
                    SizedBox(height: 10 * Responsive.responsiveHeight),
                    CustomTextfield(
                      controller: controller.nameController,
                      obscure: false,
                      onchange: controller.updateName,
                      hinttext: 'Enter your name',
                    ),
                    SizedBox(height: 10 * Responsive.responsiveHeight),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email Address',
                        style: FontStyles.textStyleyourname.copyWith(
                          fontSize: 16 * Responsive.responsiveWidth,
                        ),
                      ),
                    ),
                    SizedBox(height: 10 * Responsive.responsiveHeight),
                    CustomTextfield(
                      controller: controller.emailController,
                      obscure: false,
                      onchange: controller.updateEmail,
                      hinttext: 'Enter your email',
                    ),
                    SizedBox(height: 10 * Responsive.responsiveHeight),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                        style: FontStyles.textStyleyourname.copyWith(
                          fontSize: 16 * Responsive.responsiveWidth,
                        ),
                      ),
                    ),
                    SizedBox(height: 10 * Responsive.responsiveHeight),
                    CustomTextfield(
                      controller: controller.passwordController,
                      obscure: true,
                      onchange: controller.updatePassword,
                      hinttext: 'Enter your password',
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Recovery Password',
                        style: FontStyles.textStylerecoverypassword.copyWith(
                          fontSize: 12 * Responsive.responsiveWidth,
                        ),
                      ),
                    ),
                    SizedBox(height: 30 * Responsive.responsiveHeight),
                    CustomButton(
                      text: 'Save Now',
                      onpressed: () {
                        // Optionally save any changes made here
                      },
                      BackgroundColor: ColorsApp.signinbutton,
                      MyHeight: 50 * Responsive.responsiveHeight,
                      MyWidth: 360 * Responsive.responsiveWidth,
                      style: FontStyles.textStylesavenow.copyWith(
                        fontSize: 14 * Responsive.responsiveWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
