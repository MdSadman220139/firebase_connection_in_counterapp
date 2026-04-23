import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_connection_in_counterapp/score.dart';
import 'package:flutter/material.dart';

class LiveScoreListScreen extends StatefulWidget {
  const LiveScoreListScreen({super.key});

  @override
  State<LiveScoreListScreen> createState() => _LiveScoreListScreenState();
}

class _LiveScoreListScreenState extends State<LiveScoreListScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  List<FootballSCore> _footballScoreList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getLiveScorelist();
  }

  Future<void> _getLiveScorelist() async {
    isLoading = true;
    setState(() {});
    _footballScoreList.clear();
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection('Football')
        .get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> s in snapshot.docs) {
      _footballScoreList.add(FootballSCore.fromJson(s.data()));
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: !isLoading,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: _footballScoreList.length,
          itemBuilder: (context, index) {
            final score = _footballScoreList[index];
            return ListTile(
              title: Text("${score.team1} vs ${score.team2}"),
              subtitle: Text(
                score.winnner_team.isNotEmpty
                    ? "Winner: ${score.winnner_team}"
                    : "Ongoing",
              ),
              trailing: Text(
                "${score.team1_score}-${score.team2_score}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              leading: CircleAvatar(
                backgroundColor: score.is_running ? Colors.green : Colors.red,
                radius: 10,
              ),
            );
          },
        ),
      ),
    );
  }
}
