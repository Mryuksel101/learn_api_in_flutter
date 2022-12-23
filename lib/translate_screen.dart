import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class TranslateScreen extends StatefulWidget {
  const TranslateScreen({Key? key}) : super(key: key);

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void wordMeaning()async{ //For us to use await, the parent function must be async. (The name of the parent function in our example is wordMeaning )
    // http.post method is an asynchronous function
    // So we use await before it is called

    /*
      In Flutter, the http.post method is used to send an HTTP POST request to a server. It takes two required arguments: the URL to send the request to, and the body of the request.
    */
    Response response = await http.post(
      Uri.parse("https://google-translate1.p.rapidapi.com/language/translate/v2"),
        headers: { // In the context of an HTTP POST request, headers can be used to provide information about the request payload
        "content-type": "application/x-www-form-urlencoded",
        "Accept-Encoding": "application/gzip",
        "X-RapidAPI-Key": "f8b372e531msh197b796b14029d6p172a34jsn5022c69f1603",
        "X-RapidAPI-Host": "google-translate1.p.rapidapi.com",
      },

      body: jsonEncode(<String, String>{
        "q" : "hi",
        "target": "es",
        "source":"en",
      })
    );
    // http.post function returns a Future<Response> object, which represents the response from the server

    // The Response object contains information about the response, including the status code, headers, and the body of the response
    // Data is often transmitted over the Internet in the form of text. so our response.body is text. Also called json string.

    Map<String, dynamic> responseBody = json.decode(response.body);
    // json.decode is a function from the dart:convert library that is used to parse a JSON string and convert it into a Dart object.
    // The json.decode function takes a JSON string as input and returns the corresponding Dart object.


    print(responseBody);
    print(response.statusCode);

  } 


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xffF3F0F6),
      child:  CustomScrollView(
      
        slivers: [
            const CupertinoSliverNavigationBar(    
            border: Border(bottom: BorderSide(color: CupertinoColors.white)),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            leading: Icon(
              Icons.translate
            ),
            largeTitle: Text(
              "Translate",
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
    
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
    
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:   [
                  
                  CupertinoTextField(
                    style: const TextStyle(
                      color: Colors.black
                    ),
                    decoration:  BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controller: textEditingController,
                    autofocus: false,
                    placeholder: "enter the text you want to translate",
                    placeholderStyle: const TextStyle(
                      color: Color.fromARGB(255, 201, 201, 202)
                    ),
                    minLines: 1,
                    maxLines: 20,
                    cursorColor: const Color(0xff30D059),
                    
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  CupertinoButton(
                    minSize: 10,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 5,
                    ),
                    color: Colors.white,
                    child: const Text(
                      "translate",
                      style: TextStyle(
                        color: CupertinoColors.systemBlue,
                      ),
                    ),
                    onPressed: () {
                      wordMeaning();
                    },
                  )
                  
    
                  
                ],
              ),
            ),
          )
    
          
    
    
        ],
      ),
    );
  }
}