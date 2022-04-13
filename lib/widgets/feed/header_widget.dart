import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {Key? key,
      required this.id,
      required this.name,
      required this.image,
      required this.email})
      : super(key: key);
  final String id;
  final String name;
  final String image;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ).copyWith(right: 0),
      child: Row(
        children: <Widget>[
          CircleAvatar(radius: 16, backgroundImage: NetworkImage(image)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyText2!,
                    child: Text(name),
                  ),
                  Text(
                    'post time',
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                useRootNavigator: false,
                context: context,
                builder: (context) {
                  return Dialog(
                    child: ListView(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shrinkWrap: true,
                        children: [
                          'Report...',
                          'Turn on Post notification',
                          'Copy Link',
                          'Share to...',
                          'Mute'
                        ]
                            .map((e) => InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16),
                                    child: Text(e),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ))
                            .toList()),
                  );
                },
              );
            },
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
    );
  }
}
