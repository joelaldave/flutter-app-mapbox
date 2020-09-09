import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullSreenMap extends StatefulWidget {
  @override
  _FullSreenMapState createState() => _FullSreenMapState();
}

class _FullSreenMapState extends State<FullSreenMap> {
  MapboxMapController mapController;

  final center = LatLng(-8.182861, -79.014105);

  String estiloSeleccionaldo =
      'mapbox://styles/joelaldave/ckd7whpxc05xc1jmwql71z1h4';

  final oscuro = 'mapbox://styles/joelaldave/ckd7whpxc05xc1jmwql71z1h4';
  final street = 'mapbox://styles/joelaldave/ckd7wjrx805y31io6zy6qmbys';

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: crearMapa(),
      floatingActionButton: botonesFlotantes(),
    );
  }

  Column botonesFlotantes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        //simbolos
        FloatingActionButton(
          onPressed: () {
            mapController.addSymbol(SymbolOptions(
              geometry: center,
              iconImage: 'aquarium-15',
              iconSize: 3,
              textField: 'Montaña creada aqui',
              textOffset: Offset(0, 2),
            ));
          },
          child: Icon(Icons.directions_subway),
        ),
        SizedBox(
          height: 5,
        ),

        //zoomin
        FloatingActionButton(
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomIn());
          },
          child: Icon(Icons.zoom_in),
        ),
        SizedBox(
          height: 5,
        ),
        //zoomout
        FloatingActionButton(
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomOut());
          },
          child: Icon(Icons.zoom_out),
        ),
        SizedBox(
          height: 5,
        ),
        //cambiar estilo
        FloatingActionButton(
            child: Icon(Icons.add_photo_alternate),
            onPressed: () {
              if (estiloSeleccionaldo == oscuro) {
                estiloSeleccionaldo = street;
              } else {
                estiloSeleccionaldo = oscuro;
              }
              setState(() {});
            })
      ],
    );
  }

  MapboxMap crearMapa() {
    return MapboxMap(
      styleString: estiloSeleccionaldo,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: center,
        zoom: 14,
      ),
    );
  }
}
