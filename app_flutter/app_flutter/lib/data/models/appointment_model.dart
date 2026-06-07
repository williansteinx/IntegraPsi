class Appointment {
  final String id;
  final String pacienteId;
  final String psicologoId;
  final DateTime data;
  final String notes;

  Appointment({
    required this.id,
    required this.pacienteId,
    required this.psicologoId,
    required this.data,
    required this.notes,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      pacienteId: json['pacienteId'],
      psicologoId: json['psicologoId'],
      data: DateTime.parse(json['data']),
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pacienteId': pacienteId,
      'psicologoId': psicologoId,
      'data': data.toIso8601String(),
      'notes': notes,
    };
  }
}
