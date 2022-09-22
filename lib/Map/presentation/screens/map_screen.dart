import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flavor/flavor_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widgets/category_chip.dart';
import '../widgets/place_card.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(30.0504132, 31.2073222),
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
              size:const Size(140, 140),
            ),
            draggable: false,
            position: const LatLng(30.079699731937378, 31.19522407650948),
          ),
          Marker( 
            markerId: const MarkerId('marker2'),
            icon: BitmapDescriptor.fromBytes(markerIcon),
            draggable: false,
            position: const LatLng(30.056090672183135, 31.222061924636368),
          ),
          Marker(
            markerId:const MarkerId('marker3'),
            icon: BitmapDescriptor.fromBytes(markerIcon),
            draggable: false,
            position: const LatLng(30.05731441015454, 31.246071718633175),
          ),
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
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
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
                  height: MediaQuery.of(context).size.height * .25
                  ,
                  width: MediaQuery.of(context).size.width,
                  blur: 5,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8, bottom: 8),
                          child: Text(
                            'Nearst Places',
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
                              children: List.filled(
                                4,
                                PlaceCard(),
                              ),
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
                        'Nearst Places',
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
                                children: List.filled(
                                  4,
                                  PlaceCard(),
                                ),
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
