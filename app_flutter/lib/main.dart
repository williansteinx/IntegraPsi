import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/login_screen.dart';
import 'views/registro_psicologo_screen.dart';
import 'views/ativacao_screen.dart';
import 'bindings/login_binding.dart';
import 'views/dashboard_screen.dart';
import 'bindings/dashboard_binding.dart';
import './core/main_navigator.dart';
import './core/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IntegraPsi',
      debugShowCheckedModeBanner: false,

      // Definindo as cores globais do app baseadas na sua paleta
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          surface: AppColors.background,
        ),
        scaffoldBackgroundColor: AppColors.background,
      ),

      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const LoginScreen(),
          binding: LoginBinding(),
        ),
        GetPage(name: '/main', page: () => const MainNavigation()),
        GetPage(
          name: '/dashboard',
          page: () => const DashboardScreen(),
          binding: DashboardBinding(),
        ),
        // Novas rotas para cadastro e ativação
        GetPage(name: '/register', page: () => const RegistroPsicologoScreen()),
        GetPage(name: '/activate', page: () => const AtivacaoScreen()),
      ],
    );
  }
}
