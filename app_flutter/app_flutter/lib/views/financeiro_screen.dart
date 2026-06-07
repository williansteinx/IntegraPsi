import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class FinanceiroScreen extends StatelessWidget {
  const FinanceiroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Financeiro',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Visão geral financeira',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
              ),
              const SizedBox(height: 24),

              // Linha de Cards de Resumo (Scroll horizontal para evitar quebra em telas menores)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildSummaryCard(
                      Icons.attach_money,
                      "-",
                      "Este mês",
                      const Color(0xFFE8F5E9),
                      Colors.green,
                    ),
                    const SizedBox(width: 16),
                    _buildSummaryCard(
                      Icons.assignment_late_outlined,
                      "-",
                      "Pendente",
                      const Color(0xFFFFF3E0),
                      Colors.orange,
                    ),
                    const SizedBox(width: 16),
                    _buildSummaryCard(
                      Icons.trending_up,
                      "-",
                      "Crescimento",
                      const Color(0xFFE3F2FD),
                      Colors.blue,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
              const Text(
                'Pagamentos recentes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0),
                  child: Text(
                    'Nenhum pagamento registrado no momento.',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para os mini cards do topo
  Widget _buildSummaryCard(
    IconData icon,
    String value,
    String label,
    Color bgColor,
    Color iconColor,
  ) {
    return Container(
      width: 140, // Largura fixa para manter o padrão do grid
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
