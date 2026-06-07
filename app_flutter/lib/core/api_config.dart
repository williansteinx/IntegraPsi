class ApiConfig {
  static const String _baseUrl =
      'http://200.19.1.19/20232GR.ADS0003/IntegraPsi/public/index.php';

  // Endpoints
  static const String usuarios = '$_baseUrl/usuarios';
  static const String login = '$_baseUrl/usuarios/login';
  static const String pacientes = '$_baseUrl/pacientes';
  static const String agendamentos = '$_baseUrl/agendamentos';
}
