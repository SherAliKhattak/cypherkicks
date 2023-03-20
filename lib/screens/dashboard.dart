import 'package:cypherkicks/data/controllers/dashboard_controller.dart';
import 'package:cypherkicks/data/controllers/steps_controller.dart';
import 'package:cypherkicks/utils/styles.dart';
import 'package:cypherkicks/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../components/images.dart';
import '../utils/dashboard_utils/dashboard_utils.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    List<String> text = ['Today', 'Week', '1 Month', '3 Months'];

    return Scaffold(
      backgroundColor: const Color(0xFFECECED),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(paddingLarge(context)),
          child: SingleChildScrollView(
            child:
                GetBuilder<DashBoardController>(builder: (dashBoardController) {
              return GetBuilder<StepsController>(builder: (contr) {
                return Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Dashboard',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color: const Color(0xFF6A6A6A),
                                  fontWeight: fontWeightBold),
                        )),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    SizedBox(
                      height: Get.height * 0.07,
                      child: GetBuilder<DashBoardController>(builder: (dash) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: text.length,
                            itemBuilder: ((context, index) {
                              final txt = text[index];
                              return TextButton(
                                  style: const ButtonStyle(
                                      splashFactory: NoSplash.splashFactory,
                                      visualDensity:
                                          VisualDensity(horizontal: 3.0)),
                                  onPressed: (() {
                                    dash.updateIndex(index);
                                  }),
                                  child: Text(
                                    txt,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: dash.selectedIndex == index
                                                ? kselectedText
                                                : kgreyColor),
                                  ));
                            }));
                      }),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Row(
                      children: [
                        dashboardCard(context,
                            title: 'Steps',
                            backgroundColor: const Color(0xFF465379),
                            imagePath: Images.sneakers,
                            progressTitle: 'Steps',
                            value: DashBoardUtils().displaySteps()),
                        SizedBox(
                          width: Get.width * 0.06,
                        ),
                        dashboardCard(context,
                            title: 'Tokens',
                            progressTitle: 'Tokens',
                            backgroundColor: const Color(0xFFD7A305),
                            imagePath: Images.star,
                            value: DashBoardUtils().displayTokens())
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Row(
                      children: [
                        dashboardCard(context,
                            title: 'Distance',
                            progressTitle: 'Miles',
                            backgroundColor: const Color(0xFFBA3E3E),
                            imagePath: Images.pin,
                            value: DashBoardUtils().displayDistance()),
                        SizedBox(
                          width: Get.width * 0.06,
                        ),
                        dashboardCard(context,
                            title: 'Calories',
                            progressTitle: 'Calories',
                            backgroundColor: const Color(0xFF465379),
                            imagePath: Images.sneakers,
                            value: DashBoardUtils().displayCalories())
                      ],
                    )
                  ],
                );
              });
            }),
          ),
        ),
      ),
    );
  }

  Widget dashboardCard(BuildContext context,
      {String? title,
      String? progressTitle,
      Color? backgroundColor,
      String? imagePath,
      String? value}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: kwhiteColor, borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(paddingSmall(context)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: kblackColor, fontWeight: fontWeightBold),
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      imagePath!,
                      color: kwhiteColor,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CircularPercentIndicator(
              radius: 55.0,
              lineWidth: 10.0,
              percent: 0.6,
              animation: true,
              startAngle: 0.6,
              circularStrokeCap: CircularStrokeCap.round,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: kblackColor, fontSize: 20),
                  ),
                  Text(
                    progressTitle!,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: kblackColor, fontSize: 8),
                  ),
                ],
              ),
              progressColor: backgroundColor,
            ),
            SizedBox(
              height: Get.height * 0.03,
            )
          ],
        ),
      ),
    );
  }
}
