import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega/common/async_bloc/async_bloc.dart';
import 'package:vega/common/async_bloc/async_events.dart';
import 'package:vega/common/async_bloc/async_status.dart';
import 'package:vega/common/async_bloc/base_state.dart';
import 'package:vega/configs/ui_configs.dart';

class AsyncContainer<B extends AsyncBloc<S>, S extends BaseState> extends StatelessWidget {
  final B Function(BuildContext context, S state) blocBuilder;
  final S state;
  final Widget Function(BuildContext context, S state) builder;

  const AsyncContainer({required this.blocBuilder, required this.state, required this.builder, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
      create: (context) => blocBuilder(context, state),
      child: BlocBuilder<B, S>(
        builder: (BuildContext context, S state) {
          switch (state.initStatus) {
            case AsyncStatus.none:
              context.read<B>().add(InitializeEvent());
              return const SizedBox(
                height: FontSizeConfigs.size1,
                child: LoadingIndicatorsConfigs.indicatorLight
              );

            case AsyncStatus.loading:
              return const SizedBox(
                  height: FontSizeConfigs.size1,
                  child: LoadingIndicatorsConfigs.indicatorLight
              );

            case AsyncStatus.done:
              return builder(context, state);

            case AsyncStatus.failed:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
