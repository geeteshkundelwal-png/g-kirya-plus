import 'package:flutter/material.dart';

void main() => runApp(GKirayaPlusApp());

class GKirayaPlusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'G-Kiraya Plus',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFF8FAFC),
      ),
      home: MainNavigationHub(),
    );
  }
}

class MainNavigationHub extends StatefulWidget {
  @override
  _MainNavigationHubState createState() => _MainNavigationHubState();
}

class _MainNavigationHubState extends State<MainNavigationHub> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    GKirayaSuperDashboard(),
    Center(child: Text('🏡 कमरा जोड़ें / मकान मालिक हब', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple))),
    Center(child: Text('📚 ट्यूशन और कोचिंग व्यू', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple))),
    Center(child: Text('⚙️ एडमिन कंट्रोल पैनल', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple.shade700,
        unselectedItemColor: Colors.grey.shade600,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 11),
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.bolt_rounded), label: 'सुपर होम'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded), label: 'कमरा जोड़ें'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded), label: 'ट्यूशन'),
          BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings_rounded), label: 'एडमिन'),
        ],
      ),
    );
  }
}

class GKirayaSuperDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('G-Kiraya Plus ✨', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            Text('14 क्रांतिकारी फीचर्स का इकोसिस्टम', style: TextStyle(color: Colors.white70, fontSize: 11)),
          ],
        ),
        backgroundColor: Colors.deepPurple.shade700,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.deepPurple.shade800, Colors.purple.shade600]),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.deepPurple.withOpacity(0.25), blurRadius: 8, offset: Offset(0, 4))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.verified_user_rounded, color: Colors.greenAccent, size: 24),
                        SizedBox(width: 8),
                        Text('G-Rent Passport ACTIVE 🛡️', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('किरायेदार: जीरो डिपॉजिट एंट्री | मालिक: ₹50,000 सुरक्षा कवच', style: TextStyle(color: Colors.white90, fontSize: 12)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('किरायेदार हब (Tenant Special Core) 🔍', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87)),
              SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
