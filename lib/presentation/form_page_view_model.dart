import 'package:mobx/mobx.dart';

part 'form_page_view_model.g.dart';

class FormPageViewModel extends _FormPageViewModelBase
    with _$FormPageViewModel {
  FormPageViewModel();
}

abstract class _FormPageViewModelBase with Store {
  _FormPageViewModelBase();

  @observable
  String email = '';
  @observable
  String? emailError;

  @observable
  bool acceptedTerms = false;
  @observable
  String? acceptedTermsError;

  @computed
  bool get isFormValid => email.isNotEmpty && acceptedTerms;

  @alwaysNotify
  bool showSuccessInfo = false;

  @action
  void onEmailChanged(String newValue) {
    email = newValue;

    if (email.isEmpty) {
      emailError = 'This field is required';
    } else {
      emailError = null;
    }
  }

  @action
  void onTermsChanged(bool? newValue) {
    acceptedTerms = newValue ?? false;

    if (!acceptedTerms) {
      acceptedTermsError = 'You must accept our Terms and Conditions';
    } else {
      acceptedTermsError = null;
    }
  }

  @action
  void submitForm() {
    if (isFormValid) {
      showSuccessInfo = true;
    }
  }
}
