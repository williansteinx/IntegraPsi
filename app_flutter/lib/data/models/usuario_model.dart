class Usuario {
  final String id;
  final String name;
  final String email;
  final bool isPsicologo;

  Usuario({
    required this.id,
    required this.name,
    required this.email,
    required this.isPsicologo,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      isPsicologo: json['isPsicologo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'isPsicologo': isPsicologo};
  }
}
