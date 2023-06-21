import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_event_loading_skeleton_model.dart';
export 'home_event_loading_skeleton_model.dart';

class HomeEventLoadingSkeletonWidget extends StatefulWidget {
  const HomeEventLoadingSkeletonWidget({Key? key}) : super(key: key);

  @override
  _HomeEventLoadingSkeletonWidgetState createState() =>
      _HomeEventLoadingSkeletonWidgetState();
}

class _HomeEventLoadingSkeletonWidgetState
    extends State<HomeEventLoadingSkeletonWidget> {
  late HomeEventLoadingSkeletonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeEventLoadingSkeletonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 1.88,
      child: custom_widgets.HorizontalSkeleton(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1.88,
      ),
    );
  }
}
