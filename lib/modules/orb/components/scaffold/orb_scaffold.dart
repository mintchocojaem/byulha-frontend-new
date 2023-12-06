import 'package:flutter/material.dart';
import 'package:taba/modules/orb/components/app_bar/orb_app_bar.dart';
import 'package:taba/modules/orb/components/button/orb_button.dart';

class OrbScaffold extends StatelessWidget {
  final OrbAppBar? orbAppBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool resizeToAvoidBottomInset;
  final OrbButton? submitButton;
  final Widget? submitHelper;
  final ScrollController? scrollController;
  final bool defaultAppBar;
  final bool shrinkWrap;
  final bool scrollBody;

  const OrbScaffold({
    super.key,
    this.orbAppBar,
    this.body,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset = false,
    this.submitButton,
    this.submitHelper,
    this.scrollController,
    this.defaultAppBar = true,
    this.shrinkWrap = false,
    this.scrollBody = true,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar:
          defaultAppBar && orbAppBar == null ? const OrbAppBar() : orbAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: scrollBody
                        ? SingleChildScrollView(
                            controller: scrollController,
                            child: shrinkWrap
                                ? body
                                : IntrinsicHeight(
                                    child: body,
                                  ),
                          )
                        : body,
                  ),
                ),
                if (submitButton != null)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        submitButton!,
                        submitHelper ?? const SizedBox(),
                      ],
                    ),
                  ),
              ],
            ),
            if (MediaQuery.of(context).viewInsets.bottom > 0)
              Positioned(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 0,
                right: 0,
                child: submitButton?.copyWith(buttonRadius: OrbButtonRadius.none) ?? const SizedBox(),
              ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
