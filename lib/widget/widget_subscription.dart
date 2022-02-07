import 'package:flutter/material.dart';
import 'package:ticker/model/subscription.dart';

class SubscriptionWidget extends StatelessWidget {
  final Subscription subscription;
  final colorMinsk = const Color(0xFF312A7D);
  final colorGreyBlue = const Color(0xFF676793);
  final colorBlueZodiac = const Color(0xFF0D0D3F);

  const SubscriptionWidget(this.subscription, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        elevation: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF312A7D),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              ),
              height: 64,
              alignment: Alignment.center,
              child: Text(
                subscription.title.toUpperCase(),
                style:
                    const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: Text(
                subscription.description,
                style: TextStyle(color: colorGreyBlue, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  subscription.image,
                  width: 96,
                  height: 96,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Text(
                subscription.price,
                style: TextStyle(color: colorBlueZodiac, fontSize: 32, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('SUBSCRIBE'),
              ),
            ),
          ],
        ),
      );
}
