import 'package:flavor/flavor_assets.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeartbeatProgressIndicator(
        child:Image.asset(
        AppImages.APPLOGO,
        width: MediaQuery.of(context).size.width * .25,
        height: MediaQuery.of(context).size.height * .25,
        ),
    );
  }
}
