import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/di/di.dart';
import 'package:news_app/presentation/screens/home/widgets/search/viewModel/search_viewModel.dart';
import 'package:provider/provider.dart';
import '../../../tabs/articles/widgets/article_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final SearchViewModel viewModel;
  final TextEditingController itemText = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = getIt<SearchViewModel>();
  }

  @override
  void dispose() {
    itemText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage(AssetsManager.bgMyApp)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _buildAppBar(),
          body: Consumer<SearchViewModel>(
            builder: (context, viewModel, child) {
              return _buildSearchResults(viewModel);
            },
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 70,
      title: Container(
        margin: REdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: TextFormField(
          controller: itemText,
          onChanged: (value) => viewModel.searchName(value),
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.searchTextField,
            hintStyle: GoogleFonts.poppins(
              color: const Color(0xff6B6B6B),
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
            prefixIcon: IconButton(
              onPressed: () => itemText.clear(),
              icon: const Icon(Icons.close, color: Colors.black),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults(SearchViewModel viewModel) {
    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.errorMessage != null) {
      return Center(
        child: Text(
          viewModel.errorMessage!,
          style: const TextStyle(fontSize: 16, color: Colors.red),
        ),
      );
    }

    final articles = viewModel.articles;
    if (articles == null || articles.isEmpty) {
      return  Center(
        child: Text(
          AppLocalizations.of(context)!.search,
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) => ArticlesItem(article: articles[index]),
    );
  }
}
