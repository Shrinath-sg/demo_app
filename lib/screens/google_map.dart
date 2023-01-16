import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';
import 'package:label_marker/label_marker.dart';
import 'dart:ui' as ui;

class GooglMapScreen extends StatefulWidget {
  const GooglMapScreen({super.key});

  @override
  State<GooglMapScreen> createState() => _GooglMapScreenState();
}

class _GooglMapScreenState extends State<GooglMapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Set<Marker> markers = {};
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void setCustomIcons() async {
    final Uint8List sourceMarkerIcon =
        await getBytesFromAsset('assets/images/sedan-icon.png', 100);
    sourceIcon = BitmapDescriptor.fromBytes(sourceMarkerIcon);
    log('calling this');
  }

  @override
  void initState() {
    setCustomIcons();
    getInitials();

    super.initState();
  }

  void getInitials() async {
    final provider = Provider.of<MyProvider>(context, listen: false);
    await provider.getLocationData();

    markers
        .addLabelMarker(
          LabelMarker(
              label: provider.loginData.policyDetails!.first!.vehicleNo ?? '',
              zIndex: -2,
              icon: sourceIcon,
              markerId: const MarkerId('source'),

              // icon: sourceIcon,
              position: LatLng(provider.locationData.lat as double,
                  (provider.locationData.lon as double))),
        )
        .then((value) => setState(() {}));
  }
  // provider.

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(provider.loginData.policyDetails!.first!.vehicleNo ?? ''),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     getInitials();
      //   },
      //   child: Text('dsdsd'),
      // ),
      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                  target: LatLng(provider.locationData.lat as double,
                      provider.locationData.lon as double),
                  zoom: 14.5),
              markers: markers,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
    );
  }
}
