import 'package:mobx/mobx.dart';

part 'form_page_view_model.g.dart';

class FormPageViewModel extends _FormPageViewModelBase
    with _$FormPageViewModel {
  FormPageViewModel();
}

abstract class _FormPageViewModelBase with Store {
  _FormPageViewModelBase();
}
