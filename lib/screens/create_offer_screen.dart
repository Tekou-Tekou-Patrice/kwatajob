import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/job_offer.dart';
import '../providers/job_offer_provider.dart';

class CreateOfferScreen extends StatefulWidget {
  const CreateOfferScreen({super.key});

  @override
  State<CreateOfferScreen> createState() => _CreateOfferScreenState();
}

class _CreateOfferScreenState extends State<CreateOfferScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _locationController = TextEditingController();
  final _salaryController = TextEditingController();
  final _durationController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _locationController.dispose();
    _salaryController.dispose();
    _durationController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final provider = context.read<JobOfferProvider>();
    final offer = JobOfferModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
      category: _categoryController.text.trim(),
      location: _locationController.text.trim(),
      salary: _salaryController.text.trim().isEmpty ? null : _salaryController.text.trim(),
      duration: _durationController.text.trim(),
      phone: _phoneController.text.trim(),
      authorId: 'demo-user',
      authorName: 'Demandeur',
      createdAt: DateTime.now(),
    );
    await provider.createOffer(offer);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Publier une offre')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Titre'),
                  validator: (value) => value == null || value.trim().isEmpty ? 'Le titre est obligatoire.' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 4,
                  validator: (value) => value == null || value.trim().isEmpty ? 'La description est obligatoire.' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _categoryController,
                  decoration: const InputDecoration(labelText: 'Catégorie'),
                  validator: (value) => value == null || value.trim().isEmpty ? 'La catégorie est obligatoire.' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _locationController,
                  decoration: const InputDecoration(labelText: 'Localisation'),
                  validator: (value) => value == null || value.trim().isEmpty ? 'La localisation est obligatoire.' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(controller: _salaryController, decoration: const InputDecoration(labelText: 'Salaire (optionnel)')),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _durationController,
                  decoration: const InputDecoration(labelText: 'Durée'),
                  validator: (value) => value == null || value.trim().isEmpty ? 'La durée est obligatoire.' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Téléphone'),
                  keyboardType: TextInputType.phone,
                  validator: (value) => value == null || value.trim().isEmpty ? 'Le téléphone est obligatoire.' : null,
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: context.watch<JobOfferProvider>().isLoading ? null : _submit,
                  icon: const Icon(Icons.save),
                  label: const Text('Enregistrer l’offre'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
