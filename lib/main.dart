import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'models/job_offer.dart';
import 'providers/auth_provider.dart';
import 'providers/job_offer_provider.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/create_offer_screen.dart';
import 'screens/home_screen.dart';
import 'screens/offer_detail_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const KwataJobApp());
}

class KwataJobApp extends StatelessWidget {
  const KwataJobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => JobOfferProvider()),
      ],
      child: MaterialApp(
        title: 'KwataJob',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routes: {
          AppRoutes.splash: (_) => const SplashScreen(),
          AppRoutes.login: (_) => const LoginScreen(),
          AppRoutes.register: (_) => const RegisterScreen(),
          AppRoutes.home: (_) => const HomeScreen(),
          AppRoutes.createOffer: (_) => const CreateOfferScreen(),
          AppRoutes.profile: (_) => const ProfileScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == AppRoutes.offerDetail) {
            final offer = settings.arguments as JobOfferModel;
            return MaterialPageRoute(
              builder: (_) => OfferDetailScreen(offer: offer),
            );
          }
          return null;
        },
        home: const SplashScreen(),
      ),
    );
  }
}
