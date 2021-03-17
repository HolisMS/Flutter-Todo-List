import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String desc;
  final String date;
  final Function onTap;
  final Function onLongPress;

  ItemCard({
    this.title,
    this.desc,
    this.date,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Container(
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6.merge(
                        TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  desc,
                  style: Theme.of(context).textTheme.subtitle1.merge(
                        TextStyle(),
                      ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  date,
                  style: Theme.of(context).textTheme.bodyText2.merge(
                        TextStyle(color: Colors.black45),
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
