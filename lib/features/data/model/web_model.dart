// نموذج WebData لتحليل البيانات من JSON
import 'dart:convert';

List<WebData> webDataFromJson(String str) => List<WebData>.from(json.decode(str).map((x) => WebData.fromJson(x)));

String webDataToJson(List<WebData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WebData {
  int port;
  String service;
  String protocol;
  String version;
  int cvEcount;
  int cssScore;
  List<dynamic> cvEsInformation;

  WebData({
    required this.port,
    required this.service,
    required this.protocol,
    required this.version,
    required this.cvEcount,
    required this.cssScore,
    required this.cvEsInformation,
  });

  factory WebData.fromJson(Map<String, dynamic> json) => WebData(
    port: json["port"],
    service: json["service"],
    protocol: json["protocol"],
    version: json["version"],
    cvEcount: json["cvEcount"],
    cssScore: json["cssScore"],
    cvEsInformation: List<dynamic>.from(json["cvEsInformation"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "port": port,
    "service": service,
    "protocol": protocol,
    "version": version,
    "cvEcount": cvEcount,
    "cssScore": cssScore,
    "cvEsInformation": List<dynamic>.from(cvEsInformation.map((x) => x)),
  };
}