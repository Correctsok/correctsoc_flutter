// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    int statusCode;
    bool isSuccess;
    dynamic errorMessages;
    Result result;

    UserData({
        required this.statusCode,
        required this.isSuccess,
        required this.errorMessages,
        required this.result,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        statusCode: json["statusCode"],
        isSuccess: json["isSuccess"],
        errorMessages: json["errorMessages"],
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "isSuccess": isSuccess,
        "errorMessages": errorMessages,
        "result": result.toJson(),
    };
}

class Result {
    String userId;
    String name;
    String token;

    Result({
        required this.userId,
        required this.name,
        required this.token,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        userId: json["userID"],
        name: json["name"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "userID": userId,
        "name": name,
        "token": token,
    };
}
