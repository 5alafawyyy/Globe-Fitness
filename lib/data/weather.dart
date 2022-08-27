class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double perceived = 0;
  int pressure = 0;
  int humidity = 0;

  Weather(
    this.name,
    this.description,
    this.temperature,
    this.perceived,
    this.pressure,
    this.humidity,
  );

// Named Constructor
  Weather.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = (json['weather'][0]['description']) ?? '';
    // temperature = (json['main']['temp'] * (9/5) - 459.67) ?? 0;
    temperature = (json['main']['temp'] - 273.15) ?? 0;
    perceived = (json['main']['feels_like'] - 273.15) ?? 0;
    pressure = (json['main']['pressure']) ?? 0;
    humidity = (json['main']['humidity']) ?? 0;
  }
}
