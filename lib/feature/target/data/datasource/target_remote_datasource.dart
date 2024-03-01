import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konekseed_test/common/constant.dart';
import 'package:konekseed_test/common/exception.dart';
import 'package:konekseed_test/feature/target/data/model/target.dart';

class TargetRemoteDatasource {
  final FirebaseFirestore _firestore;
  TargetRemoteDatasource({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _targets =>
      _firestore.collection(Constants.bussinessCollection);

  Future<void> addTarget(Target target) async {
    try {
      await _targets.doc(target.id).set(target.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<List<Target>> fetchUserTarget(String uid) async {
    try {
      return await _targets
          .where('uid', isEqualTo: uid)
          .orderBy('date', descending: true)
          .snapshots()
          .map(
            (event) => event.docs
                .map((e) => Target.fromJson(e.data() as Map<String, dynamic>))
                .toList(),
          )
          .first;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> deleteTarget(String targetid) async {
    try {
      await _targets.doc(targetid).delete();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> editTarget(Target target) async {
    try {
      await _targets.doc(target.id).update(target.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
