import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
        height: 120,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
            itemCount: itemCount,
            itemBuilder: (_, __) => const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //image
                    TShimmerEffect(width: 120, height: 120),
                    SizedBox(width: TSizes.spaceBtwItems),

                    //Text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: TSizes.spaceBtwItems / 2),
                        TShimmerEffect(width: 160, height: 15),
                        SizedBox(height: TSizes.spaceBtwItems / 2),
                        TShimmerEffect(width: 110, height: 15),
                        SizedBox(height: TSizes.spaceBtwItems / 2),
                        TShimmerEffect(width: 80, height: 15),
                      ],
                    )
                  ],
                )));
  }
}
