import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:konekseed_test/common/constant.dart';
import 'package:konekseed_test/common/exception.dart';
import 'package:konekseed_test/feature/auth/data/model/bussiness.dart';

class AuthRemoteDatasource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  final FirebaseAuth _auth;
  AuthRemoteDatasource({
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
    required FirebaseAuth auth,
  })  : _auth = auth,
        _firestore = firestore,
        _storage = storage;

  CollectionReference get _bussiness =>
      _firestore.collection(Constants.bussinessCollection);

  User? getCurentUser() {
    try {
      return _auth.currentUser;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<Bussiness> getBussinessData(String uid) {
    try {
      return _bussiness
          .doc(uid)
          .snapshots()
          .map((event) =>
              Bussiness.fromJson(event.data() as Map<String, dynamic>))
          .first;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> registerWithEmail(
    String email,
    String password,
    List<String> sector,
    String value,
    File logo,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final snapshot = await _storage
          .ref()
          .child('user')
          .child(userCredential.user!.uid)
          .putFile(logo);
      final logoUrl = await snapshot.ref.getDownloadURL();

      Bussiness bussiness = Bussiness(
        uid: userCredential.user!.uid,
        name: userCredential.user!.displayName ??
            'User${userCredential.user!.uid}',
        logo: logoUrl,
        sector: sector,
        value: value,
      );

      await _bussiness.doc(userCredential.user!.uid).set(bussiness.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> editBussinessProfile(Bussiness bussiness, File? logo) async {
    try {
      if (logo != null) {
        final snapshot = await _storage
            .ref()
            .child('user')
            .child(bussiness.uid)
            .putFile(logo);
        final logoUrl = await snapshot.ref.getDownloadURL();

        bussiness = bussiness.copyWith(logo: logoUrl);
        return await _bussiness.doc(bussiness.uid).update(bussiness.toJson());
      }
      return await _bussiness.doc(bussiness.uid).update(bussiness.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
