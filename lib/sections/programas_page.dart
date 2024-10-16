import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProgramasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuestros Programas'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            ProgramIcon(
              title: 'PÁGINA WEB UPDS',
              icon: Icons.public,
              url: 'https://www.upds.edu.bo/',
            ),
            ProgramIcon(
              title: 'BIBLIOTECA',
              icon: Icons.library_books,
              url: 'https://www.ejemplo2.com',
            ),
            ProgramIcon(
              title: 'PLATAFORMA VIRTUAL',
              icon: Icons.online_prediction,
              url: 'https://www.ejemplo3.com',
            ),
            ProgramIcon(
              title: 'RED UPDS',
              icon: Icons.assignment,
              url: 'https://www.ejemplo4.com',
            ),
          ],
        ),
      ),
    );
  }
}

class ProgramIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final String url;

  const ProgramIcon({
    Key? key,
    required this.title,
    required this.icon,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blueAccent),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
