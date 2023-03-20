import 'package:cypherkicks/components/custom_widgets/primary_button.dart';
import 'package:cypherkicks/data/controllers/weight_controller.dart';
import 'package:cypherkicks/data/local_db/local_db.dart';
import 'package:cypherkicks/models/weight_model.dart';
import 'package:cypherkicks/utils/styles.dart';
import 'package:cypherkicks/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialgue {
  Future<dynamic> dialogueBox(
      BuildContext context, TextEditingController controller) {
    return showDialog(
        context: context,
        builder: ((context) {
          return Material(
            color: Colors.transparent,
            child: Center(
                child: Container(
              height: Get.height * 0.3,
              width: Get.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Weight',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: kprimary),
                          ),
                        ),
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: (() => Get.back()),
                          icon: Icon(
                            Icons.close_rounded,
                            size: 20,
                            color: Theme.of(context).hintColor,
                          ))
                    ],
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(20.0).copyWith(top: 5),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Weight in pounds (lbs)',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: kprimary,
                                    fontWeight: fontWeightBold,
                                  )),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(5),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Theme.of(context).hintColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintText: 'Weight'),
                            controller: controller,
                            style:
                                TextStyle(color: Theme.of(context).hintColor),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        PrimaryButon(
                          textColor: kwhiteColor,
                          radius: 5,
                          width: Get.width * 0.7,
                          title: 'OK',
                          onPressed: () {
                            if (controller.text.isNotEmpty) {
                              WeightController.i.weight.add(WeightModel(
                                  weight: int.parse(controller.text),
                                  dateTime: WeightController.i.formattedDate));
                              PreferencesService().saveWeightListLocally(
                                  WeightController.i.weight);
                            }
                            Get.back();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
          );
        }));
  }
}
