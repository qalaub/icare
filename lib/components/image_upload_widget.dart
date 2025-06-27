import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'image_upload_model.dart';
export 'image_upload_model.dart';

class ImageUploadWidget extends StatefulWidget {
  const ImageUploadWidget({
    super.key,
    this.img,
    this.index,
    String? background,
  }) : this.background = background ??
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/vi246dg6iwmj/photoadd.png';

  final String? img;
  final int? index;
  final String background;

  @override
  State<ImageUploadWidget> createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  late ImageUploadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageUploadModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((widget.img != null && widget.img != '') &&
          (widget.img != 'https://i.ibb.co/b7TBHQJ/imagen-defecto.png') &&
          (widget.img != ' ')) {
        FFAppState().addToImagesUserUpload(widget.img!);
      }
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            valueOrDefault<String>(
              _model.uploadedFileUrl_uploadDataK6m != ''
                  ? valueOrDefault<String>(
                      _model.uploadedFileUrl_uploadDataK6m,
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/gdid8dlbsj9v/addi.png',
                    )
                  : valueOrDefault<String>(
                      widget.img != null && widget.img != ''
                          ? widget.img
                          : valueOrDefault<String>(
                              widget.background,
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/gdid8dlbsj9v/addi.png',
                            ),
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/gdid8dlbsj9v/addi.png',
                    ),
              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-owneri-care-app-1z9bmg/assets/gdid8dlbsj9v/addi.png',
            ),
            width: MediaQuery.sizeOf(context).width * 1.09,
            height: MediaQuery.sizeOf(context).height * 1.0,
            fit: BoxFit.cover,
          ),
        ),
        Builder(
          builder: (context) {
            if (_model.uploadedFileUrl_uploadDataK6m == '') {
              return Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: Color(0xFFED2AF1),
                  icon: Icon(
                    Icons.add,
                    color: Color(0xFFFFFEFE),
                    size: 24.0,
                  ),
                  showLoadingIndicator: true,
                  onPressed: () async {
                    final selectedMedia =
                        await selectMediaWithSourceBottomSheet(
                      context: context,
                      imageQuality: 50,
                      allowPhoto: true,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      safeSetState(
                          () => _model.isDataUploading_uploadDataK6m = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      var downloadUrls = <String>[];
                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();

                        downloadUrls = (await Future.wait(
                          selectedMedia.map(
                            (m) async =>
                                await uploadData(m.storagePath, m.bytes),
                          ),
                        ))
                            .where((u) => u != null)
                            .map((u) => u!)
                            .toList();
                      } finally {
                        _model.isDataUploading_uploadDataK6m = false;
                      }
                      if (selectedUploadedFiles.length ==
                              selectedMedia.length &&
                          downloadUrls.length == selectedMedia.length) {
                        safeSetState(() {
                          _model.uploadedLocalFile_uploadDataK6m =
                              selectedUploadedFiles.first;
                          _model.uploadedFileUrl_uploadDataK6m =
                              downloadUrls.first;
                        });
                      } else {
                        safeSetState(() {});
                        return;
                      }
                    }

                    if (widget.index != null) {
                      if (FFAppState().imagesUserUpload.length >
                          widget.index!) {
                        FFAppState().updateImagesUserUploadAtIndex(
                          widget.index!,
                          (_) => _model.uploadedFileUrl_uploadDataK6m,
                        );
                        FFAppState().update(() {});
                      } else {
                        FFAppState().insertAtIndexInImagesUserUpload(
                            widget.index!,
                            _model.uploadedFileUrl_uploadDataK6m);
                        FFAppState().update(() {});
                      }
                    } else {
                      FFAppState().addToImagesUserUpload(
                          _model.uploadedFileUrl_uploadDataK6m);
                      FFAppState().update(() {});
                    }
                  },
                ),
              );
            } else {
              return Align(
                alignment: AlignmentDirectional(1.0, 1.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: Color(0xFFED2AF1),
                  icon: Icon(
                    Icons.close,
                    color: Color(0xFFFFFEFE),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    FFAppState().removeFromImagesUserUpload(
                        _model.uploadedFileUrl_uploadDataK6m);
                    FFAppState().update(() {});
                    await FirebaseStorage.instance
                        .refFromURL(_model.uploadedFileUrl_uploadDataK6m)
                        .delete();
                    safeSetState(() {
                      _model.isDataUploading_uploadDataK6m = false;
                      _model.uploadedLocalFile_uploadDataK6m =
                          FFUploadedFile(bytes: Uint8List.fromList([]));
                      _model.uploadedFileUrl_uploadDataK6m = '';
                    });
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
