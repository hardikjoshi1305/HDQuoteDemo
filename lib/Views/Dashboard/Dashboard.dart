import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hdquoteapp/Views/Author/AuthorScreen.dart';
import 'package:hdquoteapp/Views/Search/SearchScreen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text('HD Quote App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
           onTap: (){
            Get.to(() => AuthorScreen());
           },
            child: Container(
                alignment: AlignmentDirectional.topEnd,
                margin: EdgeInsets.only(right: 40, top: 6, bottom: 12,left: 40),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.green),
                    ),
                    child: Text(
                        "Author Quotes",
                        style: TextStyle(color: Colors.white)),
                  ),
                )),
          ),
          GestureDetector(
            onTap: (){
              Get.to(() => SearchScreen());
            },
            child: Container(
                alignment: AlignmentDirectional.topEnd,
                margin: EdgeInsets.only(right: 40, top: 6, bottom: 12,left: 40),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.green),
                    ),
                    child: Text(
                        "Search Quotes",
                        style: TextStyle(color: Colors.white)),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
