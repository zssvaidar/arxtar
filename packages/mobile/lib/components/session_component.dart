import 'package:flutter/material.dart';
import '../models/models.dart';

class SessionCard extends StatelessWidget {
  final Session session;

  const SessionCard({
    Key? key,
    required this.session,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          this.session.toString()
      ),
    );
  }
}
