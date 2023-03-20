import 'package:cypherkicks/data/controllers/weight_controller.dart';
import 'package:cypherkicks/models/weight_model.dart';
import 'package:cypherkicks/utils/styles.dart';
import 'package:cypherkicks/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utils/alert_dialogue.dart';

class WeightProgress extends StatefulWidget {
  const WeightProgress({super.key});

  @override
  State<WeightProgress> createState() => _WeightProgressState();
}

class _WeightProgressState extends State<WeightProgress> {
  TextEditingController weight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ksecondaryScaffold,
      body: SafeArea(
        minimum: EdgeInsets.all(paddingExtraLarge(context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Weight Progress',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                color: const Color(0xFF6A6A6A),
                                fontWeight: fontWeightBold),
                      )),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                    onPressed: () {
                      AlertDialgue().dialogueBox(context, weight);
                    },
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  LineSeries<WeightModel, String>(
                      dataSource: WeightController.i.weight,
                      xValueMapper: ((WeightModel weight, _) =>
                          weight.dateTime),
                      yValueMapper: ((WeightModel time, _) => time.weight))
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                'Entries',
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: kgreyColor),
              ),
              const Divider(
                color: kgreyColor,
              ),
              GetBuilder<WeightController>(builder: (contr) {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: contr.weight.reversed.length,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      final weight = contr.weight[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${weight.weight!.toString()} lbs',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Text(
                              weight.dateTime.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: kgreyColor),
                            )
                          ],
                        ),
                      );
                    }));
              })
            ],
          ),
        ),
      ),
    );
  }
}
