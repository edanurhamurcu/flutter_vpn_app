class Country {
  final String name;
  final String countryCode;
  final String flag;
  final String city;
  final int locationCount;
  final int strength;
  bool isConnected;

  Country({
    required this.name,
    required this.countryCode ,
    required this.flag,
    required this.city,
    required this.locationCount,
    required this.strength,
    this.isConnected = false,
  });

  Country copyWith({
    String? name,
    String? countryCode,
    String? flag,
    String? city,
    int? locationCount,
    int? strength,
    bool? isConnected,
  }) {
    return Country(
      name: name ?? this.name,
      countryCode: countryCode ?? this.countryCode,
      flag: flag ?? this.flag,
      city: city ?? this.city,
      locationCount: locationCount ?? this.locationCount,
      strength: strength ?? this.strength,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Country &&
        other.name == name &&
        other.countryCode == countryCode &&
        other.flag == flag &&
        other.city == city &&
        other.locationCount == locationCount &&
        other.strength == strength &&
        other.isConnected == isConnected;
  }

  @override
  int get hashCode => Object.hash(
    name,
    countryCode,
    flag,
    city,
    locationCount,
    strength,
    isConnected,
  );
}
