class Address {
  final String name;
  final String road;
  final String neighbourhood;
  final String suburb;
  final String state;
  final String postcode;
  final String country;
  final String countryCode;
  final String town;

  Address({
    this.name = '',
    this.road = '',
    this.neighbourhood = '',
    this.suburb = '',
    this.state = '',
    this.postcode = '',
    this.country = '',
    this.countryCode = '',
    this.town = '',
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      name: json['name'] ?? '',
      road: json['road'] ?? '',
      neighbourhood: json['neighbourhood'] ?? '',
      suburb: json['suburb'] ?? '',
      state: json['state'] ?? '',
      postcode: json['postcode'] ?? '',
      country: json['country'] ?? '',
      countryCode: json['country_code'] ?? '',
      town: json['town'] ?? '',
    );
  }
}
