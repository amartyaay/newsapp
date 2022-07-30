import 'package:flutter/material.dart';
import 'package:newsapp/widgets/dialog_box.dart';

class CardView extends StatelessWidget {
  // const imageLink = "";
  final String title, img, des;
  const CardView(
      {super.key, required this.img, required this.title, required this.des});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialogBox(context, des, title);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Expanded(
            child: Row(
              children: [
                Image(
                  image: NetworkImage(img),
                  height: 100,
                  width: 100,
                  fit: BoxFit.fitHeight,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
