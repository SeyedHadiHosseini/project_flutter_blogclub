import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_two_blogclub/gen/assets.gen.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
            color: themeData.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: themeData.colorScheme.onPrimary.withOpacity(0.5),
              ),
            ]),
        child: InkWell(
          onTap: () {
            showSnackBar(context, 'Like button is clicked');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.thumb_up_alt_outlined,
                size: 25,
                color: themeData.colorScheme.surface.withOpacity(0.9),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                '2.1k',
                style: TextStyle(
                    color: themeData.colorScheme.surface, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                title: const Text('Article'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded),
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Text(
                        'Four Things Every Woman Needs To Know',
                        style: themeData.textTheme.headlineMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Assets.img.stories.story9.image(
                                height: 48, width: 48, fit: BoxFit.cover),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Anne Gervain',
                                  style: themeData.textTheme.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text('2m ago'),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showSnackBar(context, 'Share  button is clicked');
                            },
                            icon: const Icon(CupertinoIcons.share),
                          ),
                          IconButton(
                            onPressed: () {
                              showSnackBar(
                                  context, 'BookMark button is clicked');
                            },
                            icon: const Icon(
                              CupertinoIcons.bookmark,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      child: Assets.img.background.woman.image(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                      child: Text(
                        'Mans sexuality is never your mind responsibility.',
                        style: themeData.textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                      child: Text(
                        'Women don’t want to be dominated. They want to be treated as equals, but they want their husbands to be the loving initiator of the home in four important areas: the children, romance, finances, and spiritual matters.They want you to be the loving initiator of the home. Even if you have more of a passive personality, you need to stand up and be the initiator. It means you begin the conversations about disciplining your children. You begin the conversations about budgeting. You begin the conversations about church and spirituality and prayer and things like that.Women don’t want headlines. They don’t want grunts and groans. They don’t want to hear nothing. How she connects to your world and your heart is through communication. When your wife says to you, “What did you do today?” She doesn’t just want the events; she wants the feelings.Women don’t want headlines. They don’t want grunts and groans. They don’t want to hear nothing. How she connects to your world and your heart is through communication. When your wife says to you, “What did you do today?” She doesn’t just want the events; she wants the feelings.This is an amazing thing: the more non-sexual soft affection women get, the more sexual they become. You need to be physically affectionate with your wife. Listen to her when she’s telling you she wants to be held, and be patient and gentle. What non-sexual physical affection communicates to her is that she’s more to you than just a sex object and that you’re connected on a higher level than just sex.',
                        style: themeData.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 116,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0)
                  ]
                )
              ),
            ),
          ),
        ],
      )),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.fixed,
    ));
  }
}
