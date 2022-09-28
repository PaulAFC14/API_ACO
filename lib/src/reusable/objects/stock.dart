import 'package:aco/src/reusable/methods/get.dart';
import 'package:aco/src/reusable/objects/product.dart';
import 'package:aco/src/reusable/objects/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, utf8;

class Stock {
  late User user;
  List<Product> products = [];

  Stock(this.user){
    runProcess();
  }

  Future<void> getProductData(String index) async{
    String token = 'Bearer ' + user.getToken();

    var headers = {
      'Authorization': token
    };
    var request = http.Request('GET', Uri.parse('https://crud.jonathansoto.mx/api/products/' + index));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> all = json.decode(await response.stream.bytesToString());
      dynamic data = all['data'];

      int id = data['id'];
      print(id);
      String name = data['name'];
      print(name);
      String description = data['description'];
      print(description);
      String features = data['features'];
      print(features);
      String cover = data['cover'];
      print(cover);

      String brand = data['brand'].toString();

      List<int> tab = [
        4,
        6,
        13,
        6,
      ];
      
      List<String>brandContent = brand.split(',');
      for(int i = 0; i < brandContent.length; i++){
        brandContent[i] = brandContent[i].replaceRange(0, tab[i], '');
        print(brandContent[i]);
      }

      
  
      
      
      

      
    }
    else {
      print(response.reasonPhrase);
    }

  }
  
  void runProcess() {
    for(int i = 1; i < 31; i++){
      getProductData(i.toString());
    }
  }


  
}
