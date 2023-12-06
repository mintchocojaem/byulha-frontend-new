import 'package:flutter/material.dart';

import '../../modules/orb/components/components.dart';

class RouteErrorScreen extends StatelessWidget {
  final String errorMessage;

  const RouteErrorScreen({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return OrbScaffold(
      scrollBody: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
            ),
            const SizedBox(height: 32,),
            Text(
              '요청하신 페이지를 찾을 수 없어요',
              style: themeData.textTheme.titleSmall,
            ),
            const SizedBox(height: 16,),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: themeData.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
