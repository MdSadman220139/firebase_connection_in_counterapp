class FootballSCore {
  final String team1;
  final String team2;
  final int team1_score;
  final int team2_score;
  final String winnner_team;
  final bool is_running;

  FootballSCore({
    required this.team1,
    required this.team2,
    required this.team1_score,
    required this.team2_score,
    required this.winnner_team,
    required this.is_running,
  });

  factory FootballSCore.fromJson(Map<String, dynamic> json) {
    return FootballSCore(
      team1: json['team1'] ?? '',
      team2: json['team2'] ?? '',
      team1_score: json['team1_score'] ?? 0,
      team2_score: json['team2_score'] ?? 0,
      winnner_team: json['winnner_team'] ?? '',
      is_running: json['is_running'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'team1': team1,
      'team2': team2,
      'team1_score': team1_score,
      'team2_score': team2_score,
      'winnner_team': winnner_team,
      'is_running': is_running,
    };
  }
}
