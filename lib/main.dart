import 'package:flutter/material.dart';


void main() {
  runApp(const MaterialApp(
    home: FullDoctorScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

// The Widget
class FullDoctorScreen extends StatefulWidget {
  const FullDoctorScreen({super.key});

  @override
  State<FullDoctorScreen> createState() => _FullDoctorScreenState();
}

class _FullDoctorScreenState extends State<FullDoctorScreen> {
  int _selectedIndex = 1; // Notifications selected by default

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ---------- TOP BAR ----------
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/img/logo.png',
              height: 60,
            ),
            const Icon(Icons.arrow_right_alt, color: Colors.black, size: 40,),
          ],
        ),
    ),

      // ---------- BODY (Doctor List) ----------
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            DoctorCard(
              imagePath: 'assets/img/earth2.png',
              name: 'Mariam Elsayd',
              specialty: 'Surgeon',
              time: '10:20 AM - 12:30 PM',
              icon: Icons.check_circle,
            ),
            DoctorCard(
              imagePath: 'assets/img/earth2.png',
              name: 'Ibrahim Tawfiq',
              specialty: 'Pharmacy',
              time: '12:30 AM - 4:30 PM',
              icon: Icons.email,
            ),
            DoctorCard(
              imagePath: 'assets/img/earth2.png',
              name: 'Ibrahim Tawfiq',
              specialty: 'Pharmacy',
              time: '12:30 AM - 4:30 PM',
              icon: Icons.check_circle,
            ),
            DoctorCard(
              imagePath: 'assets/img/earth2.png',
              name: 'Mariam Elsayd',
              specialty: 'Surgeon',
              time: '10:20 AM - 12:30 PM',
              icon: Icons.email,
            ),
          ],
        ),
      ),

      // ---------- BOTTOM NAV BAR ----------
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage('assets/img/earth2.png'),
            ),
            label: 'Personal',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            activeIcon: Icon(Icons.notifications, color: Colors.lightBlue),
            label: 'Notifications',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble, color: Colors.lightBlue),
            label: 'Messages',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, color: Colors.lightBlue),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}

// ---------- DOCTOR CARD WIDGET ----------
class DoctorCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String specialty;
  final String time;
  final IconData icon;

  const DoctorCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.specialty,
    required this.time,
    required this.icon,
  });

/* Style of Doctors Lists */
  @override
  Widget build(BuildContext context) {
    // Styles of every card
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(// image style
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Column(// Text Styles
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    specialty,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.lightBlue.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(// Icon Styles
            decoration: const BoxDecoration(
              color: Colors.lightBlue,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6),
            child: Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}