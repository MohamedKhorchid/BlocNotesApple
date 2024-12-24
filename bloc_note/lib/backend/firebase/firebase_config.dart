import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBFuRTIpZB7rULce8bF1M0O0gq8k3QCL4w",
            authDomain: "blocnote-a5d39.firebaseapp.com",
            projectId: "blocnote-a5d39",
            storageBucket: "blocnote-a5d39.firebasestorage.app",
            messagingSenderId: "885483762180",
            appId: "1:885483762180:web:560071762f7d23d3f87b51",
            measurementId: "G-9CJKJJHX71"));
  } else {
    await Firebase.initializeApp();
  }
}
