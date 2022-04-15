import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:ui_practice/model/celebrity.dart';
import 'package:ui_practice/model/favourates.dart';

class ApiProvider {
  Client client = Client();
  var responseJson;

  Future<CelebrityModel> getCelebrityList(int pageNo) async {
    try {
      final response = await client.get(
          Uri.parse(
              "http://ec2-52-25-57-141.us-west-2.compute.amazonaws.com:8089/picstar/getCelebritiesByCategoryForUser?per_page=10&page=$pageNo&category_id=-1&user_id=google-oauth2%7C112969994106309372599"),
          headers: {
            HttpHeaders.authorizationHeader:
                "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InBxdVh1YXFScTJQczdqejhoRVNLLSJ9.eyJnaXZlbl9uYW1lIjoiZGV2IiwiZmFtaWx5X25hbWUiOiJyYWJiaXQiLCJuaWNrbmFtZSI6ImRldnJhYmJpdGl0IiwibmFtZSI6IkRldlJhYmJpdCIsInBpY3R1cmUiOiJodHRwczovL3MzLnVzLXdlc3QtMi5hbWF6b25hd3MuY29tL3BpY3N0YXIvcHJvZmlsZV9waWNzLzdhMjIxMWVmLWE5YjMtNGMxYi1iZGVmLTBhZjRjYzJiMDk2NiIsImxvY2FsZSI6ImVuIiwidXBkYXRlZF9hdCI6IjIwMjEtMTItMTRUMDU6NTk6MjUuNDcxWiIsImVtYWlsIjoiZGV2cmFiYml0aXRAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImlzcyI6Imh0dHBzOi8vZGV2LWZ3aHVnbXVzLnVzLmF1dGgwLmNvbS8iLCJzdWIiOiJnb29nbGUtb2F1dGgyfDExMjk2OTk5NDEwNjMwOTM3MjU5OSIsImF1ZCI6Iks0YVFHSWZ0b1N2ZjFPWlZhc3g5ZW1NamtGRjVEQ3dhIiwiaWF0IjoxNjM5NDYxNTY2LCJleHAiOjE2NDk4Mjk2OTgsIm5vbmNlIjoiZDNmRHhiSUE4RE1RVE5TZUxham5mSEtPSWh2NDBNZS1wQ1p2QmFsQkNmYyJ9.EMgOqh_YYOVIHQXOwxx1rb10vA9Flm5XeyDhgZIkqndgwogMrq81BFe0js_05mBU07Ku7MWx5Iqdunst6N7oGT2jkjtIDfakSl3jK4OGooz8abhQxTEZfs4lBGfJbbOkwdLB5f86luvBAn-ublMBXTREk3D6pdFMK8ilOkxtO_SBGGSAQ_OgXUXaQVndlIPacKgtIDKRSzdpN7RdKJRfAyww3MIrr9UUDNC1Ge8sdNej4Yt4Hj1g3nE4ckRnLMIB7-k8b8AOy54dRttizi-QFaYRlzWqycvn0UNXYxXFTDcCueuHnd3-s-G_mrmq8GHshhIIddWhHAmF3ssU6yojEw"
          });

      responseJson = json.decode(response.body);
      log("Api_Provider Celebrity response ==${responseJson.toString()}");
      if (response.statusCode == 200) {
        return CelebrityModel.fromJson(responseJson);
      }
    } catch (e) {
      print("error message $e");
    }
    throw Exception("");
  }

  Future<FavouratiesModel> favourates(String celebrity_Id) async {
    var map = {
      "celebrity_id": celebrity_Id,
      "fav_status": true,
      "user_id": "google-oauth2|112969994106309372599"
    };
    try {
      var jsonBody = json.encode(map);
      log("Api_Provider Celebrity request ==${jsonBody.toString()}");
      final response = await client.post(
          Uri.parse(
              "http://ec2-52-25-57-141.us-west-2.compute.amazonaws.com:8089/picstar/addCelebrityToMyFavourites"),
          headers: {
            'Content-Type': 'application/json',
            HttpHeaders.authorizationHeader:
                "Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6InBxdVh1YXFScTJQczdqejhoRVNLLSJ9.eyJnaXZlbl9uYW1lIjoiZGV2IiwiZmFtaWx5X25hbWUiOiJyYWJiaXQiLCJuaWNrbmFtZSI6ImRldnJhYmJpdGl0IiwibmFtZSI6IkRldlJhYmJpdCIsInBpY3R1cmUiOiJodHRwczovL3MzLnVzLXdlc3QtMi5hbWF6b25hd3MuY29tL3BpY3N0YXIvcHJvZmlsZV9waWNzLzdhMjIxMWVmLWE5YjMtNGMxYi1iZGVmLTBhZjRjYzJiMDk2NiIsImxvY2FsZSI6ImVuIiwidXBkYXRlZF9hdCI6IjIwMjEtMTItMTRUMDU6NTk6MjUuNDcxWiIsImVtYWlsIjoiZGV2cmFiYml0aXRAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImlzcyI6Imh0dHBzOi8vZGV2LWZ3aHVnbXVzLnVzLmF1dGgwLmNvbS8iLCJzdWIiOiJnb29nbGUtb2F1dGgyfDExMjk2OTk5NDEwNjMwOTM3MjU5OSIsImF1ZCI6Iks0YVFHSWZ0b1N2ZjFPWlZhc3g5ZW1NamtGRjVEQ3dhIiwiaWF0IjoxNjM5NDYxNTY2LCJleHAiOjE2NDk4Mjk2OTgsIm5vbmNlIjoiZDNmRHhiSUE4RE1RVE5TZUxham5mSEtPSWh2NDBNZS1wQ1p2QmFsQkNmYyJ9.EMgOqh_YYOVIHQXOwxx1rb10vA9Flm5XeyDhgZIkqndgwogMrq81BFe0js_05mBU07Ku7MWx5Iqdunst6N7oGT2jkjtIDfakSl3jK4OGooz8abhQxTEZfs4lBGfJbbOkwdLB5f86luvBAn-ublMBXTREk3D6pdFMK8ilOkxtO_SBGGSAQ_OgXUXaQVndlIPacKgtIDKRSzdpN7RdKJRfAyww3MIrr9UUDNC1Ge8sdNej4Yt4Hj1g3nE4ckRnLMIB7-k8b8AOy54dRttizi-QFaYRlzWqycvn0UNXYxXFTDcCueuHnd3-s-G_mrmq8GHshhIIddWhHAmF3ssU6yojEw"
          },
          body: jsonBody);

      responseJson = json.decode(response.body);
      log("Api_Provider Celebrity response ==${responseJson.toString()}");
      if (response.statusCode == 200) {
        return FavouratiesModel.fromJson(responseJson);
      } else if (response.statusCode == 400) {
        throw BadRequestException(response.body.toString());
      }
    } catch (e) {
      print("error message $e");
    }
    ;
    throw Exception("");
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
