import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:investorentrepreneur/models/job_model.dart';

class FirestoreServiceJob {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addJob(Job job) async {
    await _firestore.collection('job').doc(job.id).set(job.toMap());
  }
}