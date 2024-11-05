// ignore_for_file: override_on_non_overriding_member, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/core/const_data/app_colors.dart';
import 'package:task6/core/const_data/text_style.dart';
import 'package:task6/core/services/media_query_service.dart';
import 'package:task6/view/sginin/signin_controller/signin_controller.dart';
import 'package:task6/widget/custom_%20button.dart';
import 'package:task6/widget/custom_back.dart';
import 'package:task6/widget/custom_textfield.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  SgininController controller = Get.put(SgininController());

  @override
  Widget build(BuildContext context) {
    Responsive.responsive(context); // Initialize responsive scaling

    return Scaffold(
        appBar: AppBar(
            backgroundColor: ColorsApp.white,
            leading: Padding(
              padding: EdgeInsets.only(
                left: 15 * Responsive.responsiveWidth, // Responsive padding
              ),
              child: CustomBack(
                onpressed: () {},
                color: ColorsApp.textfieldcolor,
              ),
            )),
        backgroundColor: ColorsApp.white,
        body: GetBuilder<SgininController>(
            init: SgininController(),
            builder: (contoller) {
              return ListView(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Text(
                          'Hello Again!',
                          style: FontStyles.textStylehelloagain.copyWith(
                            fontSize: 24 *
                                Responsive
                                    .responsiveWidth, // Responsive font size
                          ),
                        ),
                      ),
                      Text(
                        'Fill Your Details Or Continue With',
                        style: FontStyles.textStylelabel.copyWith(
                          fontSize: 16 *
                              Responsive
                                  .responsiveWidth, // Responsive font size
                        ),
                      ),
                      Text(
                        'Social Media',
                        style: FontStyles.textStylelabel.copyWith(
                          fontSize: 16 * Responsive.responsiveWidth,
                        ),
                      ),
                      SizedBox(
                        height: 30 * Responsive.responsiveHeight,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15 * Responsive.responsiveWidth,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Email Address',
                            style: FontStyles.textStyletitle.copyWith(
                              fontSize: 16 * Responsive.responsiveWidth,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(15 * Responsive.responsiveWidth),
                        child: CustomTextfield(
                          onchange: (Value) {
                            contoller.setEmail(Value);
                          },
                          controller: contoller.emailController,
                          hinttext: 'xyz@gmail.com',
                          suffixicon: null,
                          obscure: false,
                        ),
                      ),
                      SizedBox(height: 10 * Responsive.responsiveHeight),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15 * Responsive.responsiveWidth,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Password',
                            style: FontStyles.textStyletitle.copyWith(
                              fontSize: 16 * Responsive.responsiveWidth,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 15 * Responsive.responsiveHeight,
                          right: 15 * Responsive.responsiveWidth,
                          left: 15 * Responsive.responsiveWidth,
                          bottom: 5 * Responsive.responsiveHeight,
                        ),
                        child: CustomTextfield(
                          onchange: (Value) {
                            contoller.setPassword(Value);
                          },
                          controller: contoller.passwordController,
                          hinttext: '●●●●●●●●●',
                          suffixicon: IconButton(
                            icon: contoller.recovery
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined),
                            onPressed: contoller.isrcover,
                          ),
                          obscure: contoller.recovery,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 12 * Responsive.responsiveWidth,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Recovery Password',
                            style:
                                FontStyles.textStylerecoverypassword.copyWith(
                              fontSize: 10 *
                                  Responsive
                                      .responsiveWidth, // Responsive font size
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18 * Responsive.responsiveHeight,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15 * Responsive.responsiveWidth),
                        child: CustomButton(
                          text: 'Sign in',
                          onpressed: () {
                            contoller.signInUser();
                          },
                          BackgroundColor: ColorsApp.signinbutton,
                          MyHeight: 50 * Responsive.responsiveHeight,
                          MyWidth: 335 * Responsive.responsiveWidth,
                          style: FontStyles.textStylesignin.copyWith(
                            fontSize: 14 *
                                Responsive
                                    .responsiveWidth, // Responsive font size
                          ),
                        ),
                      ),
                      SizedBox(height: 30 * Responsive.responsiveHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15 * Responsive.responsiveWidth),
                        child: CustomButton(
                          text: 'Sign In with Google',
                          onpressed: () {},
                          BackgroundColor: ColorsApp.textfieldcolor,
                          MyHeight: 50 * Responsive.responsiveHeight,
                          MyWidth: 335 * Responsive.responsiveWidth,
                          style: FontStyles.textStylesigninwithgoogle.copyWith(
                            fontSize: 14 * Responsive.responsiveWidth,
                          ),
                          imagepath: 'asset/images/Group 108.png',
                        ),
                      ),
                      SizedBox(
                        height: 120 * Responsive.responsiveHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New User?',
                            style: FontStyles.textStyleNewUser.copyWith(
                              fontSize: 14 * Responsive.responsiveWidth,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/registerscreen');
                            },
                            child: Text(
                              'Create Account',
                              style: FontStyles.textStylecreateaccount.copyWith(
                                fontSize: 14 * Responsive.responsiveWidth,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }));
  }
}
