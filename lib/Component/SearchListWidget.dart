import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hdquoteapp/Model/SearchResponse.dart';
class SearchListWidget extends StatefulWidget {
  final Result quote;
  List<bool> selectedlist;

  int index;

  var selected = false;
  SearchListWidget({this.quote, this.selectedlist, this.index});


  @override
  State<SearchListWidget> createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            alignment: AlignmentDirectional.topEnd,
            margin: EdgeInsets.only(right: 10, top: 1, bottom: 5, left: 10),
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.green),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.5,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                                widget.quote.content,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                style: TextStyle(color: Colors.white)),
                          ),
                          Text(
                              widget.quote.author,
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.selectedlist[widget.index] = !widget.selectedlist[widget.index];

                          });
                        },
                        child: widget.selectedlist[widget.index] ?
                        Icon(Icons.favorite) : Icon(Icons.favorite_border),
                      )
                    ],
                  ),
                ),
              ),
            ))

      ],
    );
  }
}


