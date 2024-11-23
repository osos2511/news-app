import 'package:flutter/material.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/widgets/sources_widget/source_item_widget.dart';

import '../../../news/articles_list_widget.dart';

class SourcesWidget extends StatefulWidget {
  SourcesWidget({super.key, required this.sources});
  List<Source> sources;

  @override
  State<SourcesWidget> createState() => _SourcesWidgetState();
}

class _SourcesWidgetState extends State<SourcesWidget> {
  int isSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (index) {
                isSelectedIndex = index;
                setState(() {});
              },
              tabAlignment: TabAlignment.start,
              labelPadding: const EdgeInsets.all(8),
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabs: widget.sources
                  .map(
                    (source) => SourceItemWidget(
                      source: source,
                      isSelected: widget.sources.indexOf(source) == isSelectedIndex,
                    ),
                  )
                  .toList(),
            )),
        ArticlesListWidget(source:widget.sources[isSelectedIndex]),
      ],
    );
  }
}
