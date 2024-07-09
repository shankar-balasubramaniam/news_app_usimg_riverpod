import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app_usimg_riverpod/models/news_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_usimg_riverpod/services/news_service.dart';

part 'news_provider.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    // @Default annotation is used to set default values for non-required properties
    @Default(true) bool isLoading,
    required NewsModel newsModel,
  }) = _NewsState;

  const NewsState._();
}

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier() : super(NewsState(newsModel: NewsModel(results: []))) {
    loadNews();
  }

  loadNews() async {
    state = state.copyWith(isLoading: true);
    final newsResponse = await NewsService().fetchNews();
    final news = NewsModel.fromJson(newsResponse);
    state = state.copyWith(isLoading: false, newsModel: news);
  }
}

final newsProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((ref) => NewsNotifier());
