import 'package:flutter/material.dart';

void main() {
  runApp(const HotelMoonseaApp());
}

// --- CLASE PRINCIPAL (LA QUE CORRIGE EL ERROR DEL TEST) ---
class HotelMoonseaApp extends StatelessWidget {
  const HotelMoonseaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HOTEL LUXURY MOONSEA',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: const ReservasPage(), // Arranca directo en tu GridView de 14 fotos
    );
  }
}

// --- MODELO DE DATOS ---
class HabitacionMoosea {
  final String id;
  final String titulo;
  final String subtitulo;
  final String urlImagen;
  final int estrellas;
  final double precio;

  HabitacionMoosea({
    required this.id,
    required this.titulo,
    required this.subtitulo,
    required this.urlImagen,
    required this.estrellas,
    required this.precio,
  });
}

// --- LISTA DE LAS 14 HABITACIONES (GRID DE 2x7) ---
// NOTA: Cambia estas URLs por tus links RAW de GitHub cuando los tengas listos.
final List<HabitacionMoosea> listaHabitaciones = [
  HabitacionMoosea(id: '1', titulo: 'Suite Real Moonsea', subtitulo: 'Vista panorámica al mar.', urlImagen: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=500', estrellas: 5, precio: 450.0),
  HabitacionMoosea(id: '2', titulo: 'Habitación Deluxe', subtitulo: 'Terraza privada tropical.', urlImagen: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=500', estrellas: 4, precio: 280.0),
  HabitacionMoosea(id: '3', titulo: 'Estudio Familiar', subtitulo: 'Acceso directo a playa.', urlImagen: 'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?w=500', estrellas: 5, precio: 350.0),
  HabitacionMoosea(id: '4', titulo: 'Bungalow Overwater', subtitulo: 'Sobre aguas cristalinas.', urlImagen: 'https://images.unsplash.com/photo-1439130490301-25e322d88054?w=500', estrellas: 5, precio: 600.0),
  HabitacionMoosea(id: '5', titulo: 'Habitación Superior', subtitulo: 'Cama King size de lujo.', urlImagen: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=500', estrellas: 4, precio: 250.0),
  HabitacionMoosea(id: '6', titulo: 'Suite Junior Plunge', subtitulo: 'Piscina privada interna.', urlImagen: 'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=500', estrellas: 5, precio: 520.0),
  HabitacionMoosea(id: '7', titulo: 'Estándar Queen', subtitulo: 'Confort para estancias cortas.', urlImagen: 'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=500', estrellas: 3, precio: 180.0),
  HabitacionMoosea(id: '8', titulo: 'Penthouse Imperial', subtitulo: 'El máximo lujo del hotel.', urlImagen: 'https://images.unsplash.com/photo-1551882547-ff43c61f3635?w=500', estrellas: 5, precio: 1200.0),
  HabitacionMoosea(id: '9', titulo: 'Familiar Conectada', subtitulo: 'Dos cuartos unidos.', urlImagen: 'https://images.unsplash.com/photo-1469796466635-455ede028ca8?w=500', estrellas: 4, precio: 480.0),
  HabitacionMoosea(id: '10', titulo: 'Suite HoneyMoon', subtitulo: 'Especial para parejas.', urlImagen: 'https://images.unsplash.com/photo-1521783988139-853906562d9c?w=500', estrellas: 5, precio: 550.0),
  HabitacionMoosea(id: '11', titulo: 'Ejecutiva Business', subtitulo: 'Escritorio y zona de trabajo.', urlImagen: 'https://images.unsplash.com/photo-1566665797739-1674de7a421a?w=500', estrellas: 4, precio: 300.0),
  HabitacionMoosea(id: '12', titulo: 'Villa Privada', subtitulo: 'Privacidad absoluta.', urlImagen: 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=500', estrellas: 5, precio: 950.0),
  HabitacionMoosea(id: '13', titulo: 'Suite Accesible', subtitulo: 'Diseño para movilidad reducida.', urlImagen: 'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=500', estrellas: 4, precio: 250.0),
  HabitacionMoosea(id: '14', titulo: 'Cabaña Eco-Friendly', subtitulo: 'Armonía con la naturaleza.', urlImagen: 'https://images.unsplash.com/photo-1510798831971-661eb04b3739?w=500', estrellas: 5, precio: 380.0),
];
// --- PÁGINA CON EL GRIDVIEW ---
class ReservasPage extends StatelessWidget {
  const ReservasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Habitaciones Luxury Moonsea"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 COLUMNAS
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.65, // Ajuste para que quepan los 3 textos + estrellas
          ),
          itemCount: listaHabitaciones.length, // 14 ITEMS
          itemBuilder: (context, index) {
            final hab = listaHabitaciones[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        hab.urlImagen,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.hotel, size: 50),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(hab.titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1),
                        Text(hab.subtitulo, style: const TextStyle(color: Colors.grey, fontSize: 11), maxLines: 2),
                        const SizedBox(height: 5),
                        Row(
                          children: List.generate(5, (i) => Icon(
                            i < hab.estrellas ? Icons.star : Icons.star_border,
                            size: 14, color: Colors.amber,
                          )),
                        ),
                        Text('\$${hab.precio}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}