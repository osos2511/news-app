import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/constants_manager.dart';
import 'package:news_app/core/utils/strings_manager.dart';

class CategoryDm{
  String id;
  String title;
  Color bgColor;
  String imagePath;

  CategoryDm({required this.id,required this.title,required this.bgColor,required this.imagePath});

  static List<CategoryDm>getAllCategories()=>[
  CategoryDm(id: ConstantsManager.sportsId, title: StringsManager.sports,
      bgColor: ColorsManager.red, imagePath: AssetsManager.sportsLogo),
    CategoryDm(id: ConstantsManager.generalId, title: StringsManager.general,
      bgColor: ColorsManager.darkBlue, imagePath: AssetsManager.generalLogo),
    CategoryDm(id: ConstantsManager.healthId, title: StringsManager.health,
        bgColor: ColorsManager.pink, imagePath: AssetsManager.healthLogo),
    CategoryDm(id: ConstantsManager.businessId, title: StringsManager.business,
        bgColor: ColorsManager.brawn, imagePath: AssetsManager.businessLogo),
    CategoryDm(id: ConstantsManager.entertainmentId, title: StringsManager.entertainment,
        bgColor: ColorsManager.blue, imagePath: AssetsManager.entrainmentLogo),
    CategoryDm(id: ConstantsManager.scienceId, title: StringsManager.science,
        bgColor: ColorsManager.yellow, imagePath: AssetsManager.scienceLogo),
    CategoryDm(id: ConstantsManager.technologyId, title: StringsManager.tech,
        bgColor: ColorsManager.green, imagePath: AssetsManager.technologyLogo),
  ];
}