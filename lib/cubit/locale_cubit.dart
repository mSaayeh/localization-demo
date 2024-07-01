import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization/language_cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState(locale: const Locale('en')));

  Future<void> getSavedLanguage() async {
    final cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    emit(
      ChangeLocaleState(
        locale: Locale(cachedLanguageCode),
      ),
    );
  }

  Future<void> changeLanguage(languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
