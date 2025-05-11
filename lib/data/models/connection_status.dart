import 'country.dart';

class ConnectionStatus {
  final int downloadSpeed;
  final int uploadSpeed;
  final Duration connectedTime;
  final Country? connectedCountry;

  ConnectionStatus({
    required this.downloadSpeed,
    required this.uploadSpeed,
    required this.connectedTime,
    required this.connectedCountry,
  });
  
  ConnectionStatus copyWith({
    int? downloadSpeed,
    int? uploadSpeed,
    Duration? connectedTime,
    Country? connectedCountry,
  }) {
    return ConnectionStatus(
      downloadSpeed: downloadSpeed ?? this.downloadSpeed,
      uploadSpeed: uploadSpeed ?? this.uploadSpeed,
      connectedTime: connectedTime ?? this.connectedTime,
      connectedCountry: connectedCountry ?? this.connectedCountry,
    );
  }
}
