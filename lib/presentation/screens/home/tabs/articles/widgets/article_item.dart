import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/routes_manager.dart';
import 'package:news_app/data/model/articles_response/Article.dart';

class ArticlesItem extends StatelessWidget {
  ArticlesItem({super.key, required this.article});
  Article article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManager.articleDetailsRoute,
            arguments: article);
      },
      child: Container(
        margin: REdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              article.source?.name ?? '',
              style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff79828B)),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              article.description ?? '',
              style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff42505C)),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              article.publishedAt ?? '',
              textAlign: TextAlign.end,
              style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffA3A3A3)),
            ),
          ],
        ),
      ),
    );
  }
}
