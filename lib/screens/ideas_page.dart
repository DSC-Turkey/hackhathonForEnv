import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:forenvironment/widgets/card_widget.dart';

class AfterLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference ideas =
        FirebaseFirestore.instance.collection('paylasilanlar');
    return Scaffold(
        backgroundColor: Colors.green.shade200,
        body: IdeaStream(ideas: ideas),
      );
  }
}

class IdeaStream extends StatelessWidget {
  const IdeaStream({
    Key key,
    @required this.ideas,
  }) : super(key: key);

  final CollectionReference ideas;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: ideas.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('HATA: ' + snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return buildIdeaCard(
              document.data()["resim"],
              document.data()['aciklama'],
              document.data()['paylasanKisi'],
            );
          }).toList(),
        );
      },
    );
  }
}
