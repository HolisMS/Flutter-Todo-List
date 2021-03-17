import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:todo_app/common/item_card.dart';
import 'package:todo_app/common/style.dart' as style;
import 'package:todo_app/models/Todo_model.dart';
import 'package:todo_app/screens/create_update_page.dart';

class HomePage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          backgroundColor: style.StyleUi.secondaryColor,
          onPressed: () => Get.to(() => CreateUpdatePage(isEdit: false)),
        ),
        body: _buildTodoList(),
      ),
    );
  }

  Widget _buildTodoList() {
    final CollectionReference notes = _firestore.collection('notes');
    return StreamBuilder<QuerySnapshot>(
      stream: notes.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: style.StyleUi.primaryColor,
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: StaggeredGridView.countBuilder(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.docs.length,
              crossAxisCount: 2,
              mainAxisSpacing: 3,
              itemBuilder: (context, index) {
                DocumentSnapshot document = snapshot.data.docs[index];
                var list = TodoModel.fromJson(document.data());

                return ItemCard(
                  title: list.title,
                  desc: list.desc,
                  date: list.date,
                  onLongPress: () {
                    Get.defaultDialog(
                      title: 'your sure delete this note?',
                      titleStyle: TextStyle(
                        color: Colors.white,
                      ),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              document.reference
                                  .delete()
                                  .then((_) => Get.back());
                            },
                            child: Text(
                              'Ya',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              'No',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: style.StyleUi.primaryColor,
                    );
                  },
                  onTap: () {
                    Get.to(() {
                      return CreateUpdatePage(
                        isEdit: true,
                        docId: document.id,
                        title: list.title,
                        desc: list.desc,
                        date: list.date,
                      );
                    });
                  },
                );
              },
              staggeredTileBuilder: (index) {
                return StaggeredTile.count(1, index.isEven ? 0.6 : 0.9);
              },
            ),
          );
        }
      },
    );
  }
}
