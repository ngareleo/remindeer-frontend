import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SemesterPageHeader extends StatefulWidget {
  const SemesterPageHeader({Key? key, required this.label, required this.email})
      : super(key: key);

  final String label;
  final String email;

  @override
  State<StatefulWidget> createState() => _SemesterPageHeaderState();
}

class _SemesterPageHeaderState extends State<SemesterPageHeader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary
              ],
              stops: const [0, 1],
              begin: const AlignmentDirectional(-1, 0),
              end: const AlignmentDirectional(1, 0),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                child: Container(
                  width: 50,
                  height: 50,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/images/avatar.svg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      widget.email,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline,
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
