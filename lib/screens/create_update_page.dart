import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/common/showSnackbar.dart';
import 'package:todo_app/common/style.dart' as style;

class CreateUpdatePage extends StatefulWidget {
  final bool isEdit;
  final String docId;
  final String title;
  final String desc;
  final String date;

  CreateUpdatePage({
    @required this.isEdit,
    this.docId,
    this.title,
    this.desc,
    this.date,
  });

  @override
  _CreateUpdatePageState createState() => _CreateUpdatePageState();
}

class _CreateUpdatePageState extends State<CreateUpdatePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  String _dateValue;

  DateTime _dateTime = DateTime.now().add(Duration(days: 0));
  bool isLoading;

  @override
  void initState() {
    if (widget.isEdit) {
      _titleController.text = widget.title;
      _descController.text = widget.desc;
      _dateValue = widget.date;
    } else {
      _dateValue = DateFormat('dd MMMM yyyy').format(_dateTime);
    }
    super.initState();
  }

  void _buildData() async {
    String title = _titleController.text;
    String desc = _descController.text;

    if (desc.isEmpty) {
      showSnackbar('Description isn\'t empty');
    } else if (widget.isEdit) {
      DocumentReference doct = _firestore.doc('notes/${widget.docId}');
      _firestore.runTransaction((transaction) async {
        DocumentSnapshot document = await transaction.get(doct);
        if (document.exists) {
          transaction.update(doct, <String, dynamic>{
            'title': title,
            'description': desc,
            'date': _dateValue,
          });
          showSnackbar('Edit success');
        } else {
          showSnackbar('data not found');
        }
      });
    } else {
      CollectionReference notes = _firestore.collection('notes');

      DocumentReference doct = await notes.add(<String, dynamic>{
        'title': title,
        'description': desc,
        'date': _dateValue,
      });
      if (doct.id != null) {
        Get.back();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(10),
          child: Material(
            elevation: 5,
            shadowColor: Colors.grey,
            type: MaterialType.circle,
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.only(left: 7),
              child: InkWell(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onTap: () => Get.back(),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Material(
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              type: MaterialType.circle,
              child: InkWell(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30,
                ),
                onTap: () => _buildData(),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: context.mediaQuerySize.width,
              height: context.mediaQuerySize.height * 0.2,
              decoration: BoxDecoration(
                  color: style.StyleUi.primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      style.StyleUi.primaryColor,
                      style.StyleUi.primaryColor.withOpacity(0.8),
                      style.StyleUi.primaryColor.withOpacity(0.6),
                      style.StyleUi.primaryColor.withOpacity(0.4),
                    ],
                  )),
              child: Stack(
                children: [
                  Positioned(
                    bottom: -22,
                    child: Text(
                      widget.isEdit ? 'EDIT' : 'CREATE',
                      style:
                          Theme.of(context).textTheme.headline2.merge(TextStyle(
                                color: Colors.white,
                                fontSize: 70,
                              )),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      hintStyle: Theme.of(context).textTheme.headline6.merge(
                          TextStyle(color: Colors.black.withOpacity(0.5))),
                    ),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  TextField(
                    controller: _descController,
                    autofocus: true,
                    textInputAction: TextInputAction.newline,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: Theme.of(context).textTheme.subtitle1,
                    maxLines: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
