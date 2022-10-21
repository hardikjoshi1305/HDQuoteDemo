import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hdquoteapp/Component/AuthorListWidget.dart';
import 'package:hdquoteapp/Controller/AuthorController.dart';

import '../../Utility/CommandMethod.dart';

class AuthorScreen extends StatefulWidget {
  const AuthorScreen({Key key}) : super(key: key);

  @override
  State<AuthorScreen> createState() => _AuthorScreenState();
}

class _AuthorScreenState extends State<AuthorScreen> {
  var search;
  List<bool> selectedlist = new List();

  AuthorController authorController = Get.put(AuthorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text('Author Quote'),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child:
      Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) async {
                search = value;
                if (value.length > 3) {
                  await authorController.fetchquotelist(value);
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Type Author Name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          authorController.quotelist != null
              ?  Container(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:         Obx(() => (authorController.isLoading.value)
                            ? Center(child: CircularProgressIndicator())
                            : authorController.quotelist !=
                            null
                            ? Column(
                          children: [
                            ...authorController
                                .quotelist
                                .map((element) {
                              print("userlist" + element.name);
                              var indexc = authorController.quotelist
                                  .indexOf(element);
                              selectedlist.add(false);
                              return AuthListWidget(quote: element,selectedlist: selectedlist,index:indexc);
                            }).toList()
                          ],
                        )
                            : Container()),),
                  )
              : nodatafound()
        ],
      )),
    );
  }
}
