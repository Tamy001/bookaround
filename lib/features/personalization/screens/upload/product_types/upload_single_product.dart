import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/validators/validation.dart';

class UploadSingleProducts extends StatelessWidget {
  const UploadSingleProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final RxList<Widget> imageTextFieldList = <Widget>[].obs;
    final dark = THelperFunctions.isDarkMode(context);

    final contoller = Get.put(ProductController());

    return Scaffold(
        appBar: TAppBar(
            showBackArrow: true,
            title: Text('With No Variations',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: dark ? TColors.white : TColors.dark))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TITLE
                Column(
                  children: [
                    const TSectionHeading(
                      title: 'Product Details',
                      showActionButton: false,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    //PRODUCT NAME
                    TextFormField(
                      controller: contoller.productName,
                      validator: (value) =>
                          TValidator.validateEmptyText('Book name', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.uploadName,
                          prefixIcon: Icon(Iconsax.book_square)),
                    ),

                    ///DESCRIPTION
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: contoller.productDescription,
                      validator: (value) =>
                          TValidator.validateEmptyText('Description', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.uploadDescription,
                          prefixIcon: Icon(Iconsax.book)),
                    ),

                    ///PRICE
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: contoller.productPrice,
                      validator: (value) =>
                          TValidator.validateEmptyText('Price', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.uploadPrice,
                          prefixIcon: Icon(Iconsax.money_send)),
                    ),

                    ///SALEPRICE
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: contoller.productSalePrice,
                      validator: (value) =>
                          TValidator.validateEmptyText('Sale-Price', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.uploadSalePrice,
                          prefixIcon: Icon(Iconsax.money_send)),
                    ),

                    ///STOCK
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: contoller.productStock,
                      validator: (value) =>
                          TValidator.validateEmptyText('Stock', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.uploadStock,
                          prefixIcon: Icon(Iconsax.box1)),
                    ),

                    ///IMAGE/ THUMBNAIL
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: contoller.productImage,
                      validator: (value) =>
                          TValidator.validateEmptyText('Image URL', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.uploadImage,
                          prefixIcon: Icon(Iconsax.image)),
                    ),

                    ///ADDITIONAL IMAGES
                    Obx(() => Column(
                          children: List<Widget>.from(imageTextFieldList),
                        )),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            contoller.productAdditionalImage
                                .add(TextEditingController());
                            imageTextFieldList.add(Column(children: [
                              const SizedBox(
                                  height: TSizes.spaceBtwInputFields),
                              TextFormField(
                                controller:
                                    contoller.productAdditionalImage.last,
                                validator: (value) =>
                                    TValidator.validateEmptyText(
                                        'Image URL', value),
                                expands: false,
                                decoration: const InputDecoration(
                                    labelText: TTexts.uploadExtraImage,
                                    prefixIcon: Icon(Iconsax.image)),
                              )
                            ]));
                          },
                          child: const Icon(
                            Iconsax.add,
                            size: 24,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (imageTextFieldList.isNotEmpty) {
                              TextEditingController lastController =
                                  contoller.productAdditionalImage.removeLast();
                              lastController.dispose();
                              imageTextFieldList.removeLast();
                            }
                          },
                          child: const Icon(
                            Iconsax.minus,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    // Button to duplicate text field

                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    //IS FEATURED?
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
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    /// _____________________________BRAAAND__________________
                    const TSectionHeading(
                        title: 'Author Details', showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    //BRAND NAME
                    TextFormField(
                      controller: contoller.brandName,
                      validator: (value) =>
                          TValidator.validateEmptyText('Author name', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.uploadBrandName,
                          prefixIcon: Icon(Iconsax.book_square)),
                    ),

                    //BRAND IS FEATURED?
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Obx(
                            () => Checkbox(
                                value: contoller.isFeaturedBrand.value,
                                onChanged: (value) => contoller.isFeaturedBrand
                                    .value = !contoller.isFeaturedBrand.value),
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        Text('Featured Author?',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    ///ADD PRODUCT BUTTON
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => contoller.addSingleProduct(),
                            child: const Text(TTexts.upload)))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
