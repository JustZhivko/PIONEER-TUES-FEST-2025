import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildPersonRow(
                context,
                'assets/images/elitsa.jpg',
                'Елица Коева',
                'Работила по софтуерната част - мобилно приложение.',
              ),
              SizedBox(height: 20),
              _buildPersonRow(
                context,
                'assets/images/zhivko.jpg',
                'Живко Увалиев',
                'Работил по ракетата - платка и софтуер към нея',
              ),
              SizedBox(height: 20),
              _buildPersonRow(
                context,
                'assets/images/nikola.jpg',
                'Никола Чешмеджиев',
                'Работил по плаката и дизайна.',
              ),
              SizedBox(height: 20),
              _buildPersonRow(
                context,
                'assets/images/alex.jpg',
                'Александър Димитров',
                'Работил по видеото и плаката.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPersonRow(
    BuildContext context,
    String imagePath,
    String name,
    String description,
  ) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white, width: 2),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Text(
            '$name: $description',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
