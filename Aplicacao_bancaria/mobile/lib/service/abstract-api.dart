
import 'package:http/http.dart' as http;

abstract class AbstractApi {
  
  final _urlLocalHost = 'http://localhost:3000';  

  String _recurso;
  
 AbstractApi(this._recurso);

  Future<String> getAll() async {
    var response = await http.get(Uri.parse('$_urlLocalHost/$_recurso'));

    return response.body;

  }

  Future<String> getById(id) async {
    var response = await http.get(Uri.parse('$_urlLocalHost/{id}'));

    return response.body;

  }

 Future<String> post(Map<String, dynamic> dados) async {
  var response = await http.post(
    Uri.parse('$_urlLocalHost/$_recurso'),
    body: dados,
  );
  return response.body;
}

Future<String> put(int id, Map<String, dynamic> dados) async {
  var response = await http.put(
    Uri.parse('$_urlLocalHost/$_recurso/$id'),
    body: dados,
  );
  return response.body;
}


  Future<void> deleteById(id) async {
    var response = await http.delete(Uri.parse('$_urlLocalHost/{id}'));
  
    
  }

}
