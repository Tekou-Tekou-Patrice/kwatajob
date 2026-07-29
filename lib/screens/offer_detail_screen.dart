import 'package:flutter/material.dart';

import '../models/job_offer.dart';

class OfferDetailScreen extends StatelessWidget {
  const OfferDetailScreen({super.key, required this.offer});

  final JobOfferModel offer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détail de l’offre')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(offer.title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(offer.description),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(label: Text(offer.category)),
                  Chip(label: Text(offer.location)),
                  if (offer.salary != null && offer.salary!.isNotEmpty) Chip(label: Text(offer.salary!)),
                ],
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.schedule),
                title: const Text('Durée'),
                subtitle: Text(offer.duration),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Téléphone'),
                subtitle: Text(offer.phone),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Auteur'),
                subtitle: Text(offer.authorName),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Fonctionnalité de contact à connecter à Firebase.')),
                  );
                },
                icon: const Icon(Icons.message),
                label: const Text('Contacter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
