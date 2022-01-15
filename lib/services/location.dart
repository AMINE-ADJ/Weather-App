import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class Location  {
  double? latitude;
  double? longitude;

  Future<void> getCurrentlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      //accuracy tzid=> battery tahbet..so ill be kind to my users nd put it low  : )
     this.longitude=  position.longitude;
     this.latitude =  position.latitude;
    }
    catch (exception) {
      print(exception);
    }
  }
}
