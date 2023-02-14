import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class WalkingPage extends StatefulWidget{
  @override
  _WalkingPage createState() => _WalkingPage();
}

class _WalkingPage extends State<WalkingPage> {
  /*
  double? centerLng;
  double? centerLat;
  double _zooom = 13.2;

  @override
  void initState() {
    super.initState();
    loading = true;
    getPosition();
  }

  getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    try {
      setState(() {
        centerLng = position.longitude;
        centerLat = position.latitude;
        var loading = false;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
  
   */


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "산책 파트너 매칭",
                      style:
                      TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "산책 관리",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.015,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 70,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "매칭 설정",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: size.width * 0.9,
                  height: size.height * 0.3,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      /*
                      FlutterMap(
                        options: MapOptions(
                            zoom: _zooom,
                            maxZoom: 18.0,
                            minZoom: 2.0,
                            center: LatLng(centerLat, centerLng)),
                        layers: [
                          TileLayerOptions(
                              urlTemplate:"https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                              subdomains: ['a', 'b', 'c']),
                          MarkerLayerOptions(markers: [
                            Marker(
                                width: 30.0,
                                height: 30.0,
                                point: LatLng(centerLat, centerLng),
                                builder: (context) => Container(
                                  child: Image.asset('images/map/blue.blank.png'),
                                ))
                          ])
                        ],
                      ),

                      Container(
                          padding: EdgeInsets.only(right: 9),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *0.34)),
                              Zoom(
                                onClickIn: () {
                                  if (currentZoom == 18.0) {
                                    return null;
                                  } else {
                                    this.setState(() {
                                      currentZoom += 1;
                                    });
                                  }
                                  mapController.move(mapController.center, currentZoom);
                                },
                                onClickOut: () {
                                  if (currentZoom == 2.0) {
                                    return null;
                                  } else {
                                    this.setState(() {
                                      currentZoom -= 1;
                                    });
                                  }
                                  mapController.move(mapController.center, currentZoom);
                                },
                              ),
                            ],
                          )),
                      Container(
                        padding: EdgeInsets.only(right: 9),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Location(onClickLocation: () {
                              mapController.move(LatLng(centerLat, centerLng), currentZoom);}),
                            Padding(padding: EdgeInsets.only(bottom: 85))
                          ],
                        ),
                      )
                       */
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
