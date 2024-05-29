class UpdateCartEntity {
  bool status;
  String message;
  DataEntity data;

  UpdateCartEntity({
    required this.status,
    required this.message,
    required this.data,
  });

}

class DataEntity {
  CartEntity cart;
  int subTotal;
  int total;

  DataEntity({
    required this.cart,
    required this.subTotal,
    required this.total,
  });

}

class CartEntity {
  int id;
  int quantity;
  ProductEntity product;

  CartEntity({
    required this.id,
    required this.quantity,
    required this.product,
  });

}

class ProductEntity {
  int id;
  int price;
  int oldPrice;
  int discount;
  String image;

  ProductEntity({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

}
