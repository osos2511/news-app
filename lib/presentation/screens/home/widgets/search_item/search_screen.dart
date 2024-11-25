import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/provider/search_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../data/model/articles_response/Article.dart';
import '../../tabs/news/article_item_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  TextEditingController itemText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: Consumer<SearchProvider>(
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
                        context.read<SearchProvider>().searchName(itemText.text);
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
            body: _buildSearchResults(context),
          );
        },
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

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

    if (searchProvider.errorMessage.isNotEmpty) {
      return Center(
        child: Text(
          searchProvider.errorMessage,
          style: const TextStyle(fontSize: 16, color: Colors.red),
        ),
      );
    }

    List<Article> articles = searchProvider.articles;
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => ArticleItemWidget(
          article: articles[index],
        ),
        itemCount: articles.length,
      ),
    );
  }
}
