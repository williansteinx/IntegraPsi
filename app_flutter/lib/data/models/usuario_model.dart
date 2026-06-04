class Usuario {
  final int idUsuario;
  final String nmPsicologo;
  final String dsEmail;
  final String role;
  final String token;

  Usuario({
    required this.idUsuario,
    required this.nmPsicologo,
    required this.dsEmail,
    required this.role,
    required this.token,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      idUsuario: json['id_usuario'],
      nmPsicologo: json['nm_psicologo'] ?? '',
      dsEmail: json['ds_email'],
      role: json['role'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_usuario': idUsuario,
      'nm_psicologo': nmPsicologo,
      'ds_email': dsEmail,
      'role': role,
      'token': token,
    };
  }
}
