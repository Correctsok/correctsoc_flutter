import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/cache_helper/language_cache_helper.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalInitial());

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLocaleState(locale: Locale(languageCode)));
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }

  
}
