import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    decoration:  BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    controller: textEditingController,
                    autofocus: false,
                    placeholder: "Seslendirmesini duymak istediğin metni gir",
                    minLines: 10,
                    maxLines: 20,
                    cursorColor: const Color(0xff30D059),
                    
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  
    
                  
                ],
              ),
            ),
          )
    
          
    
    
        ],
      ),
    );
  }
}