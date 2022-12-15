import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flavor/flavor_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/place_card.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(30.55479017421879, 31.0125502547238),
    zoom: 12.5,
  );
  late final GoogleMapController googleMapController;
  final Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final byteData =
          await DefaultAssetBundle.of(context).load(AppImages.MAP_PIN);
      final markerIcon = byteData.buffer.asUint8List();
      setState(() {
        markers.addAll({
          Marker(
            markerId: const MarkerId('marker1'),
            icon: BitmapDescriptor.fromBytes(
              markerIcon,
              size: const Size(140, 140),
            ),
            draggable: false,
            position: const LatLng(30.55479017421879, 31.0125502547238),
          ),
          // Marker(
          //   markerId: const MarkerId('marker2'),
          //   icon: BitmapDescriptor.fromBytes(markerIcon),
          //   draggable: false,
          //   position: const LatLng(30.07505431363671, 31.50397582446508),
          // ),
          // Marker(
          //   markerId: const MarkerId('marker3'),
          //   icon: BitmapDescriptor.fromBytes(markerIcon),
          //   draggable: false,
          //   position: const LatLng(30.0326172, 31.3032934),
          // ),
        });
      });
    });
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          myLocationButtonEnabled: false,
          myLocationEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) {
            googleMapController = controller;
          },
          onTap: (pos) => print('Location $pos'),
          markers: markers,
        ),
        //CategoriesBaner(),
        ScreenUtil().orientation == Orientation.portrait
            ? Align(
                alignment: Alignment.bottomCenter,
                child: BlurryContainer(
                  color: Colors.white.withOpacity(0.0),
                  //filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  height: 155.sp,
                  width: MediaQuery.of(context).size.width,
                  blur: 5,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 8),
                          child: Text(
                            'Nearst Branches',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        //PlaceCard(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                PlaceCard(
                                  address: 'Shebin al-Kom, El Monofiya',
                                  onPress: () {
                                    googleMapController.animateCamera(
                                        CameraUpdate.newLatLng(
                                            LatLng(30.55479017421879, 31.0125502547238)));
                                  },
                                ),
                                // PlaceCard(
                                //   address: 'الرحاب 2',
                                //   onPress: () {
                                //     googleMapController.animateCamera(
                                //         CameraUpdate.newLatLng(LatLng(
                                //             30.07505431363671,
                                //             31.50397582446508)));
                                //   },
                                // ),
                                // PlaceCard(
                                //   address: 'مدينة نصر',
                                //   onPress: () {
                                //     googleMapController.animateCamera(
                                //         CameraUpdate.newLatLng(
                                //             LatLng(30.0326172, 31.3032934)));
                                //   },
                                // ),
                                // PlaceCard(
                                //   address: '423 فيصل الرئيسى، محطة مدكور، أمام العشرين',
                                //   onPress: () {
                                //     googleMapController.animateCamera(
                                //         CameraUpdate.newLatLng(LatLng(
                                //             30.05731441015454,
                                //             31.246071718633175)));
                                //   },
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              )
            : Align(
                alignment: Alignment.topLeft,
                child: BlurryContainer(
                  color: Colors.white.withOpacity(0.0),
                  height: MediaQuery.of(context).size.height,
                  //width: MediaQuery.of(context).size.width,
                  blur: 5,
                  elevation: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nearst Branches',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               PlaceCard(
                                  address: 'Shebin al-Kom, El Monofiya',
                                  onPress: () {
                                    googleMapController.animateCamera(
                                        CameraUpdate.newLatLng(
                                            LatLng(30.55479017421879, 31.0125502547238)));
                                  },
                                ),
                              // PlaceCard(
                              //   address: 'الرحاب 2',
                              //   onPress: () {
                              //     googleMapController.animateCamera(
                              //         CameraUpdate.newLatLng(LatLng(
                              //             30.07505431363671,
                              //             31.50397582446508)));
                              //   },
                              // ),
                              // PlaceCard(
                              //   address: 'مدينة نصر',
                              //   onPress: () {
                              //     googleMapController.animateCamera(
                              //         CameraUpdate.newLatLng(
                              //             LatLng(30.0326172, 31.3032934)));
                              //   },
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
      ],
    );
  }
}
