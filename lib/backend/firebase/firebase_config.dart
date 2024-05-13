import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBhVIrnEiDMZX2TVP6MAUNFpSCLZB-x7Rc",
            authDomain: "ecotracker-134b2.firebaseapp.com",
            projectId: "ecotracker-134b2",
            storageBucket: "ecotracker-134b2.appspot.com",
            messagingSenderId: "608247123273",
            appId: "1:608247123273:web:ef3753921c8e1ae796de98",
            measurementId: "G-RHYMFNFB57"));
  } else {
    await Firebase.initializeApp();
  }
}
