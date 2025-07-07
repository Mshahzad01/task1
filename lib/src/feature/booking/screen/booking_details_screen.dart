// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:task1/src/constant/textstyle.dart';
// import 'package:task1/src/core/extension/context_ext.dart';

// import 'package:task1/src/feature/booking/model/bookingmodel.dart';
// import '../../../constant/asset_string.dart';

// class BookingDetailScreen extends StatefulWidget {
//   final Bookingmodel booking;

//   const BookingDetailScreen({super.key, required this.booking});

//   @override
//   State<BookingDetailScreen> createState() => _BookingDetailScreenState();
// }

// class _BookingDetailScreenState extends State<BookingDetailScreen> {
//   GoogleMapController? _mapController;

//   final LatLng _startLocation = const LatLng(37.426, -122.080);
//   final LatLng _endLocation = const LatLng(37.419, -122.088);
//   String _mapStyle = "";

//   Future<void> _loadMapStyle() async {
//     _mapStyle = await rootBundle.loadString('assets/map_style_dark.json');
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadMapStyle();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.white,
//         elevation: 0,
//         title: Column(
//           children: [
//             Text('Booking Quote', style: AppTextStyles.button),
//             Text('\$${widget.booking.price}', style: AppTextStyles.title),
//           ],
//         ),
//         centerTitle: true,
//         actions: const [Icon(Icons.more_vert)],
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: _startLocation,
//               zoom: 14,
//             ),
//             mapType: MapType.normal,
//             markers: {
//               Marker(
//                 markerId: const MarkerId('start'),
//                 position: _startLocation,
//                 icon: BitmapDescriptor.defaultMarkerWithHue(
//                   BitmapDescriptor.hueBlue,
//                 ),
//               ),
//               Marker(
//                 markerId: const MarkerId('end'),
//                 position: _endLocation,
//                 icon: BitmapDescriptor.defaultMarkerWithHue(
//                   BitmapDescriptor.hueRed,
//                 ),
//               ),
//             },
//             polylines: {
//               Polyline(
//                 polylineId: const PolylineId("route"),
//                 color: Colors.white,
//                 width: 4,
//                 points: [_startLocation, _endLocation],
//               ),
//             },
//             onMapCreated: (controller) async {
//               _mapController = controller;
//               controller.setMapStyle(_mapStyle);
//             },
//           ),

//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.7),
//                 borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(10),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundImage: AssetImage(widget.booking.pitcher),
//                     radius: 30,
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           widget.booking.name,
//                           style: context.myTextTheme.bodyMedium?.copyWith(
//                             fontSize: 14,
//                           ),
//                         ),
//                         const SizedBox(height: 6),
//                         // Column(
//                         //   children: [
//                         //     Container(
//                         //       padding: const EdgeInsets.symmetric(
//                         //         horizontal: 8,
//                         //         vertical: 4,
//                         //       ),
//                         //       decoration: BoxDecoration(
//                         //         color: Colors.white24,
//                         //         borderRadius: BorderRadius.circular(8),
//                         //       ),
//                         //       child: Text(
//                         //         "${widget.booking.distance1} km",
//                         //         style: const TextStyle(color: Colors.white),
//                         //       ),
//                         //     ),
//                         //     const SizedBox(height: 10),
//                         //     Container(
//                         //       padding: const EdgeInsets.symmetric(
//                         //         horizontal: 8,
//                         //         vertical: 4,
//                         //       ),
//                         //       decoration: BoxDecoration(
//                         //         color: Colors.white24,
//                         //         borderRadius: BorderRadius.circular(8),
//                         //       ),
//                         //       child: Text(
//                         //         "${widget.booking.distance2} km",
//                         //         style: const TextStyle(color: Colors.white),
//                         //       ),
//                         //     ),
//                         //   ],
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.8),
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Private Driver",
//                         style: context.myTextTheme.bodyMedium?.copyWith(
//                           color: Colors.white70,
//                           fontSize: 14,
//                         ),
//                       ),
//                       Text(
//                         "IDN Pro",
//                         style: context.myTextTheme.bodyMedium?.copyWith(
//                           color: Colors.white70,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 08),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SvgPicture.asset(AssetString.startloc),
//                       SizedBox(width: 05),
//                       Text(
//                         widget.booking.startLocation,
//                         style: context.myTextTheme.bodyMedium?.copyWith(
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 08),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SvgPicture.asset(AssetString.endloc),
//                       SizedBox(width: 05),
//                       Text(
//                         widget.booking.endLocation,
//                         style: context.myTextTheme.bodyMedium?.copyWith(
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 15),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text("Go To A", style: TextStyle(color: Colors.blue)),
//                       Text("Arrived", style: TextStyle(color: Colors.white)),
//                       Text("Go To B", style: TextStyle(color: Colors.white)),
//                     ],
//                   ),

//                   Slider(
//                     value: 0.5,
//                     onChanged: (value) {},
//                     activeColor: Colors.blue,
//                     inactiveColor: Colors.grey,
//                   ),

//                   const SizedBox(height: 12),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xff9a3b43),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                       ),
//                       onPressed: () {},
//                       child: const Text(
//                         "Withdraw Quote",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task1/src/constant/textstyle.dart';
import 'package:task1/src/core/extension/context_ext.dart';
import 'package:task1/src/feature/booking/model/bookingmodel.dart';
import '../../../constant/asset_string.dart';

class BookingDetailScreen extends StatefulWidget {
  final Bookingmodel booking;

  const BookingDetailScreen({super.key, required this.booking});

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  GoogleMapController? _mapController;
  final LatLng _startLocation = const LatLng(37.426, -122.080);
  final LatLng _endLocation = const LatLng(37.419, -122.088);
  String _mapStyle = "";

  Future<void> _loadMapStyle() async {
    _mapStyle = await rootBundle.loadString('assets/map_style_dark.json');
  }

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text('Booking Quote', style: AppTextStyles.button),
            Text('\$${widget.booking.price}', style: AppTextStyles.title),
          ],
        ),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _startLocation,
              zoom: 14,
            ),
            mapType: MapType.normal,
            markers: {
              Marker(
                markerId: const MarkerId('start'),
                position: _startLocation,
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
              ),
              Marker(
                markerId: const MarkerId('end'),
                position: _endLocation,
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
              ),
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId("route"),
                color: Colors.white,
                width: 4,
                points: [_startLocation, _endLocation],
              ),
            },
            onMapCreated: (controller) async {
              _mapController = controller;
              controller.setMapStyle(_mapStyle);
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.booking.pitcher),
                    radius: 30,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.booking.name,
                      style: context.myTextTheme.bodyMedium?.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Private Driver",
                        style: context.myTextTheme.bodyMedium?.copyWith(color: Colors.white70, fontSize: 14),
                      ),
                      Text(
                        "IDN Pro",
                        style: context.myTextTheme.bodyMedium?.copyWith(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(AssetString.startloc),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          widget.booking.startLocation,
                          style: context.myTextTheme.bodyMedium?.copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(AssetString.endloc),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          widget.booking.endLocation,
                          style: context.myTextTheme.bodyMedium?.copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Go To A", style: TextStyle(color: Colors.blue)),
                      Text("Arrived", style: TextStyle(color: Colors.white)),
                      Text("Go To B", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Slider(
                    value: 0.5,
                    onChanged: (value) {},
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff9a3b43),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Withdraw Quote",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

