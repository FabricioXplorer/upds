import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sections/programas_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sections/noticias.dart';
import 'sections/calendario.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(55),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blueAccent.withOpacity(0.8),
            Colors.blue.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            'Bienvenido a tu aplicacion UPDS',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
          ),
          SizedBox(height: 10),
          Text(
            'Formando profesionales más humanos.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCardButton(
                context,
                'Explora Nuestros Programas',
                FontAwesomeIcons.bookOpen,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProgramasPage()),
                  );
                },
              ),
              _buildCardButton(
                context,
                'Noticias',
                FontAwesomeIcons.newspaper,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NoticiasPage()),
                  );
                },
              ),
              _buildCardButton(
                context,
                'Calendario UPDS',
                FontAwesomeIcons.calendarAlt,
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalendarioPage()));
                },
              ),
            ],
          ),
          Spacer(),
          _ContactInfo(),
          SizedBox(height: 20),
          _SocialMediaIcons(),
        ],
      ),
    );
  }

  Widget _buildCardButton(BuildContext context, String title, IconData icon,
      VoidCallback onPressed) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 90,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 30, color: Colors.blueAccent),
              SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Contáctanos:',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone, color: Colors.white),
            SizedBox(width: 5),
            Text(
              '+591 123 456 789',
              style: TextStyle(color: Colors.white),
            ),
            Icon(Icons.email, color: Colors.white),
            SizedBox(width: 7),
            Text(
              'upds@gmail.com',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialMediaIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialMediaIcon(
          icon: FontAwesomeIcons.facebook,
          url: 'https://www.facebook.com/tu_pagina',
        ),
        SizedBox(width: 20),
        _SocialMediaIcon(
          icon: FontAwesomeIcons.twitter,
          url: 'https://twitter.com/tu_pagina',
        ),
        SizedBox(width: 20),
        _SocialMediaIcon(
          icon: FontAwesomeIcons.instagram,
          url: 'https://www.instagram.com/tu_pagina',
        ),
        SizedBox(width: 20),
        _SocialMediaIcon(
          icon: FontAwesomeIcons.youtube,
          url: 'https://www.youtube.com/tu_pagina',
        ),
        SizedBox(width: 20),
        _SocialMediaIcon(
          icon: FontAwesomeIcons.tiktok,
          url: 'https://www.tiktok.com/@tu_pagina',
        ),
      ],
    );
  }
}

class _SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialMediaIcon({
    Key? key,
    required this.icon,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.white),
          SizedBox(height: 5),
        ],
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
