import 'package:flutter/material.dart';
import 'package:gran_turismo/models/dropdown_model.dart';
import 'package:gran_turismo/pages/car_list/components/dropdown.dart';

class DropdownFilter extends StatelessWidget {
  final Stream<DropdownModel<String>> items;
  final Function onSelected;
  final String label;

  DropdownFilter({@required this.label, @required this.items, @required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DropdownModel<String>>(
      stream: items,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        return Container(
          margin: EdgeInsets.only(left: 10),
          child: Dropdown(
            label,
            snapshot.data,
                (v) => onSelected(v),
          ),
        );
      },
    );
  }
}
