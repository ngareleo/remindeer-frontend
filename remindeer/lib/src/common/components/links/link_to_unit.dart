import 'package:flutter/material.dart';

class LinkToUnitWidget extends StatelessWidget {
  const LinkToUnitWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 5),
          child: TextButton(
            onPressed: () {},
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                Icons.link_rounded,
                color: Theme.of(context).primaryColor,
                size: 18,
              ),
              Text(
                'Link to unit',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w500),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
