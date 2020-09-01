import 'package:flutter/material.dart';

class SortButton extends StatelessWidget {
  final Stream<bool> isSortingAscending;
  final Function onPressed;

  SortButton({@required this.isSortingAscending, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: isSortingAscending,
      builder: (context, snapshot) {
        var icon = Icons.arrow_upward;

        if (snapshot.hasData && !snapshot.data) {
          icon = Icons.arrow_downward;
        }

        return Row(
          children: [
            Text("HP"),
            IconButton(
              icon: Icon(icon),
              onPressed: onPressed,
            ),
          ],
        );
      },
    );
  }
}
