import 'dart:convert';

import 'package:correctsoc/features/presentation/screens/pinTest/checportIp/chek_port_ip.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../data/model/ip_data.dart';
import '../../tools/backgroundimage1.dart';
import '../../tools/widgets/custom_appbar.dart';

class IPscan extends StatefulWidget {
  const IPscan({super.key});

  @override
  State<IPscan> createState() => _IPscanState();
}

class _IPscanState extends State<IPscan> {
  late Future<List<IPData>> _ipDataFuture;

  @override
  void initState() {
    super.initState();
    _ipDataFuture = fetchWebData();
  }

  Future<List<IPData>> fetchWebData() async {
    var dio = Dio();
    var response = await dio.request(
      'http://correct.somee.com/api/PortScanner/nmap?input=197.46.44.175',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      List<IPData> data = webDataFromJson(json.encode(response.data));
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background2Widget(),
          const CustomAppBar(),
          const CustomDivider(),
          ChekPortIP(ipDataFuture: _ipDataFuture),
        ],
      ),
    );
  }
}

