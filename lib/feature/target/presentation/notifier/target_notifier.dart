import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:konekseed_test/common/constant.dart';
import 'package:konekseed_test/common/utils.dart';
import 'package:konekseed_test/feature/auth/presentation/presentation_provider.dart';
import 'package:konekseed_test/feature/target/data/model/target.dart';
import 'package:konekseed_test/feature/target/domain/usecase/add_target.dart';
import 'package:konekseed_test/feature/target/domain/usecase/delete_target.dart';
import 'package:konekseed_test/feature/target/domain/usecase/edit_target.dart';
import 'package:konekseed_test/feature/target/domain/usecase/fetch_user_target.dart';
import 'package:uuid/uuid.dart';

class TargetNotifier extends StateNotifier<TargetState> {
  final AddTarget _addTarget;
  final DeleteTarget _deleteTarget;
  final EditTarget _editTarget;
  final FetchUserTarget _fetchUserTarget;
  final Ref _ref;

  TargetNotifier({
    required AddTarget addTargetUseCase,
    required DeleteTarget deleteTargetUseCase,
    required EditTarget editTargetUseCase,
    required FetchUserTarget fetchUserTargetUseCase,
    required Ref ref,
  })  : _addTarget = addTargetUseCase,
        _deleteTarget = deleteTargetUseCase,
        _editTarget = editTargetUseCase,
        _fetchUserTarget = fetchUserTargetUseCase,
        _ref = ref,
        super(const TargetState.initial()) {
    fetchUserTarget();
  }

  void addTarget({
    required BuildContext context,
    required String name,
    required String category,
    required int weight,
    required DateTime startDate,
    required DateTime endDate,
    required String status,
  }) async {
    state = state.copyWith(state: EnumState.loading);
    String targetId = const Uuid().v1();
    final user = _ref.read(authNotifierProvider).bussinessData!;

    final Target target = Target(
      id: targetId,
      uid: user.uid,
      name: name,
      weight: weight,
      category: category,
      startDate: startDate,
      endDate: endDate,
      status: status,
    );

    final res = await _addTarget.execute(target);
    res.fold(
      (l) {
        state = state.copyWith(state: EnumState.failure, message: l.message);
        Constants.snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) {
        state = state.copyWith(state: EnumState.loaded);
        Constants.snackbarKey.currentState?.showSnackBar(
            showSnackBarWithoutContextGreen("Target added successfully"));
        fetchUserTarget();
        Navigator.pop(context);
      },
    );
  }

  void deleteTarget(String targetId) async {
    state = state.copyWith(state: EnumState.loading);
    final res = await _deleteTarget.execute(targetId);
    res.fold(
      (l) {
        state = state.copyWith(
          state: EnumState.failure,
          message: l.message,
        );
        Constants.snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) {
        state = state.copyWith(state: EnumState.loaded);
        Constants.snackbarKey.currentState?.showSnackBar(
            showSnackBarWithoutContextRed("Delete activity successfully"));
        fetchUserTarget();
      },
    );
  }

  void editTarget({
    required Target target,
    required BuildContext context,
  }) async {
    state = state.copyWith(state: EnumState.loading);

    final res = await _editTarget.execute(target);
    res.fold(
      (l) {
        state = state.copyWith(
          state: EnumState.failure,
          message: l.message,
        );
        Constants.snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) {
        state = state.copyWith(state: EnumState.loaded);
        fetchUserTarget();
        Navigator.pop(context);
      },
    );
  }

  void fetchUserTarget() async {
    state = state.copyWith(state: EnumState.loading);
    final uid = _ref.read(authNotifierProvider).bussinessData!.uid;
    final res = await _fetchUserTarget.execute(uid);

    res.fold(
      (l) {
        state = state.copyWith(
          state: EnumState.failure,
          message: l.message,
        );
        Constants.snackbarKey.currentState
            ?.showSnackBar(showSnackBarWithoutContextRed(l.message));
      },
      (r) {
        state = state.copyWith(
          state: EnumState.loaded,
          targetList: r,
        );
      },
    );
  }
}

class TargetState {
  final List<Target> targetList;
  final EnumState state;
  final String message;

  const TargetState({
    this.targetList = const [],
    this.state = EnumState.initial,
    this.message = '',
  });

  const TargetState.initial({
    this.targetList = const [],
    this.state = EnumState.initial,
    this.message = '',
  });

  TargetState copyWith({
    List<Target>? targetList,
    EnumState? state,
    String? message,
  }) {
    return TargetState(
      targetList: targetList ?? this.targetList,
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }
}
