

import 'package:vega/common/async_bloc/async_events.dart';
import 'package:vega/features/core/presentation/widgets/library_widgets.dart';

class LibraryEvent extends AsyncEvent{

}

class SwitchPageEvent extends LibraryEvent{

  final LibraryPage page;

  SwitchPageEvent(this.page);

}
