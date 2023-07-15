import 'package:flutter/material.dart';

class DashboardResourceItemCard extends StatelessWidget {
  final String label;
  final String leftText;
  final String rightText;
  const DashboardResourceItemCard(
      {super.key,
      required this.label,
      required this.leftText,
      required this.rightText});

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
                label,
                style: const TextStyle(
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
                      leftText,
                      style: const TextStyle(
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
                    Flexible(
                      child: Text(
                        rightText,
                        style: const TextStyle(
                          color: Color(0xFF6B6B6B),
                          fontWeight: FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
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
