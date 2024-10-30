import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galería de Imágenes - app09',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GaleriaDeImagenes(),
    );
  }
}

class GaleriaDeImagenes extends StatelessWidget {
  final List<Imagen> imagenes = [
    Imagen(nombre: 'Imagen PNG', tipo: 'png', path: 'assets/images/pizza.png'),
    Imagen(nombre: 'Imagen JPEG', tipo: 'jpeg', path: 'assets/images/carretera.jpg'),
    Imagen(nombre: 'Imagen SVG', tipo: 'svg', path: 'assets/images/ejemplo.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Galería de Imágenes - app09')),
      body: ListView.builder(
        itemCount: imagenes.length,
        itemBuilder: (context, index) {
          final imagen = imagenes[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            leading: SizedBox(
              width: 50,
              height: 50,
              child: getImageWidget(imagen.tipo, imagen.path), // Mostrar la imagen según su tipo
            ),
            title: Text(
              imagen.nombre,
              style: TextStyle(
                fontFamily: getFontFamily(imagen.tipo), // Cambiar fuente según el tipo
                fontSize: 18,
              ),
            ),
          );
        },
      ),
    );
  }

  // Método para mostrar la imagen según su tipo (PNG, JPEG o SVG)
  Widget getImageWidget(String tipo, String path) {
    if (tipo == 'svg') {
      return SvgPicture.asset(path); // Cargar imagen SVG
    } else {
      return Image.asset(path, fit: BoxFit.cover); // Cargar PNG o JPEG
    }
  }

  // Método para obtener la fuente según el tipo de imagen
  String getFontFamily(String tipo) {
    switch (tipo) {
      case 'png':
        return 'OpenSans';
      case 'jpeg':
        return 'Lato';
      case 'svg':
        return 'Ubuntu';
      default:
        return 'Roboto';
    }
  }
}

// Clase para representar una imagen en la galería
class Imagen {
  final String nombre;
  final String tipo;
  final String path;

  Imagen({
    required this.nombre,
    required this.tipo,
    required this.path,
  });
}
