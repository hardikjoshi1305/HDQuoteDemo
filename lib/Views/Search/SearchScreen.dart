import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hdquoteapp/Component/AuthorListWidget.dart';
import 'package:hdquoteapp/Component/SearchListWidget.dart';
import 'package:hdquoteapp/Controller/AuthorController.dart';

import '../../Utility/CommandMethod.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var search;
  List<bool> selectedlist = new List();

  AuthorController authorController = Get.put(AuthorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text('Search Quote'),
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
                      await authorController.fetchsearchquotelist(value);
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              authorController.searchquotelist != null
                  ?  Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:         Obx(() => (authorController.isLoading.value)
                      ? Center(child: CircularProgressIndicator())
                      : authorController.searchquotelist !=
                      null
                      ? Column(
                    children: [
                      ...authorController
                          .searchquotelist
                          .map((element) {
                        var indexc = authorController.searchquotelist
                            .indexOf(element);
                        selectedlist.add(false);
                        return SearchListWidget(quote: element,selectedlist: selectedlist,index:indexc);
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
