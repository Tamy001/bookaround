import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/controllers/product/brand_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';

class UploadBrands extends StatelessWidget {
  const UploadBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final contoller = Get.put(BrandController());
    return Scaffold(
        appBar: TAppBar(
            showBackArrow: true,
            title: Text('Upload Authors',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: TColors.white))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //name
                Column(
                  children: [
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: contoller.brandName,
                      validator: (value) =>
                          TValidator.validateEmptyText('BrandName', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.uploadName,
                          prefixIcon: Icon(Iconsax.user_edit)),
                    ),

                    ///PRODUCTS COUNT
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: contoller.productsCount,
                      validator: (value) =>
                          TValidator.validateEmptyText('Booking', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.uploadCount,
                          prefixIcon: Icon(Iconsax.image)),
                    ),

                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Obx(
                            () => Checkbox(
                                value: contoller.isFeatured.value,
                                onChanged: (value) => contoller.isFeatured
                                    .value = !contoller.isFeatured.value),
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        Text('Featured ?',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),

                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    ///Sign Up Button
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => contoller.addBrand(),
                            // onPressed: () => controller.signup(),
                            child: const Text(TTexts.upload)))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
