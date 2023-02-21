import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CarePage extends StatefulWidget {
  @override
  _CarePageState createState() => _CarePageState();
}

class _CarePageState extends State<CarePage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('David', 25),
      _ChartData('Steve', 38),
      _ChartData('Jack', 34),
      _ChartData('Others', 52)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KakaoMapView(
          width: 200,
          height: 900,
          kakaoMapKey: 'f6d7146290bb37086efa5a0e6d0248de',
          lat: 33.450701,
          lng: 126.570667,
          showMapTypeControl: true,
          showZoomControl: true,
          markerImageURL:
          'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
          onTapMarker: (message) async {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Marker is clicked')));
          }),
      );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
