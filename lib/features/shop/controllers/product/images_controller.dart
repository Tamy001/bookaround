import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';

import '../../../../utils/constants/sizes.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();
  RxString selectedProductImage = ''.obs;

  // Get all images from product and variation
  List<String> getAllProductImages(ProductModel product) {
    // use set to add unique images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(product.thumbnail);

    // Assign Thumbnail as Selected Image
    selectedProductImage.value = product.thumbnail;
    // Get all images  from the Product Model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // Get all images from the Product Variation if not  null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }
    return images.toList();
  }

//  showw imae popup
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,

      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: TSizes.defaultSpace * 2,
                  horizontal: TSizes.defaultSpace),
              child: CachedNetworkImage(imageUrl: image),
            ), // Padding

            const SizedBox(height: TSizes.spaceBtwSections),

            Align(
              alignment: Alignment.bottomCenter,

              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                    onPressed: () => Get.back(), child: const Text('Close')),
              ), // SizedBox
            ),
          ], // Align
        ), // Column
      ), // Dialog.fullscreen
    );
  }
}
