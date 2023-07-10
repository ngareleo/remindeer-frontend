import 'package:flutter/material.dart';
import 'package:remindeer/src/screens/pages/semester/semester_settings_page.dart';

class SemesterPageHeader extends StatefulWidget {
  const SemesterPageHeader({Key? key, required this.label, required this.email})
      : super(key: key);

  final String label;
  final String email;

  @override
  State<StatefulWidget> createState() => _SemesterPageHeaderState();
}

class _SemesterPageHeaderState extends State<SemesterPageHeader> {
  static const url =
      "https://yt3.googleusercontent.com/_DiGCcjGwJQAZ3zmlyB8TCYuA8O9tDJ9zGNysq5sR0rxwYb6SP5fW8cb3LbfcRwfui0m27oIhA=s900-c-k-c0x00ffffff-no-rj";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SemesterSettingsPage()))
      },
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(10),
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
            Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                url,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 60,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.white),
                    ),
                    Text(
                      widget.email,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
