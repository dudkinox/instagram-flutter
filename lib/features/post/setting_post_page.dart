import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'location_selector_widget.dart';
import 'post_create_view_model.dart';
import 'write_caption_widget.dart';

class SettingPostPage extends StatefulWidget {
  static const ROUTE_NAME = 'SettingPostPage';

  const SettingPostPage(
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
  _SettingPostPageState createState() => _SettingPostPageState();
}

class _SettingPostPageState extends State<SettingPostPage> {
  static const TAG = 'SettingPostPage';
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ModalRoute.of(context)!.overlayEntries.forEach((element) {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostCreateViewModel(),
      lazy: false,
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('New Post'),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: Text(
                      'Share',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .subtitle1
                          ?.copyWith(color: Colors.blue),
                    ))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  WriteCaptionWidget(
                    id: widget.id,
                    name: widget.name,
                    image: widget.image,
                    email: widget.email,
                  ),
                  const Divider(
                    height: 1,
                  ),
                  const ListTile(
                    title: Text('Tag People'),
                    dense: true,
                  ),
                  const Divider(
                    height: 1,
                  ),
                  if (context.watch<PostCreateViewModel>().currentLocation ==
                      null)
                    const ListTile(
                      title: Text('Add Location'),
                      dense: true,
                    ),
                  if (context.watch<PostCreateViewModel>().currentLocation !=
                      null)
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).toggleableActiveColor,
                          BlendMode.srcATop),
                      child: ListTile(
                        title: Text(
                            '${context.watch<PostCreateViewModel>().currentLocation}'),
                        leading: const Icon(Icons.pin_drop),
                        trailing: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              context
                                  .read<PostCreateViewModel>()
                                  .setCurrentLocation(null);
                            }),
                        dense: true,
                      ),
                    ),
                  const Divider(
                    height: 1,
                  ),
                  if (context.watch<PostCreateViewModel>().currentLocation ==
                      null)
                    LocationSelectorWidget(),
                  if (context.watch<PostCreateViewModel>().currentLocation ==
                      null)
                    const Divider(
                      height: 1,
                    ),
                  SwitchListTile(
                    value: context.watch<PostCreateViewModel>().isShareFacebook,
                    onChanged: (value) {
                      context
                          .read<PostCreateViewModel>()
                          .enableSocialShare(SocialShare.FACEBOOK, value);
                    },
                    title: const Text('Facebook'),
                  ),
                  SwitchListTile(
                    value: context.watch<PostCreateViewModel>().isShareTwitter,
                    onChanged: (value) {
                      context
                          .read<PostCreateViewModel>()
                          .enableSocialShare(SocialShare.TWITTER, value);
                    },
                    title: const Text('Twitter'),
                  ),
                  SwitchListTile(
                    value: context.watch<PostCreateViewModel>().isShareTumblr,
                    onChanged: (value) {
                      context
                          .read<PostCreateViewModel>()
                          .enableSocialShare(SocialShare.TUMBLR, value);
                    },
                    title: const Text('Tumblr'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
