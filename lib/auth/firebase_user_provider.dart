import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class EscalaIasdFirebaseUser {
  EscalaIasdFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

EscalaIasdFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<EscalaIasdFirebaseUser> escalaIasdFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<EscalaIasdFirebaseUser>(
            (user) => currentUser = EscalaIasdFirebaseUser(user));
