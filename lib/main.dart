import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(Imagetest());

class Imagetest extends StatelessWidget {
  final String urlphoto =
      'https://adwservice.com.ua/wp-content/uploads/2021/05/perevod-sayta-na-ukrainskiy-yazyk.jpg';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Butiful images'),
          centerTitle: true,
        ),
        body: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Page2(
                          imageUrl: urlphoto,
                        ),
                      ),
                    ),
                    child: Hero(
                      tag: 'image',
                      child: Image.network(
                        urlphoto,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                  const Text(
                    '\t  picture : pedestrians crossing the road',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              );
            },
            padding: EdgeInsets.all(15),
            itemCount: 1,
          ),
        ),
      ),
    );
  }
}

Future<http.Response> getDate() async {
  const url = '';
  return await http.get(Uri.parse(url));
}

class Page2 extends StatelessWidget {
  final String imageUrl;

  Page2({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Big Image',
          style: TextStyle(color: Colors.orange),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Hero(
          tag: 'image',
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

