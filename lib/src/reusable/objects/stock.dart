import 'package:http/http.dart' as http;

class Stock {
  Stock() {
    getProduct();
  }

  Future<void> getProduct() async {
    var headers = {
      'Authorization': 'Bearer 4|5oJrlpv6fVkwUvWAhqdA735s4yyZey6wSlNbPnV0',
      'Cookie':
          'XSRF-TOKEN=eyJpdiI6IlFwc0NualBKcUMwWS9Sckh3YVpIbEE9PSIsInZhbHVlIjoidkZ3Wkp0WDFEeFRwUjRDek0xUGY2V0FHVm9oQ3FabEJ3MGlFSkxSakhJZGpENzJFckl5NS93dDFjUTZQZEhTSGUzU1hrcUQ5ZDY3WUZEZC9VdS9BMW1lcU9odzVhOE15a0tjUGVBZVB5OWJCYjVRUEE0WHViUjhEeCtva3N0M3EiLCJtYWMiOiJmMGUyNjJhMjBhMDQyZGExMDVlYzc1ZmUwOGMxN2IwMmVlOTI3ZWI3ZWZkZTA4OGVlN2RhMjIzMGY4NWU4YTM5IiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6ImY4MHczQ2JwUG5MOExZeEtINHZtdkE9PSIsInZhbHVlIjoiNElxMXVHYzZPZmovUmkzTGlrb0hSalVubHAwd05iV0VDSTBFeVpXNGJLdVJxQk1JRDhUaTdwWjh5TjdoSXZNSVNyZVJIWFp2M3U4SmJJWGVOZks4SG9lZC9XSWhiLzJ4azM4WE91VkE1dlNaL0huNDV2OWlxMmRWcDlycUtLakoiLCJtYWMiOiIwZmQ1NGJjMmRhMGYwOWIyZGE1Yzk2OWRkMDIyMjBjNmEyYWEzOWRmZTJiNGZmZGQ3NTI3MjQ5ZTRmYjk1NzhkIiwidGFnIjoiIn0%3D'
    };
    var request = http.Request(
        'GET', Uri.parse('https://crud.jonathansoto.mx/api/products/1'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
