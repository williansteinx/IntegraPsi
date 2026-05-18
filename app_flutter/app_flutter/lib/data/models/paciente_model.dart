class Paciente {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String notes;

  Paciente({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.notes,
  });

  factory Paciente.fromJson(Map<String, dynamic> json) {
    return Paciente(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'notes': notes,
    };
  }
}
