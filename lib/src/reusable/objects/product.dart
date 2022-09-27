class Product {
  late int id;
  late String name;
  late int weight;
  late String status;
  late String cover;
  late int stock;
  late int stock_min;
  late int stock_max;
  late double amount;
  late int id_category;
  late String description;
  late String features;

  Product({
    required this.id,
    required this.name,
    required this.weight,
    required this.status,
    required this.cover,
    required this.stock,
    required this.stock_min,
    required this.stock_max,
    required this.amount,
    required this.id_category,
    required this.description,
    required this.features,
  });

  int getId() {
    return id;
  }

  String getName() {
    return name;
  }

  int getWeight() {
    return weight;
  }

  String getStatus() {
    return status;
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
}
