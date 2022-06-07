
class Player {
  final String nickname;
  final String socketID;
  final double points;
  final String playerType;
  Player({
    required this.nickname,
    required this.socketID,
    required this.points,
    required this.playerType,
  });

  

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'nickname': nickname});
    result.addAll({'socketID': socketID});
    result.addAll({'points': points});
    result.addAll({'playerType': playerType});
  
    return result;
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      nickname: map['nickname'] ?? '',
      socketID: map['socketID'] ?? '',
      points: map['points']?.toDouble() ?? 0.0,
      playerType: map['playerType'] ?? '',
    );
  }

  Player copyWith({
    String? nickname,
    String? socketID,
    double? points,
    String? playerType,
  }) {
    return Player(
      nickname: nickname ?? this.nickname,
      socketID: socketID ?? this.socketID,
      points: points ?? this.points,
      playerType: playerType ?? this.playerType,
    );
  }
}
