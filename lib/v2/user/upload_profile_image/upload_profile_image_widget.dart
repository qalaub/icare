import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'upload_profile_image_model.dart';
export 'upload_profile_image_model.dart';

class UploadProfileImageWidget extends StatefulWidget {
  const UploadProfileImageWidget({
    super.key,
    this.img,
  });

  final String? img;

  @override
  State<UploadProfileImageWidget> createState() =>
      _UploadProfileImageWidgetState();
}

class _UploadProfileImageWidgetState extends State<UploadProfileImageWidget> {
  late UploadProfileImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadProfileImageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-1, -1),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: 175,
        decoration: BoxDecoration(
          color: const Color(0xFFC9DEFF),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          border: Border.all(
            color: const Color(0xFFD9D9D9),
            width: 1,
          ),
        ),
        child: Builder(
          builder: (context) {
            if (widget.img == ' ') {
              return Container(
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/Diseo_sin_ttulo_(6)_4_(1).png',
                          width: 100,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/icareImagenParticipante.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-0.02, -0.09),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(160),
                        child: Image.network(
                          valueOrDefault<String>(
                            widget.img,
                            'https://i.ibb.co/2qkDLKb/Frame-74.png',
                          ),
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
