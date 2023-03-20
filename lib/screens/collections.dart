import 'package:cypherkicks/components/images.dart';
import 'package:cypherkicks/models/collections_model.dart';
import 'package:cypherkicks/utils/styles.dart';
import 'package:cypherkicks/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Collections extends StatelessWidget {
  const Collections({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ksecondaryScaffold,
      body: SafeArea(
        minimum: EdgeInsets.all(paddingExtraLarge(context)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Collections',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: const Color(0xFF6A6A6A),
                        fontWeight: fontWeightBold),
                  ),
                  const Icon(Icons.menu),
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              ListView.builder(
                  padding: EdgeInsets.all(paddingExtraSmall(context)),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: collections.length,
                  itemBuilder: ((context, index) {
                    final ct = collections[index];
                    return Container(
                        margin: EdgeInsets.symmetric(
                            vertical: paddingExtraSmall(context)),
                        decoration: BoxDecoration(
                            color: kprimary,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(paddingDefault(context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ct.title!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: kwhiteColor),
                                ),
                                Text(
                                  ct.season!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: kgreyColor),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      Images.box,
                                      height: 20,
                                      width: 20,
                                      color: kwhiteColor,
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.01,
                                    ),
                                    Text(
                                      '${ct.nFTs} NFTs',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: kwhiteColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    ct.imagePath!,
                                    height: 80,
                                    width: 80,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ));
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
