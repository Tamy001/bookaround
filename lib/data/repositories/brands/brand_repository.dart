import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  //Variables
  final _db = FirebaseFirestore.instance;
  RxString newDocumentId = ''.obs;

  //Add Brands
  Future<void> addBrand(BrandModel brand) async {
    try {
      final db = FirebaseFirestore.instance;
      CollectionReference ref = db.collection('Brands');
      QuerySnapshot querySnapshot =
          await ref.orderBy('Id', descending: true).get(); // Removed the limit

      if (querySnapshot.docs.isEmpty) {
        newDocumentId.value = "1";
      } else {
        List<int> ids =
            querySnapshot.docs.map((doc) => int.parse(doc.get('Id'))).toList();
        ids.sort((a, b) => b.compareTo(a)); // Sort in descending order
        int lastDocumentId = ids.first;
        newDocumentId.value = (lastDocumentId + 1).toString();
      }
      await _db
          .collection('Brands')
          .doc(newDocumentId.value)
          .set(brand.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  //Get all brands
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

//Get  brands for Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      //Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      //Extract brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['brandId'] as String)
          .toList();

      //Query to get all documents where the brandId is in the list of brandIds
      final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      //Extract brand names or other relevant data from the documents
      List<BrandModel> brands =
          brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return brands;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}
