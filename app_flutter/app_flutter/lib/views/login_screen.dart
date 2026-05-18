import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/app_colors.dart';
import '../core/main_navigator.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Injetando o controller via GetX
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LOGO
              Image.asset(
                'assets/images/Logo_8_deploy.jpg',
                height: 100,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.psychology_outlined,
                  size: 80,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'IntegraPsi',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 32),

              Obx(
                () => Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      _buildToggleButton(
                        "Psicólogo",
                        controller.isPsicologo.value,
                        () => controller.mudarPerfil(true),
                      ),
                      _buildToggleButton(
                        "Paciente",
                        !controller.isPsicologo.value,
                        () => controller.mudarPerfil(false),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // TEXTO DINÂMICO BASEADO NO ESTADO
              Obx(
                () => Text(
                  controller.isPsicologo.value
                      ? 'Login do Profissional'
                      : 'Login do Paciente',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              _buildTextField(label: 'E-mail', icon: Icons.email_outlined),
              const SizedBox(height: 16),

              _buildTextField(
                label: 'Senha',
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              const SizedBox(height: 24),

              // BOTÃO ENTRAR
              ElevatedButton(
                onPressed: () => Get.offAll(() => const MainNavigation()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Entrar', style: TextStyle(fontSize: 18)),
              ),

              const SizedBox(height: 16),

              // LINKS DINÂMICOS: navegacão para cadastro/ativação conforme perfil
              Obx(() {
                return controller.isPsicologo.value
                    ? TextButton(
                        onPressed: () => Get.toNamed('/register'),
                        child: const Text(
                          'Cadastrar como psicólogo',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      )
                    : TextButton(
                        onPressed: () => Get.toNamed('/activate'),
                        child: const Text(
                          'Ativar minha conta com código',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      );
              }),

              TextButton(
                onPressed: () {},
                child: const Text(
                  'Esqueceu a senha?',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // WIDGET AUXILIAR PARA O BOTÃO DE ALTERNÂNCIA
  Widget _buildToggleButton(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // WIDGET AUXILIAR PARA OS CAMPOS DE TEXTO
  Widget _buildTextField({
    required String label,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Material(
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
      borderRadius: BorderRadius.circular(12),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 2.0),
          ),
          prefixIcon: Icon(icon, color: AppColors.primary),
        ),
      ),
    );
  }
}
