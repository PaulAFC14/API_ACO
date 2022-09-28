class Product {
  late int id;
  late String name;
  late String description;
  late String features;
  late String cover;

  late int id_brand;
  late String name_brand;
  late String desc_brand;

  late int id_category;
  late String name_cat;
  late String desc_cat;


  late int stock;
  late int stock_min;
  late int stock_max;
  late double amount;
  
  

  Product({
    required this.id,
    required this.name,
    required this.cover,
    required this.description,
    required this.features,
    required this.id_brand,
    required this.name_brand,
    required this.desc_brand,
    required this.id_category,
    required this.name_cat,
    required this.desc_cat,
    required this.stock,
    required this.stock_min,
    required this.stock_max,
    required this.amount,
  });

  int getId(){
    return id;
  }

  String getName() {
    return name;
  }

  String getCover() {
    return cover;
  }

  int getStock() {
    return stock;
  }

  int getStockMin() {
    return stock_min;
  }

  int getStockMax() {
    return stock_max;
  }

  double getAmount() {
    return amount;
  }

  int getIdCategory() {
    return id_category;
  }

  String getDescription() {
    return description;
  }

  String getFeatures() {
    return features;
  }

  int getIdBrand(){
    return id_brand;
  }

  String getDescBrand(){
    return desc_brand;
  }

  String getNameBrand(){
    return name_brand;
  }

  String getNameCategory(){
    return name_cat;
  }

  String getDesCategory(){
    return desc_cat;
  }
}
