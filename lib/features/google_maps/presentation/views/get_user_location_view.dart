import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetUserLocationView extends StatelessWidget {
  const GetUserLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get User Location'),
      ),
      body: Center(
        child: Container(
          // padding: EdgeInsets.all(10.r),
          margin: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.r),
          ),
          height: 600.h,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(0, 0),
            ),
          ),
        ),
      ),
    );
  }
}
