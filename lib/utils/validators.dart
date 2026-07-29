class AppValidators {
  AppValidators._();

  static String? required(String? value, {String? fieldName}) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? 'Ce champ'} est obligatoire.';
    }
    return null;
  }

  static String? email(String? value) {
    final error = required(value, fieldName: 'L’email');
    if (error != null) {
      return error;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value!.trim())) {
      return 'Veuillez saisir une adresse email valide.';
    }
    return null;
  }

  static String? phone(String? value) {
    final error = required(value, fieldName: 'Le numéro de téléphone');
    if (error != null) {
      return error;
    }
    final phoneRegex = RegExp(r'^\+?[0-9]{8,15}$');
    if (!phoneRegex.hasMatch(value!.trim())) {
      return 'Le numéro de téléphone est invalide.';
    }
    return null;
  }

  static String? password(String? value) {
    final error = required(value, fieldName: 'Le mot de passe');
    if (error != null) {
      return error;
    }
    if (value!.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères.';
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    final error = required(value, fieldName: 'La confirmation');
    if (error != null) {
      return error;
    }
    if (value != password) {
      return 'Les mots de passe ne correspondent pas.';
    }
    return null;
  }
}
