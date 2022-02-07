import 'package:flutter/material.dart';
import 'package:ticker/page/page_subscriptions.dart';
import 'package:ticker/widget/menu_item.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List items = [
      [Icons.shop_outlined, 'Purchase a subscription', (){}],
      [Icons.policy_outlined, 'Privacy Policy', () {}],
      [Icons.text_snippet_outlined, 'Terms & Conditions', () {}],
      [Icons.account_box_outlined, 'Show user profile data', () {}],
      [Icons.info_outline, 'About', () {}],
      [Icons.exit_to_app, 'Sign out', () {}],
    ];

    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo_full.png',
                  height: 128,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'v.0.1.2345',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 0,
        ),
        ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) => MenuItem(
            items[index][0],
            items[index][1],
            const SubscriptionPage(),
          ),
          separatorBuilder: (context, index) => const Divider(
            height: 0,
          ),
        ),
      ],
    );
  }
}
