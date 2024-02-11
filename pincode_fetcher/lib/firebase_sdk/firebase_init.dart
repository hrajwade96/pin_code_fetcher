import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';


class FirebaseHelper {
  static final FirebaseHelper _firebaseHelper = FirebaseHelper._internal();

  factory FirebaseHelper() {
    return _firebaseHelper;
  }

  Future<void> init(FirebaseOptions firebaseOptions) async {
    await Firebase.initializeApp(options: firebaseOptions);
  }

  Future<void> logEventData(
      String eventName, Map<String, Object?>? parameters) async {
    await FirebaseAnalytics.instance
        .logEvent(name: eventName, parameters: parameters);
  }

  FirebaseHelper._internal();
}
