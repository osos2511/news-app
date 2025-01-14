import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/colors_manager.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ArticleEntity article=ModalRoute.of(context)?.settings.arguments as ArticleEntity;
    return Container(
      decoration: const BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(image: AssetImage(AssetsManager.bgMyApp))
      ),
      child: Scaffold(
        appBar: AppBar(title: Text(article.title??''),),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: Image.network(article.urlToImage??''),
              ),
              Text(article.source?.name??'',style: GoogleFonts.poppins(fontSize: 10.sp,fontWeight: FontWeight.w400,color: const Color(0xff79828B)),),
              SizedBox(height: 2.h,),
              Text(article.description??'',style: GoogleFonts.poppins(fontSize: 14.sp,fontWeight: FontWeight.w500,color: const Color(0xff42505C)),),
              SizedBox(height: 2.h,),
              Text(article.publishedAt??'',textAlign: TextAlign.end,style: GoogleFonts.inter(fontSize: 13.sp,fontWeight: FontWeight.w400,color: const Color(0xffA3A3A3)),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(article.content??'',textAlign: TextAlign.start,style: GoogleFonts.inter(fontSize: 13.sp,fontWeight: FontWeight.w300,color: const Color(0xff42505C)),),
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  child: TextButton(onPressed: () async {
                    String webUrl = article.url??'https://flutter.dev';
                    if (await canLaunchUrlString(webUrl)) {
                      launchUrlString(webUrl, mode: LaunchMode.externalApplication);
                    } else {
                      print("Can't launch $webUrl");
                    }
                  }, child: Text('View Full Article',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.sp,color: const Color(0xff42505C)),))),
            ],
          ),
        ),
      ),
    );
  }
}
