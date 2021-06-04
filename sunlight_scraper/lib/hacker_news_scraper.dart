import 'dart:convert'; // Contains the JSON encoder

import 'package:http/http.dart'; // Contains a client for making API calls
import 'package:html/parser.dart'; // Contains HTML parsers to generate a Document object
import 'package:html/dom.dart'; // Contains DOM related classes for extracting data from elements

Future initiate() async {
  var client = Client();
  Response response = await client.get(
    'https://www.timeanddate.com/sun/canada/whitby'
  );
  
  // Use html parser and query selector
  var document = parse(response.body);
  var container = document.querySelector('tr.hl.selected');
  List<Element> links = document.querySelectorAll('td.c.sep-l');
  print(links);

  List<Map<String, dynamic>> linkMap = [];

  for (var link in links) {
    linkMap.add({
      'title': link.text,
    });
  }
  print(linkMap);
}