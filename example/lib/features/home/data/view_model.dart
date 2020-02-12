import 'package:rxdart/rxdart.dart';
import 'package:kohana/kohana.dart';

import 'sink.dart';


class HomeViewModel extends BaseViewModel {
  final Stream<String> _input;

  get currentPage => _input.distinct();

  HomeViewModel(Sink sink):this._input = sink.selectedMenu;
}
