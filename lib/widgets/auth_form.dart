import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
    required this.isLogin,
    this.firstNameController,
    this.lastNameController,
    this.phoneController,
    this.confirmPasswordController,
    this.isLoading = false,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? phoneController;
  final TextEditingController? confirmPasswordController;
  final VoidCallback onSubmit;
  final bool isLogin;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          if (!isLogin) ...[
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: 'Prénom'),
              validator: (value) => value == null || value.trim().isEmpty ? 'Le prénom est obligatoire.' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Nom'),
              validator: (value) => value == null || value.trim().isEmpty ? 'Le nom est obligatoire.' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Téléphone'),
              keyboardType: TextInputType.phone,
              validator: (value) => value == null || value.trim().isEmpty ? 'Le téléphone est obligatoire.' : null,
            ),
            const SizedBox(height: 12),
          ],
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) => value == null || value.trim().isEmpty ? 'L’email est obligatoire.' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Mot de passe'),
            obscureText: true,
            validator: (value) => value == null || value.length < 8 ? 'Le mot de passe doit contenir au moins 8 caractères.' : null,
          ),
          if (!isLogin) ...[
            const SizedBox(height: 12),
            TextFormField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirmer le mot de passe'),
              obscureText: true,
              validator: (value) => value == null || value.isEmpty ? 'La confirmation est obligatoire.' : null,
            ),
          ],
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: isLoading ? null : onSubmit,
            icon: isLoading
                ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.arrow_forward),
            label: Text(isLogin ? 'Se connecter' : 'Créer un compte'),
          ),
        ],
      ),
    );
  }
}
