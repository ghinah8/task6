// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task6/core/const_data/app_colors.dart';
import 'package:task6/core/const_data/text_style.dart';
import 'package:task6/core/services/media_query_service.dart';
import 'package:task6/view/registerAccount/register_controller/register_controller.dart';
import 'package:task6/widget/custom_%20button.dart';
import 'package:task6/widget/custom_back.dart';
import 'package:task6/widget/custom_textfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  RegisterController controller = Get.put(RegisterController());

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
                onpressed: () {
                  Get.toNamed('/sgininscreen');
                },
                color: ColorsApp.textfieldcolor,
              ),
            )),
        backgroundColor: ColorsApp.white,
        body: GetBuilder(
            init: RegisterController(),
            builder: (contoller) {
              return ListView(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Text(
                          'Register Account',
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
                          fontSize: 16 *
                              Responsive
                                  .responsiveWidth, // Responsive font size
                        ),
                      ),
                      SizedBox(
                        height: 30 * Responsive.responsiveHeight,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15 *
                              Responsive.responsiveWidth, // Responsive padding
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Your Name',
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
                          controller: contoller.nameController,
                          hinttext: 'xxxxxxxx',
                          suffixicon: null,
                          obscure: false,
                          onchange: (value) {
                            contoller.setName(value);
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 15 *
                              Responsive.responsiveWidth, // Responsive padding
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
                          controller: contoller.emailController,
                          hinttext: 'xyz@gmail.com',
                          suffixicon: null,
                          obscure: false,
                          onchange: (value) {
                            contoller.setEmail(value);
                          },
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
                          controller: contoller.passwordController,
                          hinttext: '●●●●●●●●●',
                          suffixicon: IconButton(
                            icon: contoller.recovery
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined),
                            onPressed: contoller.isrcover,
                          ),
                          obscure: contoller.recovery,
                          onchange: (value) {
                            contoller.setPassword(value);
                          },
                        ),
                      ),
                      SizedBox(height: 10 * Responsive.responsiveHeight),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15 * Responsive.responsiveWidth),
                        child: CustomButton(
                          text: 'Sgin Up',
                          onpressed: () {
                            contoller.registerUser();
                          },
                          BackgroundColor: ColorsApp.signinbutton,
                          MyHeight: 50 *
                              Responsive
                                  .responsiveHeight, // Responsive button height
                          MyWidth: 335 *
                              Responsive
                                  .responsiveWidth, // Responsive button width
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
                      SizedBox(height: 50 * Responsive.responsiveHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already Have Account?',
                            style: FontStyles.textStyleNewUser.copyWith(
                              fontSize: 14 * Responsive.responsiveWidth,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/sgininscreen');
                            },
                            child: Text(
                              'Log In',
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
