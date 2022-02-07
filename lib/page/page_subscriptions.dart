import 'package:flutter/material.dart';
import 'package:ticker/model/subscription.dart';
import 'package:ticker/repository.dart';
import 'package:ticker/widget/widget_error.dart';
import 'package:ticker/widget/widget_subscription.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: FutureBuilder(
            future: Repository.getSubscriptionsFromJson(),
            builder: _builderSubscription,
          ),
        ),
      );

  Widget _builderSubscription(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError) return ErrorBoxWidget(snapshot.error.toString());
    if (snapshot.hasData) return SubscriptionList(snapshot.data);
    return const Center(child: CircularProgressIndicator());
  }
}

class SubscriptionList extends StatefulWidget {
  final List<Subscription> _subscriptions;

  const SubscriptionList(this._subscriptions, {Key? key}) : super(key: key);

  @override
  State<SubscriptionList> createState() => _SubscriptionListState();
}

class _SubscriptionListState extends State<SubscriptionList> {
  late PageController _pageController;
  late int _activePage;

  @override
  void initState() {
    super.initState();
    _activePage = 0;
    _pageController = PageController(initialPage: _activePage, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            alignment: Alignment.center,
            child: const Text(
              'Think over and choose\n the best subscription option for you',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF312A7D), fontSize: 14),
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: widget._subscriptions.length,
              controller: _pageController,
              pageSnapping: true,
              onPageChanged: (page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemBuilder: (context, index) => AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                child: Transform.scale(
                  scale: (index == _activePage) ? 1.0 : 0.9,
                  child: SubscriptionWidget(
                    widget._subscriptions[index],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("BACK"),
              ),
            ),
          ),
        ],
      );
}


