import 'package:flutter/material.dart';
import 'package:project_two_blogclub/UI/home/home.dart';
import 'package:project_two_blogclub/data/data.dart';
import 'package:project_two_blogclub/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(32, 0, 32, 48),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: themeData.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color:
                            themeData.colorScheme.onBackground.withOpacity(0.1),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Profile',
                              style: themeData.textTheme.titleLarge,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_horiz_rounded,
                                  color: Colors.black,
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Assets.img.stories.story8
                                    .image(width: 84, height: 84)),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('@joviedan'),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Jovi Daniel',
                                    style: themeData.textTheme.bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'UX Designer',
                                    style: themeData.textTheme.bodyLarge!.apply(
                                        color:
                                            themeData.colorScheme.onBackground),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                          child: Text(
                            'About me',
                            style: themeData.textTheme.titleLarge,
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                        child: Text(
                          'Madison Blackstone is director of user experience design, with experience managing global teams.',
                          style: themeData.textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 32,
                  left: 96,
                  right: 96,
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 30,
                          color: themeData.colorScheme.onBackground
                              .withOpacity(0.9),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 32,
                  left: 64,
                  right: 64,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.onBackground,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff2151CD)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '52',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: themeData.colorScheme.surface),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Post',
                                  style: themeData.textTheme.bodyLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w200,
                                          color: themeData.colorScheme.surface),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '250',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: themeData.colorScheme.surface),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Following',
                                style: themeData.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: themeData.colorScheme.surface),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.5K',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: themeData.colorScheme.surface),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Followers',
                                style: themeData.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: themeData.colorScheme.surface),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 10)
                ],
                color: themeData.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          'My Pots',
                          style: themeData.textTheme.titleLarge,
                        )),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.grid_view_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.table_rows_sharp,
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  for (var i = 0; i < posts.length; i++) Post(post: posts[i])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
