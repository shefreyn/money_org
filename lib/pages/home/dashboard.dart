import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:money_org/pages/home/widgets/total_spends.dart';
import 'package:money_org/resources/constants/string_constants.dart';
import 'package:money_org/resources/theme/text.dart';
import 'package:money_org/routes.dart';
import 'package:money_org/resources/widgets/custom_scaffold.dart';
import 'package:upi_india/upi_india.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  UpiIndia upiIndia = UpiIndia();
  List<UpiApp>? apps;
  @override
  void initState() {
    // TODO: implement initState
    initUPI();
    super.initState();
  }

  initUPI() async {
    await upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TotalSpendsWidget(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.camera);
                // Navigator.pushNamed(context, Routes.splash);
                // initUPI();

                // UPIPaymentQRCode(
                //   upiDetails: UPIDetails(
                //       upiID: 'sandeepprajapatimj-1@okaxis',
                //       payeeName: 'sandy'),
                // );
              },
              child: const Text('Camera'),
            ),
          ],
        ),
      ),
    );
  }
}
