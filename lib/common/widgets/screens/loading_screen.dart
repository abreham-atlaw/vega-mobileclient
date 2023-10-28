import 'package:flutter/widgets.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/common/widgets/containers/full_container.dart';
import 'package:vega/common/widgets/containers/percentage_container.dart';
import '../../async_bloc/base_state.dart';

class LoadingScreen extends StatelessWidget {
  final BaseState state;

  const LoadingScreen(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return FullContainer(
        decoration: const BoxDecoration(
            color: ColorsConfigs.dark
        ),
        child: PercentageContainer(
            width: 0.75,
            child: Column(
              children: [
                Image.asset("assets/images/logo.png"),
                const SizedBox(
                  height: SpacingConfigs.spacing3,
                ),
                // Heading1("VEGA"),
                const SizedBox(
                  height: SpacingConfigs.spacing5,
                ),
                const SizedBox(
                    width: WidgetSizeConfigs.size0,
                    child: LoadingIndicatorsConfigs.indicatorLight
                )
              ],
            )));
  }
}
