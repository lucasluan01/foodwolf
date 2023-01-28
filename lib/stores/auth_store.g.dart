// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_AuthStoreBase.emailValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: '_AuthStoreBase.passwordValid'))
          .value;
  Computed<bool>? _$formLoginValidComputed;

  @override
  bool get formLoginValid =>
      (_$formLoginValidComputed ??= Computed<bool>(() => super.formLoginValid,
              name: '_AuthStoreBase.formLoginValid'))
          .value;
  Computed<bool>? _$formRegisterValidComputed;

  @override
  bool get formRegisterValid => (_$formRegisterValidComputed ??= Computed<bool>(
          () => super.formRegisterValid,
          name: '_AuthStoreBase.formRegisterValid'))
      .value;
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_AuthStoreBase.nameValid'))
          .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: '_AuthStoreBase.phoneValid'))
          .value;
  Computed<bool>? _$documentValidComputed;

  @override
  bool get documentValid =>
      (_$documentValidComputed ??= Computed<bool>(() => super.documentValid,
              name: '_AuthStoreBase.documentValid'))
          .value;
  Computed<bool>? _$confirmPasswordValidComputed;

  @override
  bool get confirmPasswordValid => (_$confirmPasswordValidComputed ??=
          Computed<bool>(() => super.confirmPasswordValid,
              name: '_AuthStoreBase.confirmPasswordValid'))
      .value;
  Computed<String?>? _$emailErrorComputed;

  @override
  String? get emailError =>
      (_$emailErrorComputed ??= Computed<String?>(() => super.emailError,
              name: '_AuthStoreBase.emailError'))
          .value;
  Computed<String?>? _$passwordErrorComputed;

  @override
  String? get passwordError =>
      (_$passwordErrorComputed ??= Computed<String?>(() => super.passwordError,
              name: '_AuthStoreBase.passwordError'))
          .value;
  Computed<String?>? _$nameErrorComputed;

  @override
  String? get nameError =>
      (_$nameErrorComputed ??= Computed<String?>(() => super.nameError,
              name: '_AuthStoreBase.nameError'))
          .value;
  Computed<String?>? _$documentErrorComputed;

  @override
  String? get documentError =>
      (_$documentErrorComputed ??= Computed<String?>(() => super.documentError,
              name: '_AuthStoreBase.documentError'))
          .value;
  Computed<String?>? _$phoneErrorComputed;

  @override
  String? get phoneError =>
      (_$phoneErrorComputed ??= Computed<String?>(() => super.phoneError,
              name: '_AuthStoreBase.phoneError'))
          .value;
  Computed<String?>? _$confirmPasswordErrorComputed;

  @override
  String? get confirmPasswordError => (_$confirmPasswordErrorComputed ??=
          Computed<String?>(() => super.confirmPasswordError,
              name: '_AuthStoreBase.confirmPasswordError'))
      .value;

  late final _$nameAtom = Atom(name: '_AuthStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$phoneAtom = Atom(name: '_AuthStoreBase.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$emailAtom = Atom(name: '_AuthStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_AuthStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_AuthStoreBase.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$timeLeftAtom =
      Atom(name: '_AuthStoreBase.timeLeft', context: context);

  @override
  int get timeLeft {
    _$timeLeftAtom.reportRead();
    return super.timeLeft;
  }

  @override
  set timeLeft(int value) {
    _$timeLeftAtom.reportWrite(value, super.timeLeft, () {
      super.timeLeft = value;
    });
  }

  late final _$errorAtom = Atom(name: '_AuthStoreBase.error', context: context);

  @override
  bool get isError {
    _$errorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$errorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$isShowPasswordAtom =
      Atom(name: '_AuthStoreBase.isShowPassword', context: context);

  @override
  bool get isShowPassword {
    _$isShowPasswordAtom.reportRead();
    return super.isShowPassword;
  }

  @override
  set isShowPassword(bool value) {
    _$isShowPasswordAtom.reportWrite(value, super.isShowPassword, () {
      super.isShowPassword = value;
    });
  }

  late final _$showErrorsAtom =
      Atom(name: '_AuthStoreBase.showErrors', context: context);

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AuthStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$checkTermsAndPolicyAtom =
      Atom(name: '_AuthStoreBase.checkTermsAndPolicy', context: context);

  @override
  bool get checkTermsAndPolicy {
    _$checkTermsAndPolicyAtom.reportRead();
    return super.checkTermsAndPolicy;
  }

  @override
  set checkTermsAndPolicy(bool value) {
    _$checkTermsAndPolicyAtom.reportWrite(value, super.checkTermsAndPolicy, () {
      super.checkTermsAndPolicy = value;
    });
  }

  late final _$wasResentAtom =
      Atom(name: '_AuthStoreBase.wasResent', context: context);

  @override
  bool get wasResent {
    _$wasResentAtom.reportRead();
    return super.wasResent;
  }

  @override
  set wasResent(bool value) {
    _$wasResentAtom.reportWrite(value, super.wasResent, () {
      super.wasResent = value;
    });
  }

  late final _$messageAtom =
      Atom(name: '_AuthStoreBase.message', context: context);

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$documentAtom =
      Atom(name: '_AuthStoreBase.document', context: context);

  @override
  String? get document {
    _$documentAtom.reportRead();
    return super.document;
  }

  @override
  set document(String? value) {
    _$documentAtom.reportWrite(value, super.document, () {
      super.document = value;
    });
  }

  late final _$loginPressedAsyncAction =
      AsyncAction('_AuthStoreBase.loginPressed', context: context);

  @override
  Future<void> loginPressed() {
    return _$loginPressedAsyncAction.run(() => super.loginPressed());
  }

  late final _$_loginAsyncAction =
      AsyncAction('_AuthStoreBase._login', context: context);

  @override
  Future<void> _login() {
    return _$_loginAsyncAction.run(() => super._login());
  }

  late final _$googlePressedAsyncAction =
      AsyncAction('_AuthStoreBase.googlePressed', context: context);

  @override
  Future<void> googlePressed() {
    return _$googlePressedAsyncAction.run(() => super.googlePressed());
  }

  late final _$sendEmailPressedAsyncAction =
      AsyncAction('_AuthStoreBase.sendEmailPressed', context: context);

  @override
  Future<void> sendEmailPressed() {
    return _$sendEmailPressedAsyncAction.run(() => super.sendEmailPressed());
  }

  late final _$_createUserAsyncAction =
      AsyncAction('_AuthStoreBase._createUser', context: context);

  @override
  Future<void> _createUser() {
    return _$_createUserAsyncAction.run(() => super._createUser());
  }

  late final _$registerPressedAsyncAction =
      AsyncAction('_AuthStoreBase.registerPressed', context: context);

  @override
  Future<void> registerPressed() {
    return _$registerPressedAsyncAction.run(() => super.registerPressed());
  }

  late final _$pressedResendEmailAsyncAction =
      AsyncAction('_AuthStoreBase.pressedResendEmail', context: context);

  @override
  Future<void> pressedResendEmail() {
    return _$pressedResendEmailAsyncAction
        .run(() => super.pressedResendEmail());
  }

  late final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowPassword() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setShowPassword');
    try {
      return super.setShowPassword();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDocument(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setDocument');
    try {
      return super.setDocument(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsShowPassword() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setIsShowPassword');
    try {
      return super.setIsShowPassword();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCheckTermsAndPolicy(bool? value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setCheckTermsAndPolicy');
    try {
      return super.setCheckTermsAndPolicy(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkTermsAndPolicyError() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.checkTermsAndPolicyError');
    try {
      return super.checkTermsAndPolicyError();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void timer() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.timer');
    try {
      return super.timer();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
phone: ${phone},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
timeLeft: ${timeLeft},
error: ${isError},
isShowPassword: ${isShowPassword},
showErrors: ${showErrors},
isLoading: ${isLoading},
checkTermsAndPolicy: ${checkTermsAndPolicy},
wasResent: ${wasResent},
message: ${message},
document: ${document},
emailValid: ${emailValid},
passwordValid: ${passwordValid},
formLoginValid: ${formLoginValid},
formRegisterValid: ${formRegisterValid},
nameValid: ${nameValid},
phoneValid: ${phoneValid},
documentValid: ${documentValid},
confirmPasswordValid: ${confirmPasswordValid},
emailError: ${emailError},
passwordError: ${passwordError},
nameError: ${nameError},
documentError: ${documentError},
phoneError: ${phoneError},
confirmPasswordError: ${confirmPasswordError}
    ''';
  }
}
