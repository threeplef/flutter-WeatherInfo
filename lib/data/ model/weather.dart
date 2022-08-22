class Weather {
  String? name;
  final num id;
  final String main;
  final String description;
  num? temp;

  Weather({
    this.name,
    required this.id,
    required this.main,
    required this.description,
    this.temp,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'],
      id: json['id'] as num,
      main: json['main'] as String,
      description: json['description'] as String,
      temp: json['temp'],
    );
  }
}