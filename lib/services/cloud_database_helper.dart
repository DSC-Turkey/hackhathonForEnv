import 'package:cloud_firestore/cloud_firestore.dart';

class CloudDatabaseHelper {
  final databaseReference = FirebaseFirestore.instance;

  void createIdea(String imgPath, String desc, String paylasanKisi) async {
    DocumentReference ref =
        await databaseReference.collection("paylasilanlar").add({
      'resim': imgPath,
      'aciklama': desc,
      'paylasanKisi': paylasanKisi,
    });
    print(ref.id);
  }
}
