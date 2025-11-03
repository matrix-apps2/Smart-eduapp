// ignore_for_file: file_names
import '../../../utils/extensions/num_extensions.dart';
import '../../../utils/routes/navigation_services.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetLocationFromMapScreen extends StatefulWidget {
  final double? lat;
  final double? lng;

  const GetLocationFromMapScreen({this.lat, this.lng, Key? key})
      : super(key: key);

  @override
  State<GetLocationFromMapScreen> createState() =>
      _GetLocationFromMapScreenState();
}

class _GetLocationFromMapScreenState extends State<GetLocationFromMapScreen> {
  late final GoogleMapController mapController;
  final CameraPosition initialPosition =
      const CameraPosition(target: LatLng(23.8859, 45.0792), zoom: 6);
  LatLng? tappedLocation;

  bool isLight = true;

  @override
  void initState() {
    super.initState();
    if (widget.lat != null && widget.lng != null) {
      tappedLocation = LatLng(widget.lat!, widget.lng!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: isLight ? MapType.normal : MapType.hybrid,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: initialPosition,
            onMapCreated: (GoogleMapController controller) =>
                mapController = controller,
            onTap: (latLng) => setState(() => tappedLocation = latLng),
            markers: {
              if (tappedLocation != null)
                Marker(
                    markerId: const MarkerId("Tapped-location"),
                    position: tappedLocation!)
            },
          ),
          SafeArea(
            child: GestureDetector(
              onTap: () => AppNavigation.goBack(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    shape: BoxShape.circle),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            right: 50.w,
            top: 35.h,
            child: GestureDetector(
              onTap: () => setState(() {
                isLight = !isLight;
              }),
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
                child: const Icon(Icons.satellite_alt, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: tappedLocation == null
          ? null
          : FloatingActionButton(
              onPressed: () => AppNavigation.goBack(tappedLocation),
              child: const Icon(Icons.check),
            ),
    );
  }
}
