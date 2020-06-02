import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_test/victim_class.dart';

class DatabaseServiceVictim{

  final String vid;
  DatabaseServiceVictim({this.vid});

  //collection reference
  final CollectionReference victimCollection = Firestore.instance.collection('victims');
        // 'victimCollection is the variable used to
        // deal with the data, whenever we want to
        //read, write or anything

  Future updateVictimDetail( String name, String bloodgrp,String spl ) async {
    return await victimCollection.document(vid).setData({
      'name' : name,
      'bloodgrp' : bloodgrp,
      'spl' : spl,
    });
  }


  //get victim list(as list of objects of type Victim)
  // from snapshot

  List<Victim> _victimListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Victim(
        name: doc.data['name'] ?? '',
        bloodgrp: doc.data['bloodgrp'] ?? '-',
        spl: doc.data['spl'] ?? 'Nil',

      );
    }).toList();
  }

  //get stream
  Stream<List<Victim>> get victims{
    return victimCollection.snapshots()
    .map(_victimListFromSnapshot);
  }

}

/*class DatabaseServiceOthers{


}*/