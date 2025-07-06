import 'package:autism_app/Core/Utils/Assets/images/app_images.dart';
import 'package:autism_app/Core/models/diary_model.dart';
import 'package:autism_app/Features/auth/cubit/auth_cubit.dart';
import 'package:autism_app/Features/parent_view/home_screen/cubits/diary_cubit.dart';
import 'package:autism_app/Features/parent_view/home_screen/cubits/diarystate.dart';
import 'package:autism_app/Features/parent_view/report_screen/cubit/cubit.dart';
import 'package:autism_app/Features/parent_view/report_screen/cubit/state.dart';
import 'package:autism_app/Features/parent_view/report_screen/model/report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportCubit(),
      child: ReportsScreen(),
    );
  }
}

class ReportsScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportsScreen> {
  late String selectedTab;

  @override
  void initState() {
    super.initState();
    selectedTab = "Notes";
    context.read<ReportCubit>().loadReports(selectedTab);
    context.read<DiaryCubit>().getDiaryEntries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Reports"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          _buildTabSelector(),
          Expanded(
            child: selectedTab == "records"
                ? BlocBuilder<ReportCubit, ReportState>(
                    builder: (context, state) {
                      if (state is ReportLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is ReportLoaded) {
                        final records = state.reports;
                        if (records == null || records.isEmpty) {
                          return _buildEmptyState();
                        }
                        return ListView.builder(
                          padding: EdgeInsets.all(16),
                          itemCount: records.length,
                          itemBuilder: (context, index) {
                            final record = records[index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 16),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        child: Text(
                                          style: TextStyle(color: Colors.black),
                                          '${context.read<AuthCubit>().authResponseModel?.user?.username?[0] ?? ''}',
                                        ),
                                      ),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${context.read<AuthCubit>().authResponseModel?.user?.username ?? ''}',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.edit,
                                            color: Colors.blue),
                                        onPressed: () {
                                          // Edit logic
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    record.content ?? '',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (state is ReportError) {
                        return Center(child: Text(state.message));
                      } else {
                        return Container();
                      }
                    },
                  )
                : BlocBuilder<DiaryCubit, DiaryState>(
                    builder: (context, state) {
                      if (state is DiaryLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is DiaryLoaded) {
                        if (context.read<DiaryCubit>().diaryResponseModel ==
                                null ||
                            context
                                .read<DiaryCubit>()
                                .diaryResponseModel!
                                .diaries!
                                .isEmpty) {
                          return _buildEmptyState();
                        } else {
                          return _buildReportList(state.diaryResponseModel);
                        }
                      } else if (state is DiaryError) {
                        return Center(child: Text(state.message));
                      } else {
                        return Container();
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSelector() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: _buildTabButton(
              title: "Notes",
              icon: Icons.note,
              isSelected: selectedTab == "Notes",
              onTap: () {
                setState(() {
                  selectedTab = "Notes";
                });
                context.read<ReportCubit>().loadReports(selectedTab);
              },
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: _buildTabButton(
              title: "records",
              icon: Icons.graphic_eq,
              isSelected: selectedTab == "records",
              onTap: () {
                setState(() {
                  selectedTab = "records";
                });
                context.read<ReportCubit>().loadReports(selectedTab);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.blue : Colors.grey,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.grey,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.EmptyRecord,
            width: 200,
            height: 200,
          ),
          SizedBox(height: 16),
          Text(
            "There is no ${selectedTab.toLowerCase()} at this moment",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportList(List<DiaryModel>? reports) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: reports?.length,
      itemBuilder: (context, index) {
        final report = reports?[index];
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Text(
                        style: TextStyle(color: Colors.black),
                        '${context.read<AuthCubit>().authResponseModel?.user?.username?[0]}'),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${context.read<AuthCubit>().authResponseModel?.user?.username}',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      showBottomSheet(
                        showDragHandle: true,
                        context: context,
                        backgroundColor: Colors.white,

                        // isScrollControlled: true,
                        builder: (context) =>
                            _buildDiaryBottomSheet(context, report),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context
                          .read<DiaryCubit>()
                          .deleteDiaryEntry(report?.id ?? 0);
                    },
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                report?.content ?? '',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDiaryBottomSheet(
    BuildContext context,
    DiaryModel? report,
  ) {
    TextEditingController diaryController = TextEditingController();
    return BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) => GestureDetector(
        onTap: () {
          Navigator.of(context).pop(); // Close the bottom sheet
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {}, // Prevent closing when tapping inside the sheet
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: diaryController,
                        minLines: 5,
                        maxLines: 8,
                        decoration: InputDecoration(
                          hintText: report?.content ?? '',
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.7)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                        ),
                        onChanged: (text) {
                          // context.read<DiaryCubit>().updateDiaryText(text);
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the sheet
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                elevation: 0,
                                side: BorderSide(
                                    color: Colors.grey.withOpacity(0.3)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: const Text(
                                'Close',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<DiaryCubit>()
                                    .updateDiaryEntry(
                                        report?.id ?? 0, diaryController.text)
                                    .then((value) {
                                  Navigator.of(context)
                                      .pop(); // Close the sheet
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: const Text(
                                'Update diary',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
