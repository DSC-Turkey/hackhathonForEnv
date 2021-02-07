import 'package:flutter/material.dart';
import 'package:forenvironment/screens/ideas_page.dart';
import 'package:forenvironment/services/cloud_database_helper.dart';
import 'package:get/get.dart';

class TriesPage extends StatefulWidget {
  @override
  _TriesPageState createState() => _TriesPageState();
}

class _TriesPageState extends State<TriesPage> {
  String searchText;
  String nameText;
  String descText;
  String imgUrlText = "AAA";

  TextEditingController searchTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController descTextController = TextEditingController();
  TextEditingController imgUrlTextController = TextEditingController();

  void _processTexts() {
    setState(() {
      searchText = searchTextController.text;
      nameText = nameTextController.text;
      descText = descTextController.text;
      imgUrlText = imgUrlTextController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green.shade100,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SearchDescText(),
            SearchField(searchTextController: searchTextController),
            buildSearchButton(),
            AddDescText(),
            NameTextField(nameTextController: nameTextController),
            AddDescTextField(descTextController: descTextController),
            FloatingActionButton(
              onPressed: () {
                _processTexts();
                CloudDatabaseHelper().createIdea(
                    "https://i.ytimg.com/vi/pGMfhBuYZKc/maxresdefault.jpg",
                    descText,
                    nameText);
                Get.snackbar("Ekleme Başarılı: ",
                    "Çevreye olan duyarlılığın için teşekkür ederiz :)",
                    backgroundColor: Colors.brown);
              },
              child: Icon(Icons.arrow_forward_rounded),
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildSearchButton() {
    return FloatingActionButton(
      heroTag: "search",
      onPressed: () {
        _processTexts();
        Get.to(AfterLogin());
      },
      child: Icon(Icons.search),
    );
  }
}

class AddDescTextField extends StatelessWidget {
  const AddDescTextField({
    Key key,
    @required this.descTextController,
  }) : super(key: key);

  final TextEditingController descTextController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
      child: TextField(
        style: TextStyle(fontFamily: 'NotoSans', color: Colors.brown),
        controller: descTextController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Açıklama: ',
        ),
      ),
    );
  }
}

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key key,
    @required this.nameTextController,
  }) : super(key: key);

  final TextEditingController nameTextController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: TextField(
        style: TextStyle(fontFamily: 'NotoSans', color: Colors.brown),
        controller: nameTextController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'İsmin: ',
        ),
      ),
    );
  }
}

class AddDescText extends StatelessWidget {
  const AddDescText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 50, 70, 20),
      child: Text(
        "Ya da senin bir fikrin varsa buradan ekleyebilirsin:",
        style: TextStyle(
          color: Colors.brown,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class SearchDescText extends StatelessWidget {
  const SearchDescText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
      child: Text(
        "Çöpe atmadan önce elindeki atığı nasıl değerlendirebileceğinle ilgili fikirlere bir gözat:",
        style: TextStyle(
          color: Colors.brown,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
    @required this.searchTextController,
  }) : super(key: key);

  final TextEditingController searchTextController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: TextField(
        style: TextStyle(fontFamily: 'NotoSans', color: Colors.brown),
        controller: searchTextController,
        decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: 'Ara'),
      ),
    );
  }
}
