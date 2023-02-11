import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_real_state/common/constants.dart';
import 'package:flutter_real_state/custom_widgets/filter_widget.dart';
import 'package:flutter_real_state/custom_widgets/image_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/color_constants.dart';
import 'custom_widgets/floating_widget.dart';
import 'custom_widgets/menu_widget.dart';

class HomePageScreen extends StatelessWidget {
  final filterArray = [
    "<\$220.000",
    "For sale",
    "3-4 beds",
    "Kitchen",
  ];

  @override
  Widget build(BuildContext context) {
    // get screen size......
    var screenWidth = MediaQuery.of(context).size.width;

    // main area.................
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const MenuWidget(
                    iconImg: Icons.subject,
                    iconColor: ColorConstant.kBlackColor,
                  ),
                  const MenuWidget(
                    iconImg: Icons.repeat,
                    iconColor: ColorConstant.kBlackColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "City",
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: ColorConstant.kGreyColor,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "San Francisco",
                style: GoogleFonts.notoSans(
                  fontSize: 36,
                  color: ColorConstant.kBlackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Divider(
                color: ColorConstant.kGreyColor,
                thickness: .2,
              ),
              Container(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: filterArray.length,
                  itemBuilder: (context, index) {
                    return FilterWidget(
                      filterTxt: filterArray[index],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: List.generate(Constants.houseList.length, (index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ImageWidget(
                      Constants.houseList[index],
                      index,
                      Constants.imageList,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
