import 'package:FirestoreCRUDApp/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  //สร้างฟังค์ชันไว้บันทึกข้อมูล Productเข้า Firestore
  Future<void> saveProduct(Product product) {
    return _db
        .collection('products')
        .doc(product.productId)
        .set(product.toMap());
  }

  //สร้างฟังค์ชันในการอ่านข้อมูลProduct
  Stream<List<Product>> getProduct() {
    return _db.collection('products')
    .orderBy('createdOn',descending: true)
    .snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Product.fromFirestore(document.data()))
        .toList());
  }

  //สร้างฟังค์ชันในการลบข้อมูลProduct
  Future<void> removeProduct(String productId) {
    return _db.collection('products').doc(productId).delete();
  }
}
