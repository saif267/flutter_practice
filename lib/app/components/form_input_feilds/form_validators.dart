import 'package:form_builder_validators/form_builder_validators.dart';

class AppValidators {
  static password() {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(
        errorText: 'Password is required',
      ),
      FormBuilderValidators.minLength(
        12,
        errorText: 'Password must be at least 12 characters',
      ),
    ]);
  }

  static username() {
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(
        errorText: 'Username is required',
      ),
      FormBuilderValidators.minLength(
        3,
        errorText: 'Minimum 3 characters',
      ),
    ]);
  }
  static email(){
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(
        errorText:'email is required',
      ),
      FormBuilderValidators.email(
          errorText: 'this is not a proper email'
      ),
    ]);
  }
  static phone(){
    return FormBuilderValidators.compose([
      FormBuilderValidators.required(
        errorText:  'phone number is required',
      ),
      FormBuilderValidators.numeric(
        errorText: 'phone number must be of numbers',
      ),
    ]);
  }
}
