class Product {
  late String id;
  late String name;
  late String description;
  late String features;
  late String cover;

  late String id_brand;
  late String name_brand;
  late String desc_brand;

  late String id_category;
  late String name_cat;
  late String desc_cat;


  late String stock;
  late String stock_min;
  late String stock_max;
  late String amount;
  
  

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

  String getId(){
    return id;
  }

  String getName() {
    return name;
  }

  String getCover() {
    return cover;
  }

  String getStock() {
    return stock;
  }

  String getStockMin() {
    return stock_min;
  }

  String getStockMax() {
    return stock_max;
  }

  String getAmount() {
    return amount;
  }

  String getIdCategory() {
    return id_category;
  }

  String getDescription() {
    return description;
  }

  String getFeatures() {
    return features;
  }

  String getIdBrand(){
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
