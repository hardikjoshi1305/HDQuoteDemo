import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hdquoteapp/Model/SearchAuthorResponse.dart';
import 'package:hdquoteapp/Model/SearchResponse.dart';
import 'package:http/http.dart' as http;

class RequestCall {
  static var client = http.Client();
  // static var BASEURL = "http://192.168.0.8/inventorymanagement/api/";
  static var BASEURL = "https://api.quotable.io/";


  static Future searchauthor(String query) async {
    final body = jsonEncode({
      'search': query,
    });
    var response = await client
        .get(BASEURL + 'authors?query=${query}')
        .catchError((error) {
      print("error" + error.toString());
      Fluttertoast.showToast(msg: error.toString());
    });
    if (response.statusCode == 200) {
      print("success" + response.body.toString());

      var json = response.body;
      var finaldata = jsonDecode(json);
      var castsResp = searchAuthorResponseFromJson(json);
      return castsResp;
    } else {
      return null;
    }
  }

  static Future searchaquote(String query) async {

    var response = await client
        .get(BASEURL + 'search/quotes?query=${query}')
        .catchError((error) {
      print("error" + error.toString());
      Fluttertoast.showToast(msg: error.toString());
    });
    if (response.statusCode == 200) {
      print("success" + response.body.toString());

      var json = response.body;
      var finaldata = jsonDecode(json);
      var castsResp = searchResponseFromJson(json);
      return castsResp;
    } else {
      return null;
    }
  }


}
