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
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.1,
                children: [
                  _buildCard(context, Icons.search, 'स्मार्ट खोज & फ़िल्टर', 'सटीक बजट और लोकेशन', Colors.blue, null),
                  _buildCard(context, Icons.chat_bubble_outline, 'इन-ऐप सुरक्षित चैट', 'बिना नंबर शेयर किए बात', Colors.teal, null),
                  _buildCard(context, Icons.videocam, '360° वर्चुअल टूर', 'कमरे का असली वीडियो', Colors.indigo, null),
                  _buildCard(context, Icons.people_alt, '룸메이트룸मेट मैच', 'आदतों के अनुसार पार्टनर', Colors.pink, null),
                ],
              ),
              SizedBox(height: 20),
              Text('मकान मालिक सुरक्षा और रिस्क मैनेजमेंट 🛡️', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87)),
              SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.1,
                children: [
                  _buildCard(context, Icons.fact_check, 'किरायेदार Verification', 'सैलरी और सिबिल चेक', Colors.green, null),
                  _buildCard(context, Icons.assignment, 'डिजिटल एग्रीमेंट', 'ONLINE सरकारी नियम', Colors.cyan, null),
                  _buildCard(context, Icons.phonelink_lock, 'ऑटो-डेबिट किराया', 'सैलरी कट रेंट सुरक्षा', Colors.redAccent, null),
                  _buildCard(context, Icons.gavel, 'AI लीगल विटनेस', 'बिना कोर्ट विवाद हल', Colors.brown, null),
                  _buildCard(context, Icons.vpn_key, 'डिजिटल चाबी (Lock) 🔒', 'स्मार्ट ताला & मैकेनिक', Colors.blueGrey, SmartLockStorePage()),
                ],
              ),
              SizedBox(height: 20),
              Text('रोज़मर्रा के अनोखे समाधान (Utility Suite) ⚡', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87)),
              SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.1,
                children: [
                  _buildCard(context, Icons.currency_exchange, 'रेंट बिडिंग (मोल-तोल)', 'किराए पर बोली लगाएं', Colors.orange, null),
                  _buildCard(context, Icons.electric_bolt, 'बिजली बिल ट्रैकर', 'फोटो से ऑटो रीडिंग बिल', Colors.amber.shade700, null),
                  _buildCard(context, Icons.storefront, 'लोकल कबाड़-बाज़ार', 'सामान खरीदें या बेचें', Colors.purple, null),
                  _buildCard(context, Icons.plumbing, 'SOS होम सर्विसेस', 'प्लंबर-इलेक्ट्रिशियन डेस्क', Colors.blueGrey, null),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, IconData icon, String title, String sub, Color color, Widget? targetPage) {
    return GestureDetector(
      onTap: () {
        if (targetPage != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => targetPage));
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [BoxShadow(color: Colors.black10, blurRadius: 3, offset: Offset(0, 1))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color, size: 18),
            ),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.black87), maxLines: 1, overflow: TextOverflow.ellipsis),
            SizedBox(height: 2),
            Text(sub, style: TextStyle(fontSize: 10, color: Colors.grey.shade600), maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}

class SmartLockStorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('स्मार्ट लॉक & डिजिटल चाबी स्टोर 🔒', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        backgroundColor: Colors.blueGrey.shade800,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade200),
