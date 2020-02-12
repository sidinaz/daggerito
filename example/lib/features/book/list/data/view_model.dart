import 'package:example/app/database/database.dart';
import 'package:example/user/user_repository.dart';
import 'package:kohana/kohana.dart';

class ListBooksViewModel extends BaseViewModel<SingleItemsModel> {
  final UserRepository userRepository;
  @override
  final data = SingleItemsModel<BookDB>();

  ListBooksViewModel._(this.userRepository);

  factory ListBooksViewModel(UserRepository userRepository) {
    return ListBooksViewModel._(userRepository);
  }

  @override
  void start() {
    disposeBag.addAll([
      userRepository.getAllBooks().listen(data.setItems),
    ]);
  }

  Stream<int> deleteBookById(int id) => userRepository.deleteBookById(id);
}
