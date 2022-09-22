import 'package:flavor/flavor_assets.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeartbeatProgressIndicator(
      child: Image.asset(
        AppImages.APPLOGO,
        scale: .8,
      ),
    );
  }
}
