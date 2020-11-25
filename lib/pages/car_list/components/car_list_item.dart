import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gran_turismo/models/car.dart';

class CarListItem extends StatelessWidget {
  final Car car;

  CarListItem({@required this.car});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    var screenWith = mediaQuery.size.width;
    var screenHeight = mediaQuery.size.height;

    var imageWidth = screenWith * .25;

    return Card(
      child: ListTile(
        visualDensity: VisualDensity.comfortable,
        leading: car.imageSrc.isEmpty
            ? SizedBox(
                height: imageWidth,
                width: imageWidth,
              )
            : CachedNetworkImage(
                width: imageWidth,
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
            SizedBox(width: screenWith * .02),
            Container(
              child: Text(car.drive),
            ),
            SizedBox(width: screenWith * .02),
            Container(
              child: Text("${car.power} HP"),
            ),
            SizedBox(width: screenWith * .02),
            Container(
              child: Text("Cr\$ ${car.credit}"),
            ),
          ],
        ),
      ),
    );
  }
}
