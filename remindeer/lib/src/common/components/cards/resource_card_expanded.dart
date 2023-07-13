import 'package:flutter/material.dart';

class ResourceCardExpanded extends StatefulWidget {
  final String label;
  final String tag;
  final String? trailingText;
  final Widget? trailing;
  final String additionalText;

  const ResourceCardExpanded(
      {Key? key,
      required this.label,
      required this.tag,
      this.trailingText,
      required this.additionalText,
      this.trailing})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ResourceCardExpandedState();
}

class _ResourceCardExpandedState extends State<ResourceCardExpanded> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 8,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9F9),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    showTextSection(context),
                    showTrailingSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column showTextSection(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.tag,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        Text(
          widget.additionalText,
          style: const TextStyle(
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget showTrailingSection() {
    return widget.trailing ??
        Text(
          widget.trailingText ?? "",
          style: const TextStyle(
            fontSize: 12,
          ),
        );
  }
}
