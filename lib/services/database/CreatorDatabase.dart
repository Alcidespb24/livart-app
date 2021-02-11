

import 'package:cloud_firestore/cloud_firestore.dart';

class CreatorDatabase {
  String _collectionName;
  CollectionReference _creatorCollection;

  CreatorDatabase(){
    _collectionName= 'CreatorCollection';
    _creatorCollection = FirebaseFirestore.instance.collection(_collectionName);
  }

  Future addCreatorRecord(){

  }

  Future updateDocument() {
    // TODO: implement updateDocument
    throw UnimplementedError();
  }

}