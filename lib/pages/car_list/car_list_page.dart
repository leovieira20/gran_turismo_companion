import 'package:flutter/material.dart';
import 'package:gran_turismo/models/car.dart';
import 'package:gran_turismo/pages/car_list/car_list_page_vm.dart';
import 'package:gran_turismo/pages/car_list/components/car_list_item.dart';
import 'package:gran_turismo/pages/car_list/components/dropdown_filter.dart';
import 'package:gran_turismo/pages/car_list/components/sort_button.dart';

class CarListPage extends StatefulWidget {
  final CarListPageVm vm;

  CarListPage(this.vm);

  @override
  _CarListPageState createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  @override
  void initState() {
    super.initState();
    widget.vm.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car List View"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Row(
              children: [
                DropdownFilter(
                  label: "categories",
                  items: widget.vm.categories,
                  onSelected: widget.vm.filterByCategory,
                ),
                DropdownFilter(
                  label: "drives",
                  items: widget.vm.drives,
                  onSelected: widget.vm.filterByDrive,
                ),
                Spacer(),
                SortButton(
                  isSortingAscending: widget.vm.isSortingAscending,
                  onPressed: widget.vm.toggleSort,
                ),
                FlatButton(
                  child: Text("Clear All"),
                  onPressed: widget.vm.clearFilters,
                )
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Car>>(
              stream: widget.vm.cars,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }

                var cars = snapshot.data;

                return ListView.builder(
                  itemCount: cars.length,
                  itemBuilder: (c, ix) {
                    var car = cars[ix];

                    return CarListItem(car: car);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
