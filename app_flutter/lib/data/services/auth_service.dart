import '../models/usuario_model.dart';

class AuthService {
  // Simulação de login
  Future<Usuario?> login(String email, String password) async {
    if (email == 'test@example.com' && password == 'password') {
      return Usuario(
        id: '1',
        name: 'Psicólogo Teste',
        email: email,
        isPsicologo: true,
      );
    }
    return null;
  }

  Future<void> logout() async {}
}
