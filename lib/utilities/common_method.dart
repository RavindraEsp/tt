// import 'dart:typed_data';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_google_places/flutter_google_places.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:intl/intl.dart';
// import 'package:talent_app/logger/app_logger.dart';
// import 'package:talent_app/network/end_points.dart';
// import 'package:talent_app/utilities/constants.dart';
// import 'package:talent_app/utilities/shared_preference.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';
// import 'package:google_maps_webservice/places.dart';
//
// class CommonMethod {
//   // CommonMethod._();
//
//   static hideKeyBoard(BuildContext context) {
//     FocusScope.of(context).unfocus();
//   }
//
//   static String getDate(String inputDateString) {
//     try {
//       DateTime dateTime = DateTime.parse(inputDateString).toLocal();
//       String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
//       return formattedDate;
//     } catch (e) {
//       return "";
//     }
//   }
//
//   static String getDateTime(String inputDateString) {
//     try {
//       DateTime dateTime = DateTime.parse(inputDateString).toLocal();
//       String formattedDate = DateFormat('dd/MM/yyyy, hh:mm a').format(dateTime);
//       return formattedDate;
//     } catch (e) {
//       return "";
//     }
//   }
//
//   static String getTime(String inputDateString) {
//     //String inputDateString = "2023-12-01T08:27:39.000Z";
//     // Parse the input date string
//     try {
//       DateTime dateTime = DateTime.parse(inputDateString).toLocal();
//
//       // Format the date according to the desired format
//       String formattedDate = DateFormat('hh:mm a').format(dateTime);
//
//       return formattedDate;
//     } catch (e) {
//       return "";
//     }
//   }
//
//   static Future<Uint8List?> getThumbnail(String url) async {
//     final uint8list = await VideoThumbnail.thumbnailData(
//       //  video: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
//       video: Endpoints.imageBaseUrl + url,
//       imageFormat: ImageFormat.JPEG,
//       // maxHeight: 64, // specify the height of the thumbnail, width will be calculated to maintain aspect ratio
//       //  quality: 75,
//     );
//     return uint8list;
//   }
//
//   Future<LocationModel> openLocationPicker(BuildContext context) async {
//     LocationModel locationModel = LocationModel();
//     Prediction? p = await PlacesAutocomplete.show(
//         offset: 0,
//         radius: 1000,
//         types: [],
//         strictbounds: false,
//         region: "ar",
//         context: context,
//         apiKey: Constant.mapKey,
//         mode: Mode.overlay,
//         language: "en",
//         components: [
//           Component(Component.country, "ind"),
//           Component(Component.country, "il")
//         ]);
//
//     if (p != null) {
//       GoogleMapsPlaces _places = GoogleMapsPlaces(
//         apiKey: Constant.mapKey,
//       ); //Same API_KEY as above
//       PlacesDetailsResponse detail =
//           await _places.getDetailsByPlaceId(p.placeId!);
//
//       Map<String, dynamic> data;
//
//       if (detail.result.addressComponents.isNotEmpty) {
//         var selectLocation = p.description!;
//
//         String location = selectLocation;
//
//         double lat = detail.result.geometry?.location.lat.toDouble() ?? 0.0;
//         double lng = detail.result.geometry?.location.lng.toDouble() ?? 0.0;
//
//         locationModel = LocationModel(address: location, lat: lat, lng: lng);
//         AppLogger.logD("Lat long is - ${lat} ${lng}");
//         AppLogger.logD("selectLocation - $selectLocation");
//       }
//     }
//
//     return locationModel;
//   }
//
//   bool isRTL() {
//     return Preference().getLanguage() == "he" ? true : false;
//   }
// }
//
// class LocationModel {
//   String? address;
//   double? lat;
//   double? lng;
//
//   LocationModel({this.address, this.lat, this.lng});
// }
