import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class EnterMap {
 static void launchMap(String address) async {
  String query = Uri.encodeComponent(address);
  // Uri googleUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=$query");


  // if (await canLaunchUrl(googleUrl)) {
  //   await launchUrl(googleUrl);
  // }
  String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";

  if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
  }
}
static void navigateTo(double lat, double lng) async {
   var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
   if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
   } else {
      throw 'Could not launch ${uri.toString()}';
   }
}

}
class MapUtils {

  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    Uri googleUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    
    if (await canLaunchUrl(googleUrl)) {
      await launchUrl(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
  
}
