import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkillIndicatorCard extends StatefulWidget {
  final String title;
  final String description;
  final double proficiency;

  const SkillIndicatorCard({
    Key? key,
    required this.title,
    required this.description,
    required this.proficiency,
  }) : super(key: key);

  @override
  _SkillIndicatorCardState createState() => _SkillIndicatorCardState();
}

class _SkillIndicatorCardState extends State<SkillIndicatorCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        transform: isHovered
            ? Matrix4.translationValues(0, -10, 0)
            : Matrix4.identity(),
        curve: Curves.easeOut,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFFFEFEF5)  ,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isHovered
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 15,
              offset: Offset(0, 8),
            ),
            BoxShadow(
              color: Color(0xFFEA7435).withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ]
              : [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: widget.proficiency,
                      backgroundColor: Color(0xFFE9DDD0) ,
                      valueColor: AlwaysStoppedAnimation(Color(0xFFD1BFAE)),
                      minHeight: 6,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "${(widget.proficiency * 100).toInt()}%",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
