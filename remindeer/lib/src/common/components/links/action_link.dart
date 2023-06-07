import 'package:flutter/material.dart';

class SemesterPageLinkWidget extends StatefulWidget {
  const SemesterPageLinkWidget({
    Key? key,
    this.label,
    this.icon,
  }) : super(key: key);

  final String? label;
  final Widget? icon;

  @override
  State<StatefulWidget> createState() => _SemesterPageLinkWidgetState();
}

class _SemesterPageLinkWidgetState extends State<SemesterPageLinkWidget> {
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: widget.icon!,
          ),
          Text(
            widget.label!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
