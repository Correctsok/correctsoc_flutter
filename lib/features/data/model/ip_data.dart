
import 'dart:convert';

List<IPData> webDataFromJson(String str) =>
    List<IPData>.from(json.decode(str).map((x) => IPData.fromJson(x)));

String webDataToJson(List<IPData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IPData {
  int port;
  String service;
  String protocol;
  String version;
  int cvEcount;
  double cssScore;
  List<dynamic> cvEsInformation;

  IPData({
    required this.port,
    required this.service,
    required this.protocol,
    required this.version,
    required this.cvEcount,
    required this.cssScore,
    required this.cvEsInformation,
  });

  factory IPData.fromJson(Map<String, dynamic> json) => IPData(
        port: json["port"],
        service: json["service"],
        protocol: json["protocol"],
        version: json["version"],
        cvEcount: json["cvEcount"],
        cssScore: json["cssScore"]?.toDouble(),
        cvEsInformation:
            List<dynamic>.from(json["cvEsInformation"].map((x) => x)),
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