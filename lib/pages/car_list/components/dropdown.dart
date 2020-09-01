import 'package:flutter/material.dart';
import 'package:gran_turismo/models/dropdown_model.dart';

class Dropdown<T> extends StatelessWidget {
  final String label;
  final void Function(T value) onChanged;
  final DropdownModel<T> model;

  Dropdown(this.label, this.model, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: model.selectedValue,
      hint: Text(label),
      icon: Icon(Icons.filter_list),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Theme.of(context).accentColor),
      underline: Container(
        height: 2,
        color: Theme.of(context).highlightColor,
      ),
      items: model.items.map<DropdownMenuItem<T>>(
        (T v) {
          return DropdownMenuItem<T>(
            value: v,
            child: Text("$v"),
          );
        },
      ).toList(),
      onChanged: (T selected) {
        onChanged(selected);
      },
    );
  }
}
