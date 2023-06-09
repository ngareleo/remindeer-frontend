import 'package:flutter/material.dart';

class ResourceCard extends StatefulWidget {
  const ResourceCard(
      {Key? key,
      required this.label,
      required this.lastModified,
      required this.tag,
      this.onTap})
      : super(key: key);

  final String label;
  final String lastModified;
  final String tag;
  final Function? onTap;

  @override
  State<StatefulWidget> createState() => _ResourceCardState();
}

class _ResourceCardState extends State<ResourceCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap!(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.tag,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontFamily: 'Roboto',
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                widget.label,
                                overflow: TextOverflow.fade,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontFamily: 'Roboto',
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          widget.lastModified,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
