import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saif_transfers_web/core/utils/images.dart';

class GoogleMapWidget extends StatefulWidget {
  final LatLng initialPosition;

  const GoogleMapWidget({super.key, required this.initialPosition});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
  }

  Future<void> _loadCustomMarker() async {
    final ByteData byteData = await rootBundle.load(
      ImageConstants.placeIndicator,
    );
    final codec = await ui.instantiateImageCodec(
      byteData.buffer.asUint8List(),
      targetWidth: 500,
    );
    final frame = await codec.getNextFrame();
    final data = await frame.image.toByteData(format: ui.ImageByteFormat.png);

    final Uint8List markerImageBytes = data!.buffer.asUint8List();

    // ignore: deprecated_member_use
    final customIcon = BitmapDescriptor.fromBytes(markerImageBytes);

    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('user_location'),
          position: widget.initialPosition,
          icon: customIcon,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: widget.initialPosition,
        zoom: 15,
      ),
      myLocationEnabled: false, // Disable default blue dot
      myLocationButtonEnabled: true,
      mapType: MapType.normal,
      markers: _markers,
      onMapCreated: (GoogleMapController controller) {
      },
    );
  }
}
