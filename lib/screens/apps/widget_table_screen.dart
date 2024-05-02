import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';
import '../../core/widgets/table_widget.dart';

class WidgetTableScreen extends StatelessWidget {
  const WidgetTableScreen({super.key});

  static const String route = "/table-widget";
  static const String name = "Table Widget";
  static const String category = "Widgets";
  static const IconData icon = Icons.table_chart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppTheme.geometry.large,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Table Widgets",
              style: AppTheme.typography.displayMedium,
            ),
            AppTheme.spacing.customY(24),
            TableWidget.basic(
              context: context,
              columnBackgroundColor: AppTheme.colors.primary,
              title: "Table Basic With All Properti",
              searchProps: SearchProps(
                hintText: "Search",
                controller: TextEditingController(),
                onChanged: (text) {},
              ),
              columns: [
                ColumnItem(title: "Source1"),
                ColumnItem(title: "Source2"),
                ColumnItem(title: "Source3"),
                ColumnItem(title: "Visitors", textAlign: TextAlign.center),
                ColumnItem(title: "Revenue", textAlign: TextAlign.center),
                ColumnItem(title: "Sales", textAlign: TextAlign.center),
                ColumnItem(title: "Conversion", textAlign: TextAlign.center),
                ColumnItem(title: "action", isVisible: false),
              ],
              data: [
                {
                  "Source1": "Direct",
                  "Source2": "Direct",
                  "Source3": "Direct",
                  "Visitors": 100,
                  "Revenue": 1000,
                  "Sales": 10,
                  "Conversion": "10%",
                  "action": [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: AppTheme.colors.primary,
                      ),
                    ),
                  ],
                },
                {
                  "Source1": "Direct",
                  "Source2": "Direct",
                  "Source3": "Direct",
                  "Visitors": 200,
                  "Revenue": 2000,
                  "Sales": 20,
                  "Conversion": "20%",
                  "action": [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: AppTheme.colors.primary,
                      ),
                    ),
                  ],
                },
                {
                  "Source1": "Direct",
                  "Source2": "Direct",
                  "Source3": "Direct",
                  "Visitors": 300,
                  "Revenue": 3000,
                  "Sales": 30,
                  "Conversion": "30%",
                  "action": [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: AppTheme.colors.primary,
                      ),
                    ),
                  ],
                },
                {
                  "Source1": "Direct",
                  "Source2": "Direct",
                  "Source3": "Direct",
                  "Visitors": 400,
                  "Revenue": 4000,
                  "Sales": 40,
                  "Conversion": "40%",
                  "action": [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: AppTheme.colors.primary,
                      ),
                    ),
                  ],
                },
              ],
            ),
            AppTheme.spacing.mediumY,
            TableWidget.card(
              context: context,
              title: "Table Card With All Properti",
              searchProps: SearchProps(
                hintText: "Search",
                controller: TextEditingController(),
                onChanged: (text) {},
              ),
              paginationProps: PaginationProps(
                totalPage: 100,
                currentPage: 1,
                onPageChanged: (page) {},
              ),
              columns: [
                ColumnItem(title: "Source1"),
                ColumnItem(title: "Source2"),
                ColumnItem(title: "Source3"),
                ColumnItem(title: "Visitors", textAlign: TextAlign.center),
                ColumnItem(title: "Revenue", textAlign: TextAlign.center),
                ColumnItem(title: "Sales", textAlign: TextAlign.center),
                ColumnItem(title: "Conversion", textAlign: TextAlign.center),
                ColumnItem(title: "action", isVisible: false),
              ],
              data: [
                {
                  "Source1": "Direct",
                  "Source2": "Direct",
                  "Source3": "Direct",
                  "Visitors": 100,
                  "Revenue": 1000,
                  "Sales": 10,
                  "Conversion": "10%",
                  "action": [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: AppTheme.colors.primary,
                      ),
                    ),
                  ],
                },
                {
                  "Source1": "Direct",
                  "Source2": "Direct",
                  "Source3": "Direct",
                  "Visitors": 200,
                  "Revenue": 2000,
                  "Sales": 20,
                  "Conversion": "20%",
                  "action": [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: AppTheme.colors.primary,
                      ),
                    ),
                  ],
                },
                {
                  "Source1": "Direct",
                  "Source2": "Direct",
                  "Source3": "Direct",
                  "Visitors": 300,
                  "Revenue": 3000,
                  "Sales": 30,
                  "Conversion": "30%",
                  "action": [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: AppTheme.colors.primary,
                      ),
                    ),
                  ],
                },
                {
                  "Source1": "Direct",
                  "Source2": "Direct",
                  "Source3": "Direct",
                  "Visitors": 400,
                  "Revenue": 4000,
                  "Sales": 40,
                  "Conversion": "40%",
                  "action": [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: AppTheme.colors.primary,
                      ),
                    ),
                  ],
                },
              ],
            ),
          ],
        ),
      ),
    );
  }
}
