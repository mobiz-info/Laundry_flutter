import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../src/colors.dart';
import '../src/dimen.dart';
import '../src/textString.dart';
import '../util/appBar.dart';
import '../util/bottom_navigation_bar.dart';
import '../util/custom_shape.dart';
import '../util/drawer.dart';

class NavigationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NavigationScreenState();
}

class NavigationScreenState extends State<NavigationScreen> {
  static final LatLng _kMapCenter =
  LatLng(19.018255973653343, 72.84793849278007);

  static final CameraPosition _kInitialPosition =
  CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

  late GoogleMapController _controller;
  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _controller.setMapStyle(value);
  }
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height * 0.20),
        child:Appbar(text: 'Navigate to client',),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.only(top: size.height * 0.03),
                width: size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: size.width * 0.03),
                          child: Text('Client Name :'),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: size.width * 0.03),
                          width: size.width * 0.23,
                          height: size.height * 0.05,
                          padding: EdgeInsets.all(5),
                          /* decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: pickerPrimaryColor,
                                        ),*/
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: pickerPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(8),
                              ),
                              elevation: 15.0,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Call',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: size.width * 0.03,
                                top: size.height * 0.01),
                            child: Text('Mobile Number:')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: size.width * 0.03,
                                top: size.height * 0.02),
                            child: Text('Locality:')),
                        Container(
                            margin: EdgeInsets.only(
                                right: size.width * 0.25,
                                top: size.height * 0.02),
                            child: Text('Area:')),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: size.width * 0.03,
                                top: size.height * 0.02),
                            child: Text('Building No:')),
                        Container(
                            margin: EdgeInsets.only(
                                right: size.width * 0.25,
                                top: size.height * 0.02),
                            child: Text('Door No:')),
                      ],
                    ),

                    Container(

                    )


                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                height: size.height * 2.8,
                decoration: BoxDecoration(
                  color: pickerGreyColor
                ),
                child: GoogleMap(
                  initialCameraPosition: _kInitialPosition,
                  onMapCreated: onMapCreated,
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('Assets/Images/bg.png'), fit: BoxFit.fill),
        ),
        child: BottomDrawer(),
      ),
    );
  }
}
