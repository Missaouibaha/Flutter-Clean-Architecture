import 'package:latlong2/latlong.dart';

class AppConsts {
  static const splashDelay = 2;
  static const double designScreenHeight = 670;
  static const double designScreenWidth = 360;
  static const double minPasswordLength = 8;
  static const double minPhoneLength = 8;
  static const double minNameLength = 3;
  static const genderMaleValue = 1;
  static const genderFemaleValue = 0;
  static const double mapInitialZoom = 17;
  static const fakeDocLocationLatLng = LatLng(35.772795, 10.824776);
  static const urlTemplate =
      'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/256/{z}/{x}/{y}@2x?access_token=xxxxxxxxxx';

  static const userAgentPackageName = 'com.clean_arch_app.myapp ';
}
