import 'package:flutter/material.dart';
import 'package:twitter_flutter/models/tweet.dart';

class TweetDetails extends StatelessWidget {
  final Tweet tweetData;

  const TweetDetails({super.key, required this.tweetData});

  void like() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: like,
          tooltip: 'Like',
          child: const Icon(
            Icons.favorite,
            color: Colors.black,
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => {Navigator.pop(context)}),
          centerTitle: true,
          title: Text(
            "TwitterLike",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: const Color(0xFFFCE68E),
        ),
        body: Column(children: [
          tweetData.image != null
              ? Image.network(
                  'https://twitterlike.shrp.dev/assets//${tweetData.image}',
                )
              : const Image(
                  image: AssetImage('assets/images/place_holder.jpg'),
                ),
          Text((tweetData.createdAt ?? '').substring(0, 10)),
          Text(tweetData.text ?? ''),
        ]));
  }
}
