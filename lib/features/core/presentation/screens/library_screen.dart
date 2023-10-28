


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vega/common/widgets/screens/bloc_screen.dart';
import 'package:vega/common/widgets/text/headers.dart';
import 'package:vega/configs/ui_configs.dart';
import 'package:vega/features/core/application/blocs/library_bloc.dart';
import 'package:vega/features/core/application/states/library_state.dart';
import 'package:vega/features/core/presentation/widgets/library_widgets.dart';

class LibraryScreen extends AsyncBlocScreen<LibraryBloc, LibraryState>{
  const LibraryScreen({super.key});

  @override
  LibraryBloc onCreateBloc(LibraryState state) {
    return LibraryBloc(state);
  }

  @override
  Widget onCreateMain(BuildContext context, LibraryState state) {
    return Padding(
      padding: const EdgeInsets.all(SpacingConfigs.spacing3),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading3("Library"),
            const SizedBox(height: SpacingConfigs.spacing4),
            LibraryMenuBar(state.page),
            const SizedBox(height: SpacingConfigs.spacing4),
            Builder(builder: (context) {

              switch(state.page){

                case LibraryPage.recent:
                  return RecentPageWidget(state.recent!);

                case LibraryPage.playlists:
                  return PlaylistsPageWidget(state.playlists!);

              }
            })
          ],
        ),
      ),
    );
  }

  @override
  LibraryState onCreateState() {
    return LibraryState();
  }

}