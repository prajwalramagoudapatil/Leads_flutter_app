class NewLeads{
  final String estimate_id;
  final String moving_from;
  final String moving_on;

  // final double price;
  final String moving_to;
  final String property_size;
  final String distance;
  // final double rating;

  NewLeads( {
    required this.estimate_id,
    required this.moving_from,
    // required this.price,
    required this.moving_to,
    required this.property_size,
    required this.distance,
    required this.moving_on,
    // required this.rating,
  });

  factory NewLeads.fromJson(Map<String, dynamic> json) {
    return NewLeads(
      estimate_id: json['estimate_id'],
      moving_on: json['moving_on'],
      moving_from: json['moving_from'],
      // price: json['price'].toDouble(),
      moving_to: json['moving_to'],
      property_size: json['property_size'],
      distance: json['distance'],
      // rating: json['rating']['rate'].toDouble(),
    );
  }
}