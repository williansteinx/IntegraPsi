import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Agenda',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Maio 2026',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          _buildArrowButton(Icons.chevron_left),
                          const SizedBox(width: 8),
                          _buildArrowButton(Icons.chevron_right),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Seletor de Dias Horizontal
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildDayItem("Dom", "1", isSelected: true),
                  _buildDayItem("Seg", "2"),
                  _buildDayItem("Ter", "3"),
                  _buildDayItem("Qua", "4"),
                  _buildDayItem("Qui", "5"),
                  _buildDayItem("Sex", "6"),
                  _buildDayItem("Sab", "7"),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Domingo, 1 de Março',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ),

            // Timeline de Horários
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildTimeSlot("8:00"),
                  _buildTimeSlot("9:00"),
                  _buildTimeSlot("10:00"),
                  _buildTimeSlot("11:00"),
                  _buildTimeSlot("12:00"),
                  _buildTimeSlot("13:00"),
                  _buildTimeSlot("14:00"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para os dias da semana no topo
  Widget _buildDayItem(String day, String number, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.white70 : AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
          Text(
            number,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Estrutura de cada linha de horário
  Widget _buildTimeSlot(String time, {Widget? child}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Text(
              time,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                if (child != null)
                  child
                else
                  const SizedBox(
                    height: 60,
                    child: Divider(color: AppColors.accent, thickness: 0.5),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArrowButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 20, color: AppColors.textPrimary),
    );
  }
}
