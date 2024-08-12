import 'package:flutter/material.dart';

void main() {
runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

@override
Widget build(BuildContext context) {
  return const MaterialApp(
    home: ParkingLotDashboard(),
    debugShowCheckedModeBanner: false,
  );
}
}

class ParkingLotDashboard extends StatelessWidget {
  const ParkingLotDashboard({super.key});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Parking Lot Availability'),
    ),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Parking Dashboard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_parking),
            title: Text('Parking Lot Availability'),
          ),
          ListTile(
            leading: Icon(Icons.directions_car),
            title: Text('Parking Cars'),
          ),
          ListTile(
            leading: Icon(Icons.park),
            title: Text('Slots'),
          ),
        ],
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 10, // Number of parking spots
              itemBuilder: (context, index) {
                return const ParkingSpotCard();
              },
            ),
          ),
        ],
      ),
    ),
  );
}
}

class ParkingSpotCard extends StatelessWidget {
  const ParkingSpotCard({super.key});

@override
Widget build(BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image.asset('assets/car.png'), // Replace with your image
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Car Model',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('License Plate: ABC-123'),
                SizedBox(height: 5),
                Text('Staying Time: 2:30 pm',
                    style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}
