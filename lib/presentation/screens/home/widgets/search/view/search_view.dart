import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/presentation/screens/home/widgets/search/viewModel/search_viewModel.dart';
import 'package:provider/provider.dart';
import '../../../../../../data/model/articles_response/Article.dart';
import '../../../tabs/articles/widgets/article_item.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  TextEditingController itemText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(),
      child: Consumer<SearchViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 70,
              title: Container(
                margin: REdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: itemText,
                  decoration: InputDecoration(
                    hintText: 'Search Article',
                    hintStyle: GoogleFonts.poppins(
                      color: const Color(0xff6B6B6B),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {
                        itemText.clear();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.green,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        context
                            .read<SearchViewModel>()
                            .searchName(itemText.text);
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.green,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            body: buildSearchResults(context),
          );
        },
      ),
    );
  }

  Widget buildSearchResults(BuildContext context) {
    var searchProvider = Provider.of<SearchViewModel>(context);

    if (searchProvider.search?.isEmpty ?? true) {
      return const Center(
        child: Text(
          'Please enter a search term.',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    if (searchProvider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (searchProvider.errorMessage!=null) {
      return const Center(
        child: Text(
          'Connection is not found',
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
      );
    }

    List<Article> articles = searchProvider.articles!;
    return ListView.builder(
      itemBuilder: (context, index) => ArticlesItem(
        article: articles[index],
      ),
      itemCount: articles.length,
    );
  }
}
