import 'package:flutter/material.dart';
import 'package:eco_reward_app/screens/quest/certification/image_screen.dart';

class QuestCertificationScreen extends StatelessWidget {
  const QuestCertificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quest Certification'),
      ),
      body: const Center(
        child: ImageScreen(),
      ),
    );
  }
}
