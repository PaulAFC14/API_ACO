import 'package:aco/src/reusable/objects/product.dart';
import 'package:aco/src/reusable/objects/user.dart';


class Get {

  Product productData(String data){

    print('-------------------------');
    
    int a = 0;
    int b = 0;
    int control = 0;
    
    a = data.lastIndexOf('"data"') + 13;
    //Id
    String id = '';
    control = 0;

    do {
      if(data[a] != ','){
        id += data[a];
        a++;
      }else{
        control = 1;
      }
    } while (control == 0);


    a += 9;
    //Name
    String name = '';
    control = 0;

    do {
      if(data[a] != '"'){
        name += data[a];
        a++;
      }else{
        control = 1;
      }
    } while (control == 0);

    
    //Description and Features
    String desc_feat = '';
    b = data.lastIndexOf('"features"');

    for(int i = a; i < b; i++){
      desc_feat += data[i];
    }

    a = desc_feat.lastIndexOf('"description') + 15;
    //Description
    String description = '';
    control = 0;

    do {
      if(desc_feat[a] != '"'){
        description += desc_feat[a];
        a++;
      }else{
        control = 1;
      }
    } while (control == 0);

    a = data.lastIndexOf('"features"') + 12;
    //Features
    String features = '';
    control = 0;

    do {
      if(data[a] != '"'){
        features += data[a];
        a++;
      }else{
        control = 1;
      }
    } while (control == 0);

    a = data.lastIndexOf('"presentations"');
    String presents = '';
    
    for(int i = a; i < data.length; i++){
      presents += data[i];
    }

    a = presents.lastIndexOf('"cover"') + 10;
    //Cover
    String cover = 'https://crud.jonathansoto.mx/storage/products/';
    control = 0;

    do {
      if(presents[a] != '"'){
        cover += presents[a];
        a++;
      }else{
        control = 1;
      }
    } while (control == 0);

    a = presents.lastIndexOf('"amount"') + 9;
    //Amount
    String amount = '';
    control = 0;

    do {
      if(presents[a] != '.'){
        amount += presents[a];
        a++;
      }else{
        amount += presents[a] + presents[a + 1] + presents[a +2];
        control = 1;
      }
    } while (control == 0);

    a = presents.lastIndexOf('"stock"') + 8;
    //Stock
    String stock = '';
    control = 0;

    do {
      if(presents[a] != '"'){
        stock += presents[a];
        a++;
      }else{
        control = 1;
      }
    } while (control == 0);

    a = presents.lastIndexOf('"stock_min"') + 12;
    //StockMin
    String stock_min = '';
    control = 0;

    do {
      if(presents[a] != '"'){
        stock_min += presents[a];
        a++;
      }else{
        control = 1;
      }
    } while (control == 0);

    a = presents.lastIndexOf('"stock_max"') + 12;
    //StockMin
    String stock_max = '';
    control = 0;

    do {
      if(presents[a] != '"'){
        stock_max += presents[a];
        a++;
      }else{
        control = 1;
      }
    } while (control == 0);

    a = data.lastIndexOf('"brand"');
    b = data.lastIndexOf('"tags"');
    //Brand
    String brand = '';
    for(int i = a; i < b; i++){
      brand += data[i];
    }

    a = brand.lastIndexOf('"id"') + 5;
    //IdBrand
    String id_brand = '';
    control = 0;

    do {
      if(brand[a] != ','){
        id_brand = brand[a];
        a ++;
      }else{
        control = 1;
      }
    } while (control == 0);

    a = brand.lastIndexOf('"name"') + 8;
    //NameBrand
    String name_brand = '';
    control = 0;

    do {
      if(brand[a] != '"'){
        name_brand += brand[a];
        a ++;
      }else{
        control = 1;
      }
    } while (control == 0);

    a = brand.lastIndexOf('"description"') + 15;
    //DescBrand
    String desc_brand = '';
    control = 0;

    do {
      if(brand[a] != '"'){
        desc_brand += brand[a];
        a ++;
      }else{
        control = 1;
      }
    } while (control == 0);

    a = data.lastIndexOf('"categories"');
    b = data.lastIndexOf('"providers"');
    String cats = '';

    for(int i = a; i < b; i++){
      cats += data[i];
    }

     a = cats.lastIndexOf('"id"') + 5;
    //IdCat
    String id_cat = '';
    control = 0;

    do {
      if(cats[a] != ','){
        id_cat += cats[a];
        a++;
      }else{
        control = 1;
      }
    } while (control == 0);

    a = cats.lastIndexOf('"name"') + 8;
    //NameCat
    String name_cat= '';
    control = 0;

    do {
      if(cats[a] != '"'){
        name_cat += cats[a];
        a++;
      }else{
        control = 1;
      }
    } while (control == 0);

   a = cats.lastIndexOf('"description"') + 15;
    //NameCat
    String desc_cat= '';
    control = 0;

    do {
      if(cats[a] != '"'){
        desc_cat += cats[a];
        a++;
      }else{
        control = 1;
      }
    } while (control == 0);


    print('Id: $id');
    print('Name: $name');
    print('Description: $description');
    print('Features: $features');
    print('Cover: $cover');
    print('Amount: $amount');
    print('Stock: $stock');
    print('Stock_min: $stock_min');
    print('Stock_max: $stock_max');
    print('IdBrand: $id_brand');
    print('NameBrand: $name_brand');
    print('NameBrand: $desc_brand');
    print('IdCat: $id_cat');
    print('NameCat: $name_cat');
    print('DescCat: $desc_cat');

    Product product = Product(
      id: id, 
      name: name, 
      cover: cover, 
      description: description, 
      features: features, 
      id_brand: id_brand, 
      name_brand: name_brand, 
      desc_brand: desc_brand, 
      id_category: id_cat, 
      name_cat: name_cat, 
      desc_cat: desc_cat, 
      stock: stock, 
      stock_min: stock_min, 
      stock_max: stock_max, 
      amount: amount);

    return product;

    


    
  }













  List<String> userData(String data) {
    List<String> userData = [];
    int a = 0;

    //Name
    String name = '';
    int nameC = 0;
    int nameData = data.lastIndexOf('"name"');
    a = nameData + 8;

    do {
      if (data[a] != '"') {
        name += data[a];
        a++;
      } else {
        nameC = 1;
      }
    } while (nameC == 0);
    userData.add(name);

    //Lastname
    String lastname = '';
    int lastnameC = 0;
    int lastnameData = data.lastIndexOf('"lastname"');
    a = lastnameData + 12;

    do {
      if (data[a] != '"') {
        lastname += data[a];
        a++;
      } else {
        lastnameC = 1;
      }
    } while (lastnameC == 0);
    userData.add(lastname);

    //Email
    String email = '';
    int emailC = 0;
    int emailData = data.lastIndexOf('"email"');
    a = emailData + 9;

    do {
      if (data[a] != '"') {
        email += data[a];
        a++;
      } else {
        emailC = 1;
      }
    } while (emailC == 0);
    userData.add(email);

    //Phone
    String phone = '';
    int phoneC = 0;
    int phoneData = data.lastIndexOf('"phone_number":"');
    a = phoneData + 16;

    do {
      if (data[a] != '"') {
        phone += data[a];
        a++;
      } else {
        phoneC = 1;
      }
    } while (phoneC == 0);
    userData.add(phone);

    //Token
    String token = '';
    int tokenC = 0;
    int tokenData = data.lastIndexOf('"token":"');
    a = tokenData + 9;

    do {
      if (data[a] != '"') {
        token += data[a];
        a++;
      } else {
        tokenC = 1;
      }
    } while (tokenC == 0);
    userData.add(token);

    return userData;
  }
}
