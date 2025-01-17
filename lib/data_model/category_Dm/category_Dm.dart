import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/constants_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CategoryDm{
  String id;
  String title;
  Color bgColor;
  String imagePath;

  CategoryDm({required this.id,required this.title,required this.bgColor,required this.imagePath});

  static List<CategoryDm>getAllCategories(BuildContext context)=>[
  CategoryDm(id: ConstantsManager.sportsId, title: AppLocalizations.of(context)!.sports,
      bgColor: ColorsManager.red, imagePath: AssetsManager.sportsLogo),
    CategoryDm(id: ConstantsManager.generalId, title: AppLocalizations.of(context)!.general,
      bgColor: ColorsManager.darkBlue, imagePath: AssetsManager.generalLogo),
    CategoryDm(id: ConstantsManager.healthId, title: AppLocalizations.of(context)!.health,
        bgColor: ColorsManager.pink, imagePath: AssetsManager.healthLogo),
    CategoryDm(id: ConstantsManager.businessId, title: AppLocalizations.of(context)!.business,
        bgColor: ColorsManager.brawn, imagePath: AssetsManager.businessLogo),
    CategoryDm(id: ConstantsManager.entertainmentId, title: AppLocalizations.of(context)!.entertainment,
        bgColor: ColorsManager.blue, imagePath: AssetsManager.entrainmentLogo),
    CategoryDm(id: ConstantsManager.scienceId, title: AppLocalizations.of(context)!.science,
        bgColor: ColorsManager.yellow, imagePath: AssetsManager.scienceLogo),
    CategoryDm(id: ConstantsManager.technologyId, title: AppLocalizations.of(context)!.technology,
        bgColor: ColorsManager.green, imagePath: AssetsManager.technologyLogo),
  ];
}