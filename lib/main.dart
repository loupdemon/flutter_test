
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    DashboardScreen(),
    InvoicesScreen(),
    ContractsScreen(),
    ConsumptionTrackingScreen(),
    ServicesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Factures',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Contrats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Conso',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support),
            label: 'Services',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            Colors.blue[900], // Icônes sélectionnées en bleu foncé
        unselectedItemColor:
            Colors.blue[900], // Icônes non sélectionnées en bleu foncé
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de bord'),
        backgroundColor: Colors.blue[900], // Couleur bleu foncé
      ),
      body: Center(
        child: Text('Résumé de consommation ici'),
      ),
    );
  }
}

class InvoicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factures'),
        backgroundColor: Colors.blue[900], // Couleur bleu foncé
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Dernière facture :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.receipt, size: 40),
              title: Text('64,52 €'),
              subtitle: Text('À payer avant le 30/09/24'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action pour payer la facture
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Payer ma facture'),
                  SizedBox(width: 10),
                  Icon(Icons.credit_card),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Couleur du bouton
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Historique des factures :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.receipt),
                    title: Text('154,30 €'),
                    subtitle: Text('Payée le 23/09/23'),
                  ),
                  ListTile(
                    leading: Icon(Icons.receipt),
                    title: Text('150,22 €'),
                    subtitle: Text('Payée le 23/07/23'),
                  ),
                  ListTile(
                    leading: Icon(Icons.receipt),
                    title: Text('162,90 €'),
                    subtitle: Text('Payée le 23/05/23'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContractsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contrats'),
        backgroundColor: Colors.blue[900], // Couleur bleu foncé
      ),
      body: Center(
        child: Text('Liste des contrats ici'),
      ),
    );
  }
}

class ConsumptionTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suivi de consommation'),
        backgroundColor: Colors.blue[900], // Couleur bleu foncé
      ),
      body: Center(
        child: Text('Données de consommation ici'),
      ),
    );
  }
}

class ServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services Client'),
        backgroundColor: Colors.blue[900], // Couleur bleu foncé
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Contactez notre support',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'Contactez-nous par email : support@exemple.com')),
                );
              },
              child: Text('Contact par Email'),
            ),
            SizedBox(height: 20),
            Text(
              'Questions Fréquemment Posées (FAQ)',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildFAQList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SupportRequestScreen()),
                );
              },
              child: Text('Soumettre une demande d\'assistance'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQList() {
    return Column(
      children: <Widget>[
        _buildFAQItem('Comment puis-je consulter mes factures ?'),
        _buildFAQItem('Comment changer mon mot de passe ?'),
        _buildFAQItem('Que faire en cas de problème de connexion ?'),
      ],
    );
  }

  Widget _buildFAQItem(String question) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(question, style: TextStyle(fontSize: 16)),
    );
  }
}

class SupportRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demande d\'assistance'),
        backgroundColor: Colors.blue[900], // Couleur bleu foncé
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Décrivez votre problème :', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Demande d\'assistance soumise !')),
                );
                Navigator.pop(context);
              },
              child: Text('Soumettre'),
            ),
          ],
        ),
      ),
    );
  }
}
