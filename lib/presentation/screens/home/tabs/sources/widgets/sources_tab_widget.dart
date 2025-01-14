import 'package:flutter/material.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/domain/entities/source_entity.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/widgets/source_widget.dart';

import '../../articles/view/articles_view.dart';

class SourcesTabWidget extends StatefulWidget {
  SourcesTabWidget({super.key, required this.sources});
  List<SourceEntity> sources;

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
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
                    (source) => SourceWidget(
                      source: source,
                      isSelected: widget.sources.indexOf(source) == isSelectedIndex,
                    ),
                  )
                  .toList(),
            )),
        ArticlesView(source:widget.sources[isSelectedIndex]),
      ],
    );
  }
}
