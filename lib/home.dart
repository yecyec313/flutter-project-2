import 'package:blogclub/article.dart';
import 'package:blogclub/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stories = AppDatabase.stories;
    final categories = AppDatabase.categories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 19, 34, 12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'hi holyfield',
                        style: TextStyle(
                            fontFamily: 'Avenir', fontWeight: FontWeight.w600),
                      ),
                      Image.asset(
                        'assets/img/icons/notification.png',
                        width: 24,
                        height: 24,
                      ),
                    ]),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(32, 0, 0, 22),
                child: Text(
                  'Explore today s',
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.w900,
                      fontSize: 24),
                ),
              ),
              _StoryList(stories: stories),
              const SizedBox(
                height: 16,
              ),
              const _CategoryList(),
              const _PostList(),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        return _Categoryitem(
          category: categories[realIndex],
          lef: realIndex == 0 ? 32 : 8,
          ri: realIndex == categories.length - 1 ? 32 : 8,
        );
      },
      options: CarouselOptions(
        padEnds: false,
        scrollPhysics: const BouncingScrollPhysics(),
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.8,
        disableCenter: true,
        initialPage: 0,
        aspectRatio: 1.2,
        enableInfiniteScroll: false,
      ),
    );
  }
}

class _Categoryitem extends StatelessWidget {
  final Category category;
  final double lef;
  final double ri;
  const _Categoryitem({
    Key? key,
    required this.category,
    required this.lef,
    required this.ri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(lef, 0, ri, 0),
      child: Stack(
        children: [
          Positioned.fill(
              top: 130,
              right: 56,
              bottom: 16,
              left: 56,
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 20, color: Color(0xff0D253C))
                ]),
              )),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                      colors: [Color(0xff0D2b3C), Colors.transparent],
                      begin: AlignmentDirectional.bottomStart,
                      end: Alignment.center)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32), color: Colors.blue),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                    'assets/img/posts/large/${category.imageFileName}',
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
              bottom: 43,
              left: 45,
              child: Text(
                category.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: Colors.white),
              ))
        ],
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    Key? key,
    required this.stories,
  }) : super(key: key);

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final Story = stories[index];
          return _Story(Story: Story);
        },
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    Key? key,
    required this.Story,
  }) : super(key: key);

  final StoryData Story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              Story.isViewed ? _proimgviewed() : _proimgNormal(),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/img/icons/${Story.iconFileName}',
                    width: 24,
                    height: 24,
                  ))
            ],
          ),
          Text(
            Story.name,
            style: const TextStyle(fontFamily: 'Avenir'),
          )
        ],
      ),
    );
  }

  Widget _proimgNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color(0xff376AED),
          Color(0xff49B0E2),
          Color(0xff9CECFB),
        ], begin: Alignment.topLeft),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(21)),
        child: _proimg(),
      ),
    );
  }

  Widget _proimgviewed() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        dashPattern: [5, 3],
        radius: const Radius.circular(24),
        color: const Color.fromARGB(123, 0, 0, 0),
        child: Container(
          child: Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(21)),
            child: _proimg(),
          ),
        ),
      ),
    );
  }

  Widget _proimg() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset('assets/img/stories/${Story.imageFileName}'),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'latest name',
                style: TextStyle(
                    fontFamily: 'Avenir',
                    color: Color(0xff0D253C),
                    fontWeight: FontWeight.w700),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('more',
                    style: TextStyle(color: Color(0xff376AED))),
              )
            ],
          ),
        ),
        ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: posts.length,
            itemExtent: 141,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Post(post: post);
            })
      ],
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ArticleScreen())),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 13, 0),
        margin: const EdgeInsets.fromLTRB(25, 8, 20, 8),
        height: 149,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
            boxShadow: [
              const BoxShadow(blurRadius: 10, color: Color(0xff5282FF))
            ]),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                    'assets/img/posts/small/${post.imageFileName}')),
            const SizedBox(
              width: 0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.caption,
                      style: const TextStyle(
                          fontFamily: 'Avenir',
                          color: Color(0xff370AED),
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      post.title,
                      style: const TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.hand_thumbsup,
                          size: 18,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          post.likes,
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          CupertinoIcons.clock,
                          size: 16,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          post.time,
                          style: const TextStyle(fontSize: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                margin: const EdgeInsets.only(right: 16),
                                child: Icon(
                                    post.isBookmarked
                                        ? CupertinoIcons.bookmark_fill
                                        : CupertinoIcons.bookmark,
                                    size: 16))),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
