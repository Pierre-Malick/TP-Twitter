import 'package:flutter/material.dart';
import 'package:twitter_flutter/models/tweet.dart';
import 'package:twitter_flutter/widgets/tweet_details.dart';

class TweetPreview extends StatelessWidget {
  final Tweet tweetData;

  const TweetPreview({super.key, required this.tweetData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: (tweetData.image != null
          ? Image.network(
              'https://twitterlike.shrp.dev/assets//${tweetData.image}',
              width: 100,
            )
          : const Image(
              image: AssetImage('assets/images/place_holder.jpg'), width: 100)),
      title: Text((tweetData.createdAt ?? '').substring(0, 10)),
      subtitle: Text(tweetData.text ?? ''),
      trailing: const Icon(Icons.arrow_forward),
      tileColor: const Color.fromARGB(147, 234, 234, 234),
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TweetDetails(tweetData: tweetData)),
        )
      },
    );
  }
}
