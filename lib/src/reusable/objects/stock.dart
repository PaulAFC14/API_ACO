import 'package:aco/src/reusable/methods/get.dart';
import 'package:aco/src/reusable/objects/product.dart';
import 'package:aco/src/reusable/objects/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8;

class Stock {
  late User user;
  List<Product> products = [];
  

  Stock(this.user){
    processData();
  }


  Future<void> callData(String index) async{
    String token = 'Bearer ' + user.getToken();
    
    var headers = {
      'Authorization': token,
      'Cookie': 'XSRF-TOKEN=eyJpdiI6ImhrOFp1MWtaOHI5OXl4MUF5V2ppZVE9PSIsInZhbHVlIjoibWtvdlpRd0ZQazZhaHZSVFN6OWorRWdEVkM0R2VqTzhqZDE5STg0UUpOTmNveFI2YVV5ODRoaUV2V3FxYlNLSmRHM0JnVjdrVmlZYjlObjJ0ZXY4NW9BQ0xIV2hJQzJaWFdwcVNOVmVZZGxvL3ozamVGTjgwRlZ4aEtJTzVWU3IiLCJtYWMiOiJiNDcyMzhiNzRlNDlhMTAxNjQ5MGEyMjhiYWUyNjg3NzBlN2M4NzExMWYxZmVkZjkzOTJkZGFhYjBhM2M1YTMzIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IlV2Yk1rNS9pbGxHc3QyUVpqdlMzSVE9PSIsInZhbHVlIjoiNVpZS09IZWllNnlrWDlaSXFkOXFJWGdabkJvcmdPVVQva0lEZ1AzVmh0c2IrZkJnYWRnQ1BTZGRON29uYWpzNlhJTkxVTjROVmg4NTFMUVkwb0wwdUFNTmVJSVZTZFJWSUd6VWNBZUpBajQ2alB1SGVhQk1qZ1k1dlF1RjdSekUiLCJtYWMiOiIyYzNlMDhjYTgzMGI1ZTc5ZTJlZTA1MThjMThkYTNjOGM2MmZlMjg0NTAzMjhmYTcwYTZjMzUwNTdlNTNiOGE3IiwidGFnIjoiIn0%3D'
    };
    var request = http.Request('GET', Uri.parse('https://crud.jonathansoto.mx/api/products/' + index));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String p = await response.stream.bytesToString();
      print(p);
      products.add(Get().productData(p));
      

    }
    else {
      print(response.reasonPhrase);
    }

  }

  
  void processData() {
    print('');
    print('');
    print('<<<<<<<<<<<<INICIO>>>>>>>>>>>>>');
    List<String> nonProcessData = [];

    for(int i = 1; i < 3; i++){
      callData(i.toString());
    }

  }

  List<Product> getProducts(){
    return products;
  }

  /*List<Product> Filter(){
    List<Product> products = [];

    for(int i = 0; i < data.length; i++){
      String item = data[i];
      List<String> itemFiltered = [];
      int a = 0;

      //Id
      String id = '';
      int idC = 0;
      int idData = item.lastIndexOf('"data": {"id": ');
      a = idData + 15;

      do{
        if(item[a] != ','){
          id += item[a];
          a++;
        }else{
          idC = 1;
        }

      }while(idC == 0);

      a += 11;

      //Name
      String name = '';
      int nameC = 0;

      do{
        if(item[a] != '"'){
          name += item[a];
          a++;
        }else{
          nameC = 1;
        }
      }while(nameC == 0);

      a += (29 + name.length);

      //Description
      String description = '';
      int descriptionC = 0;

      do{
        if(item[a] != '"'){
          description += item[a];
          a++;
        }else{
          descriptionC = 1;
        }
      }while(descriptionC == 0);

      a += 15;

      //Features
      String features = '';
      int featuresC = 0;

      do{
        if(item[a] != '"'){
          features += item[a];
          a++;
        }else{
          featuresC = 1;
        }
      }while(featuresC == 0);

      a += 12;

      //Cover
      String cover = '';
      int coverC = 0;

      do{
        if(item[a] != '"'){
          cover += item[a];
          a++;
        }else{
          coverC = 1;
        }
      }while(coverC == 0);  

      int aBrand = item.lastIndexOf('"brand": {');
      String allBrand = '';
      int allBrandC = 0;

      do{
        if(item[aBrand] != '"'){
          allBrand += item[aBrand];
          aBrand++;
        }else{
          allBrandC = 1;
        }
      }while(allBrandC == 0);  

      //Brand
      String brand = '';
      int brandC = 0;
      int branData = item.lastIndexOf('"name"');
      aBrand = branData + 9;

      do{
        if(allBrand[aBrand] != '"'){
          brand += allBrand[aBrand];
          aBrand++;
        }else{
          brandC = 1;
        }
      }while(brandC == 0);  

      a = item.lastIndexOf('"categories"') + 22;

      //Category
      String category = '';
      int categoryC = 0;
      
      do{
        if(item[a] != ','){
          category += item[a];
          a++;
        }else{
          categoryC = 1;
        }
      }while(categoryC == 0); 

      a = item.lastIndexOf('"stock') + 9;
      //Stock
      String stock = '';
      int stockC = 0;

      do{
        if(item[a] != ','){
          stock += item[a];
          a++;
        }else{
          stockC = 1;
        }
      }while(stockC == 0);

      a = item.lastIndexOf('"stock_min') + 13;
      //StockMin
      String stockMin = '';
      int stockMinC = 0;

      do{
        if(item[a] != ','){
          stockMin += item[a];
          a++;
        }else{
          stockMinC = 1;
        }
      }while(stockMinC == 0);

      a = item.lastIndexOf('"stock_max') + 13;
      //StockMax
      String stockMax = '';
      int stockMaxC = 0;

      do{
        if(item[a] != ','){
          stockMax += item[a];
          a++;
        }else{
          stockMaxC = 1;
        }
      }while(stockMaxC == 0);
      
      a = item.lastIndexOf('"amount');
      //Amount
      String amount = '';
      int amountC = 0;

      do{
        if(item[a] != '.'){
          amount += item[a];
          a++;
        }else{
          amount += (item[a]+item[a +1]+item[a + 2]);
          amountC = 1;
        }
      }while(amountC == 0);

      Product product = Product(
        name: name, 
        cover: cover, 
        stock: int.parse(stock), 
        stock_min: int.parse(stockMin), 
        stock_max: int.parse(stockMax), 
        amount: double.parse(amount), 
        id_category: int.parse(category), 
        description: description, 
        features: features);
      
      products.add(product);


    }

    return products;

  }*/
}
