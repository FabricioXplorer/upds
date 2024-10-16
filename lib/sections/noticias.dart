import 'package:flutter/material.dart';

class NoticiasPage extends StatefulWidget {
  @override
  _NoticiasPageState createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  final List<Map<String, String>> noticias = [
    {
      'titulo':
          'Publican artículo escrito por docente de la UPDS sobre el dilema del dólar en Bolivia en revista científica internacional',
      'subtitulo':
          'El economista y docente Tito Rojas, examina el impacto de la escasez de dólares y las políticas del gobierno en un artículo arbitrado y publicado...',
    },
    {
      'titulo':
          'Destacada representación de la UPDS en Congreso Internacional Multidisciplinario de Investigación en Paraguay',
      'subtitulo':
          'Docentes y estudiantes de la UPDS Santa Cruz, presentaron investigaciones innovadoras en el CIMITIS 2024, fortaleciendo el intercambio científico y posicionando a la universidad como...',
    },
    {
      'titulo':
          'Exitosa Jornada Pedagógica sobre Innovación Educativa con Inteligencia Artificial en la UPDS',
      'subtitulo':
          'Santa Cruz, 9 de octubre de 2024 – La Dirección de Marketing con el apoyo de Bienestar Estudiantil, llevó a cabo con gran éxito la Jornada..',
    },
    {
      'titulo':
          'Éxito en el Encuentro de Profesionales en Psicopedagogía y Psicología en la UPDS: Neuroeducación e Inteligencia Artificial al Servicio del Éxito Académico',
      'subtitulo':
          'Santa Cruz, 12 de octubre de 2024 – El encuentro de profesionales en psicopedagogía y psicología, organizado por la Dirección de Marketing, con el apoyo',
    },
    {
      'titulo':
          '“Mujeres de Madera”, un homenaje a la fortaleza femenina en Bolivia',
      'subtitulo':
          'En un emotivo acto por el mes de la mujer boliviana, la vicepresidente del Directorio, Ing. Norma Pacheco, y la Rectora de la UPDS Sede',
    },
    {
      'titulo':
          'La Rectora María Virginia Ruiz Representa a la UPDS Tarija en la Exhibición «Mujeres de Madera»',
      'subtitulo':
          'La Universidad Privada Domingo Savio (UPDS) sede Tarija se enorgullece de anunciar la participación de su rectora, la Lic. María Virginia Ruiz, en el prestigioso',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Últimas noticias'),
      ),
      body: ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (context, index) {
          final noticia = noticias[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(noticia['titulo'] ?? ''),
              subtitle: Text(noticia['subtitulo'] ?? ''),
              isThreeLine: true,
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
