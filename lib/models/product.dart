class Product {
  final String productId;
  final String name;
  final double price;
  final dynamic createdOn;

  Product({
    this.productId,
    this.name,
    this.price,
    this.createdOn,
  });

  //ส่งค่าจาก formไปหา firestore
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'price': price,
      'createdOn': createdOn
    };
  }

  // อ่านค่าจ่าก firestore มาในโปรเจ็ค
  Product.fromFirestore(Map<String, dynamic> firestore)
      : productId = firestore['productId'],
        name = firestore['name'],
        price = firestore['price'],
        createdOn = firestore['createdOn'];
}
