import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gran_turismo/models/car.dart';

class CarListItem extends StatelessWidget {
  final Car car;

  CarListItem({@required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        visualDensity: VisualDensity.comfortable,
        leading: CachedNetworkImage(
          width: 100,
          imageUrl: car.imageSrc,
          progressIndicatorBuilder: (c, url, download) => CircularProgressIndicator(value: download.progress),
          errorWidget: (c, url, err) => Icon(Icons.error),
        ),
        title: Text(
          car.name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        subtitle: Row(
          children: [
            Text(car.category),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(car.drive),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text("${car.power} HP"),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text("Cr\$ ${car.credit}"),
            ),
          ],
        ),
      ),
    );
  }
}
