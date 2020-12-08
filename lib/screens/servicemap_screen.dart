import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ServiceMapScreen extends StatefulWidget {
  ServiceMapScreen({Key key}) : super(key: key);

  @override
  _ServiceMapScreenState createState() => _ServiceMapScreenState();
}

class _ServiceMapScreenState extends State<ServiceMapScreen> {
  GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  LatLng latLng = LatLng(13.9365021, 100.643813);

  //Marker
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{
    MarkerId('สาขาหลัก'): Marker(
        markerId: MarkerId('สาขาหลัก'),
        position: LatLng(13.9365021, 100.643813),
        infoWindow: InfoWindow(
            title: 'สำนักงานใหญ่', snippet: '3/206 edinboro street joondanna'),
        onTap: () {
          print('Marker Tapped1');
        },
        onDragEnd: (LatLng position) {
          print('Drag End');
        }),
    MarkerId('สาขาย่อย'): Marker(
        markerId: MarkerId('สาขาหลัก'),
        position: LatLng(13.93758, 100.644790),
        infoWindow:
            InfoWindow(title: 'วัดโพสพ', snippet: '3/206 edinboro street joondanna'),
        onTap: () {
          print('Marker Tapped2');
        },
        onDragEnd: (LatLng position) {
          print('Drag End2');
        })
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('พื้นที่ให้บริการของเรา'),
      ),
      body: GoogleMap(
        markers: Set<Marker>.of(markers.values),
        initialCameraPosition: CameraPosition(target: latLng, zoom: 17.0),
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
