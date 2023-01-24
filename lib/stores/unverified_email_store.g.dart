// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unverified_email_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UnverifiedEmailStore on _UnverifiedEmailStoreBase, Store {
  late final _$messageAtom =
      Atom(name: '_UnverifiedEmailStoreBase.message', context: context);

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

  late final _$pressedResendEmailAsyncAction = AsyncAction(
      '_UnverifiedEmailStoreBase.pressedResendEmail',
      context: context);

  @override
  Future<void> pressedResendEmail() {
    return _$pressedResendEmailAsyncAction
        .run(() => super.pressedResendEmail());
  }

  @override
  String toString() {
    return '''
message: ${message}
    ''';
  }
}
