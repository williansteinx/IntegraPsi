import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/login_binding.dart';
import 'bindings/dashboard_binding.dart';
import 'bindings/registro_binding.dart';
import 'core/app_colors.dart';
import 'core/main_navigator.dart';
import 'data/services/auth_service.dart';
import 'data/services/http_service.dart';
import 'views/ativacao_screen.dart';
import 'views/login_screen.dart';
import 'views/registro_psicologo_screen.dart';

void main() {
  Get.put<AuthService>(AuthService(), permanent: true);
  Get.put<HttpService>(HttpService(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IntegraPsi',
      debugShowCheckedModeBanner: false,
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
        GetPage(name: '/', page: () => const LoginScreen(), binding: LoginBinding()),
        GetPage(name: '/main', page: () => const MainNavigation(), binding: DashboardBinding()),
        GetPage(name: '/register', page: () => RegistroPsicologoScreen(), binding: RegistroBinding()),
        GetPage(name: '/activate', page: () => const AtivacaoScreen()),
      ],
    );
  }
}
