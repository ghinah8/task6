import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:task6/core/const_data/app_colors.dart';
import 'package:task6/core/const_data/text_style.dart';
import 'package:task6/core/services/media_query_service.dart';
import 'package:task6/view/mycart/cart_controller/cart_controller.dart';
import 'package:task6/view/mycart/widget/custom_card.dart';
import 'package:task6/widget/custom_%20button.dart';
import 'package:task6/widget/custom_back.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.responsive(context);

    return Scaffold(
      backgroundColor: ColorsApp.textfieldcolor,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(
            left: 15 * Responsive.responsiveWidth,
            top: 8 * Responsive.responsiveHeight,
          ),
          child: CustomBack(
            onpressed: () {
              // Add the screen before this screen
            },
            color: ColorsApp.white,
          ),
        ),
        backgroundColor: ColorsApp.textfieldcolor,
        title: Center(
          child: Text(
            'My Cart',
            style: FontStyles.textStylemycarttitle.copyWith(
              fontSize: FontStyles.textStylemycarttitle.fontSize! *
                  Responsive.responsiveWidth,
            ),
          ),
        ),
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 6 * Responsive.responsiveHeight,
                  left: 15 * Responsive.responsiveWidth,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${controller.products.length} Items',
                    style: FontStyles.textStylecartitem.copyWith(
                      fontSize: FontStyles.textStylecartitem.fontSize! *
                          Responsive.responsiveWidth,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    var product = controller.products[index];
                    return CustomCard(
                      image: product['image'],
                      imageprice: product['imageprice'],
                      imagename: product['imagename'],
                      count: product['count'],
                      onpressedinc: () {
                        controller.inc(index);
                      },
                      onpresseddec: () {
                        controller.dec(index);
                      },
                      onDelete: () {
                        controller.deleteProduct(index);
                      },
                    );
                  },
                ),
              ),
              Container(
                height: 230 * Responsive.responsiveHeight,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: ColorsApp.white,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 30 * Responsive.responsiveHeight),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20 * Responsive.responsiveWidth,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: FontStyles.textStylecartsubtotal.copyWith(
                                fontSize:
                                    FontStyles.textStylecartsubtotal.fontSize! *
                                        Responsive.responsiveWidth,
                              ),
                            ),
                            Text(
                              '\$${controller.sum}',
                              style: FontStyles.textStyletshirtprice.copyWith(
                                fontSize:
                                    FontStyles.textStyletshirtprice.fontSize! *
                                        Responsive.responsiveWidth,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5 * Responsive.responsiveHeight,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20 * Responsive.responsiveWidth,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery',
                              style: FontStyles.textStylecartsubtotal.copyWith(
                                fontSize:
                                    FontStyles.textStylecartsubtotal.fontSize! *
                                        Responsive.responsiveWidth,
                              ),
                            ),
                            Text(
                              '\$60.20',
                              style: FontStyles.textStyletshirtprice.copyWith(
                                fontSize:
                                    FontStyles.textStyletshirtprice.fontSize! *
                                        Responsive.responsiveWidth,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5 * Responsive.responsiveHeight,
                      ),
                      Divider(
                        color: ColorsApp.signinText2Color,
                        indent: 16 * Responsive.responsiveWidth,
                        endIndent: 16 * Responsive.responsiveWidth,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20 * Responsive.responsiveWidth,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Cost',
                              style: FontStyles.textStyletotalcost.copyWith(
                                fontSize:
                                    FontStyles.textStyletotalcost.fontSize! *
                                        Responsive.responsiveWidth,
                              ),
                            ),
                            Text(
                              '\$${controller.calculateTotalWithDelivery()}',
                              style: FontStyles.textStyletotalcost2.copyWith(
                                fontSize:
                                    FontStyles.textStyletotalcost2.fontSize! *
                                        Responsive.responsiveWidth,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25 * Responsive.responsiveHeight,
                      ),
                      CustomButton(
                        BackgroundColor: ColorsApp.signinbutton,
                        text: 'Checkout',
                        onpressed: () {},
                        MyHeight: 50 * Responsive.responsiveHeight,
                        MyWidth: 335 * Responsive.responsiveWidth,
                        style: FontStyles.textStylecheckout.copyWith(
                          fontSize: FontStyles.textStylecheckout.fontSize! *
                              Responsive.responsiveWidth,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
