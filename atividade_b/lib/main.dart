import 'package:flutter/material.dart';

void main() {
  runApp(const TabBarApp());
}
class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, 
      ),
      home: DefaultTabController(
        length: 3, 
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Catálogo de Marcas'),
            bottom: const TabBar(
              indicatorColor: Colors.yellowAccent,
              indicatorWeight: 4,
              tabs: [
                Tab(icon: Icon(Icons.directions_car), text: 'Carros'),
                Tab(icon: Icon(Icons.two_wheeler), text: 'Motos'),
                Tab(icon: Icon(Icons.directions_bike), text: 'Bicicletas'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildBrandList(
                icon: Icons.directions_car_filled,
                brands: ['Fiat', 'Volkswagen', 'Chevrolet', 'Hyundai', 'Toyota', 'Jeep'],
                iconColor: Colors.redAccent,
              ),
              buildBrandList(
                icon: Icons.two_wheeler,
                brands: ['Honda', 'Yamaha', 'BMW', 'Harley-Davidson', 'Kawasaki', 'Suzuki'],
                iconColor: Colors.green,
              ),

              buildBrandList(
                icon: Icons.directions_bike,
                brands: ['Caloi', 'Specialized', 'Trek', 'Cannondale', 'Scott', 'Oggi'],
                iconColor: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBrandList({required IconData icon, required List<String> brands, required Color iconColor}) {
    return ListView.builder(
      itemCount: brands.length, 
      itemBuilder: (context, index) {
        final brand = brands[index]; 
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: ListTile(
            leading: Icon(icon, color: iconColor, size: 40),
            title: Text(
              brand,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        );
      },
    );
  }
}