import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sport_profile_208415/providers/providers.dart';

import '../widgets/widgets.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<MatchesProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              SizedBox(height: 16.h),
              SizedBox(
                width: 358.w,
                child: Row(
                  children: [
                    ProfilesMenuDrawer(),
                    SizedBox(width: 16.w),
                    FiltersDrawer(),
                    Spacer(),
                    CreateButton(onTap: () => context.go('/matches/create')),
                  ],
                ),
              ),
              if (value.filters.isNotEmpty) ...[
                SizedBox(height: 24.h),
                FiltersRow(
                  filters: value.filters,
                  onDelete: value.removeFilter,
                  onReset: value.resetFilters,
                ),
              ],
              SizedBox(height: 24.h),
              CustomMatchesTab(
                selected: value.selectedTab,
                onChanged: value.selectTab,
              ),
              SizedBox(height: 18.h),
              SizedBox(
                width: 358.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PopupUnderButton(
                      dateTime: value.dateTime,
                      onChanged: value.changeDate,
                    ),
                    CustomDateButton(),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              WeekCalendar(
                dateTime: value.dateTime,
                onChanged: value.changedDatetime,
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(top: 32.h, bottom: 200.h),
                  itemBuilder: (context, index) {
                    final match = value.matches[index];
                    return Center(
                      child: MatchCard(
                        matchModel: match,
                        onEdit: () {
                          value.selectModel(match);
                          context.go('/matches/info/edit');
                        },
                        onDelete: () {
                          value.deleteMatchById(match);
                        },
                        onTap: () {
                          value.selectModel(match);
                          context.go('/matches/info');
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16.h);
                  },
                  itemCount: value.matches.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
