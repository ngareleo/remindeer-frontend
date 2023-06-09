import 'package:flutter/material.dart';
import 'package:remindeer/src/models/lecture.dart';

class DashboardResourceItemCard extends StatelessWidget {
  const DashboardResourceItemCard({super.key, required this.lecture});

  final Lecture lecture;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xFFF9F9F9),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(7, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lecture.label,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      lecture.unit?.name ?? "",
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xFF6B6B6B),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Color(0xFF6B6B6B),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      lecture.unit?.lecturer ?? "",
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xFF6B6B6B),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
