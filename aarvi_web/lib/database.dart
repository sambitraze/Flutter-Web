import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  final CollectionReference workerCollection =
      Firestore.instance.collection('Worker');

}