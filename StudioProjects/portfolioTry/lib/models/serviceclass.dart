import 'dart:ui';

import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: _isHovered
            ? Matrix4.translationValues(0, -10, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          boxShadow: _isHovered
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ]
              : [],
          color: _isHovered?Color(0xFFD1BFAE):Color(0xFFFEFEF5),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFFEA7435).withOpacity(0.3)),
        ),
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                widget.icon,
                color: _isHovered?Colors.white:Color(0xFFD1BFAE),
                size: 40,
              ),
              SizedBox(height: 20),
              Text(
                widget.title,
                style: TextStyle(
                  color: _isHovered?Colors.white:Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Text(
                widget.description,
                style: TextStyle(
                  color: _isHovered?Colors.white:Colors.black,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
