import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:twitter_flutter/models/tweet.dart';
import 'package:twitter_flutter/widgets/tweet_preview.dart';

class TweetMaster extends StatefulWidget {
  const TweetMaster({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TweetMastertState createState() => _TweetMastertState();
}

class _TweetMastertState extends State<TweetMaster> {
  List<Tweet> tweetList = [];

  @override
  void initState() {
    super.initState();
    collectApiTweets().then((value) {
      setState(() {
        tweetList = value;
      });
    });
  }

  Future<List<Tweet>> collectApiTweets() async {
    final dio = Dio();
    try {
      Response<dynamic> response =
          await dio.get('https://twitterlike.shrp.dev/items/tweets');

      print(response.data['data']);
      List<dynamic> responseData = response.data['data'] as List<dynamic>;
      List<Tweet> tweets = responseData.map((t) => Tweet().factory(t)).toList();

      return tweets;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: collectApiTweets(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            {
              return (snapshot.hasData)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: (ListView.builder(
                        itemCount: tweetList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TweetPreview(tweetData: tweetList[index]),
                          );
                        },
                      )))
                  : Text('${snapshot.error}');
            }
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
