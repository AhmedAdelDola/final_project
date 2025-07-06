import 'package:autism_app/Core/models/diary_model.dart';
import 'package:autism_app/Features/parent_view/bottomNav/bottomNav.dart';
import 'package:autism_app/Features/parent_view/bottomNav/cubit/cubit.dart';
import 'package:autism_app/Features/parent_view/home_screen/cubits/diary_cubit.dart';
import 'package:autism_app/Features/parent_view/home_screen/cubits/diarystate.dart';
import 'package:autism_app/Features/parent_view/home_screen/widgets/home_appbar.dart';
import 'package:autism_app/Features/parent_view/home_screen/widgets/manage_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DiaryCubit()..getDiaryEntries(),
      child: const HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        if (state is DiaryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DiaryError) {
          return Center(child: Text(state.message));
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppbar(),
              const SizedBox(height: 10),
              ManageAcc(),
              const SizedBox(height: 20),
              _buildKidProfile(
                  context,
                  state,
                  context.read<DiaryCubit>().diaryResponseModel ??
                      DiaryResponseModel()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildKidProfile(
      BuildContext context, DiaryState state, DiaryResponseModel model) {
    return Column(
      children: [
        _buildProgressIndicator(state, model),
        const SizedBox(height: 20),
        _buildDiaryButtons(context),
        const SizedBox(height: 15),
        _buildDiaryHistory(context),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildProgressIndicator(DiaryState state, DiaryResponseModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 90.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: model.diaries?.length ?? 0,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: const Icon(Icons.check, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Day ${model.diaries?[index].day}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Text(
                //   i <= 3
                //       ? 'Completed'
                //       : i == 4
                //           ? 'Add diary'
                //           : '',
                //   style: TextStyle(
                //     color: Colors.grey,
                //     fontSize: 12,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiaryButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
              child: ElevatedButton(
            onPressed: () {
              showBottomSheet(
                showDragHandle: true,
                context: context,
                backgroundColor: Colors.white,

                // isScrollControlled: true,
                builder: (context) => _buildDiaryBottomSheet(context),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.grey,
              elevation: 0,
              side: BorderSide(color: Colors.grey.withOpacity(0.3)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: const Text(
              'type Diary',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          )),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Record Diary',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiaryHistory(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.check_circle, color: Colors.blue),
                  SizedBox(width: 5),
                  Text(
                    'Diary History',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.add, color: Colors.blue),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<DiaryCubit>()
                        .deleteAllDiaryEntry()
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('All diaries deleted successfully'),
                        ),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.grey,
                    elevation: 0,
                    side: BorderSide(color: Colors.grey.withOpacity(0.3)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Delete all',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Share diaries',
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
    );
  }

  Widget _buildDiaryBottomSheet(
    BuildContext context,
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
                          hintText:
                              'please include any behaviors or experiences you think are important',
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
                                    .addDiaryEntry(diaryController.text)
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
                                'Add diary',
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
