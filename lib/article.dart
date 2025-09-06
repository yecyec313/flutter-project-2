import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
        floatingActionButton: Container(
          height: 85 + 20,
          alignment: Alignment.topRight,
          child: Container(
            width: 111,
            height: 48,
            decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      color: theme.primaryColor.withOpacity(0.5))
                ]),
            child: InkWell(
              onTap: () {
                showSnackBar(context, 'Like button is clicked');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.img.icons.thumbs.svg(),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    '2.1k',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: const Text('Article'),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz_rounded)),
                    const SizedBox(
                      width: 17,
                    )
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed([
                    const Padding(
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Text(
                        'Four Things Every Woman Needs To Know',
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Assets.img.stories.story9
                                  .image(height: 48, width: 48)),
                          const SizedBox(
                            width: 16,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Richard Gervain',
                                    style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black)),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '2m ago',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Avenir'),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.bookmark,
                                  color: Color(0xff376AED))),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.share,
                                color: Color(0xff376AED),
                              )),
                        ],
                      ),
                    ),
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32)),
                        child: Assets.img.background.singlePost.image()),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                      child: Text(
                          'A man’s sexuality is never your mind responsibility.',
                          style: theme.textTheme.headlineSmall),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 120),
                      child: Text(
                          'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                          style: theme.textTheme.titleSmall),
                    ),
                  ]),
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: 117,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white, Colors.white.withOpacity(0)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                ))
          ],
        ));
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.fixed,
    ));
  }
}
