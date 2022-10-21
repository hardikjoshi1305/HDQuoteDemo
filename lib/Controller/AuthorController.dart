import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hdquoteapp/Model/SearchAuthorResponse.dart';
import 'package:hdquoteapp/Model/SearchResponse.dart' as search;
import 'package:hdquoteapp/Network/RequestCall.dart';

class AuthorController extends GetxController {
  var isLoading = false.obs;
  var quote = SearchAuthorResponse().obs;
  var quotelist = List<Result>().obs;

  var searchquote = search.SearchResponse().obs;
  var searchquotelist = List<search.Result>().obs;
  void fetchquotelist(String value) async {
    try {
      isLoading(true);
      var res = await RequestCall.searchauthor(value);
      if (res != null) {
        quote.value = res;
        quotelist.assignAll(quote.value.results);
      }
        Fluttertoast.showToast(msg: "Quotes Retrieve Successfully");
    }
    finally {
      isLoading(false);
    }
  }

  void fetchsearchquotelist(String value) async {
    try {
      isLoading(true);
      var res = await RequestCall.searchaquote(value);
      if (res != null) {
        searchquote.value = res;
        searchquotelist.assignAll(searchquote.value.results);
      }
      Fluttertoast.showToast(msg: "Quotes Retrieve Successfully");
    }
    finally {
      isLoading(false);
    }
  }


}