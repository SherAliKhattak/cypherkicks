import 'package:cypherkicks/data/controllers/auth_controller.dart';
import 'package:cypherkicks/models/steps_data_model.dart';
import 'package:cypherkicks/utils/styles.dart';
import 'package:cypherkicks/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/controllers/steps_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ksecondary, kprimary])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: AuthController.i.isloading == false
              ? SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(paddingExtraLarge(context)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'HOME',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: kwhiteColor, fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          GetBuilder<StepsController>(builder: (cont) {
                            return Text(
                              StepsController.i.stepcountFortoday.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: kwhiteColor,
                                      fontSize: fontSizeExtraLarge(context)),
                            );
                          }),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFB56EC1),
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.symmetric(
                                horizontal: paddingDefault(context)),
                            child: Text(
                              'Steps Today',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: kwhiteColor),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.05,
                          ),
                          Text(
                            'Earn tokens by walking, jogging or running',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: kgolden),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFD5B3E0),
                                borderRadius: BorderRadius.circular(radius)),
                            padding: EdgeInsets.all(paddingDefault(context)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Steps Per Day',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  series: <ChartSeries>[
                                    LineSeries<StepsDataModel, String>(
                                        color: const Color(0xFF685D86),
                                        xAxisName: 'Time',
                                        yAxisName: 'Steps',
                                        dataSource: StepsController.i.stepsList,
                                        xValueMapper:
                                            ((StepsDataModel steps, _) =>
                                                steps.time.toString()),
                                        yValueMapper:
                                            ((StepsDataModel time, _) =>
                                                time.stepsCount))
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Container(
                            padding: EdgeInsets.all(paddingDefault(context)),
                            decoration: BoxDecoration(
                                color: kcontainer,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Text(
                                  'Earn Extra Rewards!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(
                                          color: kwhiteColor, fontSize: 16),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Text(
                                  'Earn more tokens by holding CypherKicks NFTS in the wallet you added to your profile',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: kblackColor, fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
