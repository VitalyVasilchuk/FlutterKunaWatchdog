import 'package:flutter/material.dart';
import 'package:ticker/model/alert.dart';
import 'package:ticker/widget/unit_icon.dart';

class AlertWidget extends StatelessWidget {
  final Alert alert;

  const AlertWidget(this.alert, {Key? key}) : super(key: key);

  static const tsPrice = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: const EdgeInsets.all(2),
      child: Stack(alignment: AlignmentDirectional.topEnd, children: [
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 8),
                        child: UnitIcon(
                          alert.market.split('/')[0],
                          'https://kuna.io/icons/currency/png/BNB@3x.png',
                          24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              alert.market,
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF93A9C9)),
                            ),
                            Text(
                              alert.market,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 0.5,
                    margin: const EdgeInsets.only(left: 16),
                    color: const Color(0xFFE8EAF6),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                    child: Text(
                      alert.updatedFormatted(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerRight,
                child: Text(
                  alert.lowFormatted(),
                  style: tsPrice,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerRight,
                child: Text(
                  alert.highFormatted(),
                  style: tsPrice,
                ),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: alert.active ? const Color(0xFF81C784) : const Color(0xFFFFB74D),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(4), bottomLeft: Radius.circular(4)),
          ),
          padding: const EdgeInsets.only(left: 8, top: 1, right: 8, bottom: 1),
          child: Text(
            alert.active ? "observed" : "paused",
            style: const TextStyle(fontSize: 10, color: Colors.white),
          ),
        ),
      ]),
    );
  }
}
