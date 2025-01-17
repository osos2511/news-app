// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../data/api/api_manager/api_manager.dart' as _i1054;
import '../../../data/data_source_contract/articles_data_source.dart' as _i769;
import '../../../data/data_source_contract/search_data_source.dart' as _i997;
import '../../../data/data_source_contract/sources_data_source.dart' as _i667;
import '../../../data/data_source_impl/articles_data_source_impl.dart' as _i563;
import '../../../data/data_source_impl/search_data_source_impl.dart' as _i348;
import '../../../data/data_source_impl/sources_data_source_impl.dart' as _i1053;
import '../../../data/repository_impl/articles_repository_impl.dart' as _i329;
import '../../../data/repository_impl/search_repository_impl.dart' as _i162;
import '../../../data/repository_impl/sources_repository_impl.dart' as _i507;
import '../../../domain/repository_contract/articles_repository_contract.dart'
    as _i692;
import '../../../domain/repository_contract/search_repository_contract.dart'
    as _i895;
import '../../../domain/repository_contract/sources_repository_contract.dart'
    as _i792;
import '../../../domain/use_cases/articles_use_case.dart' as _i981;
import '../../../domain/use_cases/search_use_case.dart' as _i120;
import '../../../domain/use_cases/sources_use_case.dart' as _i372;
import '../../../presentation/screens/home/tabs/articles/viewModel/articles_viewModel.dart'
    as _i823;
import '../../../presentation/screens/home/tabs/sources/viewModel/sources_viewModel.dart'
    as _i691;
import '../../../presentation/screens/home/widgets/search/viewModel/search_viewModel.dart'
    as _i623;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1054.ApiManager>(() => _i1054.ApiManager());
    gh.factory<_i667.SourcesDataSource>(() =>
        _i1053.SourcesApiDataSourceImpl(apiManager: gh<_i1054.ApiManager>()));
    gh.factory<_i769.ArticlesDataSource>(() =>
        _i563.ArticlesApiDataSourceImpl(apiManager: gh<_i1054.ApiManager>()));
    gh.factory<_i792.SourcesRepository>(() =>
        _i507.SourcesRepositoryImpl(dataSource: gh<_i667.SourcesDataSource>()));
    gh.factory<_i997.SearchDataSource>(() =>
        _i348.SearchApiDataSourceImpl(apiManager: gh<_i1054.ApiManager>()));
    gh.factory<_i372.GetSourcesUseCase>(() =>
        _i372.GetSourcesUseCase(repository: gh<_i792.SourcesRepository>()));
    gh.factory<_i691.SourcesViewModel>(() =>
        _i691.SourcesViewModel(sourcesUseCase: gh<_i372.GetSourcesUseCase>()));
    gh.factory<_i895.SearchRepository>(() =>
        _i162.SearchRepositoryImpl(dataSource: gh<_i997.SearchDataSource>()));
    gh.factory<_i692.ArticlesRepository>(() => _i329.ArticlesRepositoryImpl(
        dataSource: gh<_i769.ArticlesDataSource>()));
    gh.factory<_i120.SearchUseCase>(
        () => _i120.SearchUseCase(repository: gh<_i895.SearchRepository>()));
    gh.factory<_i981.GetArticlesUseCase>(() =>
        _i981.GetArticlesUseCase(repository: gh<_i692.ArticlesRepository>()));
    gh.factory<_i623.SearchViewModel>(
        () => _i623.SearchViewModel(searchUseCase: gh<_i120.SearchUseCase>()));
    gh.factory<_i823.ArticlesViewModel>(() => _i823.ArticlesViewModel(
        articlesUseCase: gh<_i981.GetArticlesUseCase>()));
    return this;
  }
}
