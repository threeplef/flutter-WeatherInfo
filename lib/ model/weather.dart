class Weather {
  String? name;
  final String main;
  final String description;
  num? minTemp;
  num? maxTemp;

  Weather({
    this.name,
    required this.main,
    required this.description,
    this.minTemp,
    this.maxTemp,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'],
      main: json['main'] as String,
      description: json['description'] as String,
      minTemp: json['minTemp'],
      maxTemp: json['maxTemp'],
    );
  }
}