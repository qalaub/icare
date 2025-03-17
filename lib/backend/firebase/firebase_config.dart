import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBTiOA4TZxmgiTUfs5kMrnPPjKKkYCloVY",
            authDomain: "icaredb-95d57.firebaseapp.com",
            projectId: "icaredb-95d57",
            storageBucket: "icaredb-95d57.appspot.com",
            messagingSenderId: "460453921403",
            appId: "1:460453921403:web:cd6baf0a022289806798de",
            measurementId: "G-KM9D6J0ZDL"));
  } else {
    await Firebase.initializeApp();
  }
}
