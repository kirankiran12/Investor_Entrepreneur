import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:investorentrepreneur/models/events_model.dart';
import 'package:investorentrepreneur/models/podcast_model.dart';

class FirestoreService{
  final FirebaseFirestore _firestoreService = FirebaseFirestore.instance;

  Future<void> addEvent(Event event) async {
    try {
      await _firestoreService.collection('events').doc(event.id).set(event.toMap());
      if (kDebugMode) {
        print("✅ Event successfully added!");
      }
    } catch (e) {
      if (kDebugMode) {
        print("❌ Error adding event: $e");
      }
    }
  }


  Future<void> addPodcast(Podcast podcast) async{
    try{
      await _firestoreService.collection('podcasts').doc(podcast.id).set(podcast.toMap());
      if(kDebugMode){
        print("✅ Podcast successfully added!");
      }
    }catch(e){
      if (kDebugMode) {
        print("❌ Error adding event: $e");
      }
    }
  }

}