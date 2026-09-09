import 'package:ch18_scheduler_test/component/main_calendar.dart';
import 'package:ch18_scheduler_test/component/schedule_bottom_sheet.dart';
import 'package:ch18_scheduler_test/component/schedule_card.dart';
import 'package:ch18_scheduler_test/component/today_banner.dart';
import 'package:ch18_scheduler_test/const/colors.dart';
import 'package:ch18_scheduler_test/database/drift_database.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            isDismissible: true,
            isScrollControlled: true,
            builder: (_) => ScheduleBottomSheet(selectedDate: selectedDate),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text('ch18_scheduler_test'),
            MainCalendar(
              onDaySelected: onDaySelected,
              selectedDate: selectedDate,
            ),
            const SizedBox(height: 8),
            StreamBuilder<List<Schedule>>(
              stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
              builder: (context, snapshot) {
                return TodayBanner(
                  selectedDate: selectedDate,
                  count: snapshot.data?.length ?? 0,
                );
              },
            ),
            const SizedBox(height: 8),
            Expanded(
              child: StreamBuilder<List<Schedule>>(
                stream: GetIt.I<LocalDatabase>().watchSchedules(selectedDate),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final schedule = snapshot.data![index];

                      return Dismissible(
                        key: ObjectKey(schedule.id),
                        direction: DismissDirection.startToEnd,
                        onDismissed: (_) {
                          GetIt.I<LocalDatabase>().removeSchedule(schedule.id);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8,
                            left: 8,
                            right: 8,
                          ),
                          child: ScheduleCard(
                            startTime: schedule.startTime,
                            endTime: schedule.endTime,
                            content: schedule.content,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
