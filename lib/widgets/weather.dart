class Weather {
  final double? temp;
  final double? feelsLike;
  final double? low;
  final double? high;
  final String description;
  final String? icon;

  Weather({
    this.temp,
    this.feelsLike,
    this.low,
    this.high,
    required this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      low: json['main']['temp_min'].toDouble(),
      high: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'] + ".png",
    );
  }
}
