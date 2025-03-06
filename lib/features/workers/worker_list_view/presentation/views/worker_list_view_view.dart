import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manfaz/core/di/di.dart';
import 'package:manfaz/features/tabs/home_tab/presentation/widgets/states/home_tab_error.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/widgets/ArrowBackIosButton.dart';
import '../controller/cubit/worker_list_cubit.dart';
import '../widgets/worker_card_item.dart';

class WorkerListViewView extends StatelessWidget {
  const WorkerListViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WorkerListCubit>()..fetchWorker(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Workers',
            style: AppStyles.header1,
          ),
          leading: ArrowBackIosButton(),
        ),
        body: SafeArea(
            child: Column(
          children: [
            BlocBuilder<WorkerListCubit, WorkerListState>(
              builder: (context, state) {
                if (state is WorkerListLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } 
                else if (state is WorkerListSuccess) {
                  var workList=  state.workerListModel.data;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: workList!.length,
                      itemBuilder: (context, index) => WorkerCardItem(worker: workList[index],),
                    ),
                  );
                } else 
                if (state is WorkerListFailure) {
                  return ErrorMessageWidget(
                    errorMessage: state.failure.errorMessage,
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        )),
      ),
    );
  }
}
