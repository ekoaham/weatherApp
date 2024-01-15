import 'package:geolocator/geolocator.dart';

class Location{
  double longitude = 0.0 ;
  double latitude = 0.0;
  // void check() async{
  //   LocationPermission permission = await Geolocator.checkPermission();
  // }
  // void req() async{
  //   LocationPermission permission = await Geolocator.requestPermission();
  // }
  Future<void> getLocationInfo() async {
    // check(); req();
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;

    }
    catch(e){
      print(e);

    }
  }
  // void getLO() async{
  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
  //   long = position.longitude;
  //   print(long);
  // }
  // void getLa() async{
  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
  //   lati = position.latitude;
  //   print(lati);
  // }

}