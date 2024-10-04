import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/core/helper/handle_size.dart';
import 'package:g_p_app/data/api/upload_image_api.dart';
import 'package:g_p_app/data/model/response/AllProductResponse.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'design_box_model.dart';
import 'widgets/design_box_widgets.dart';

class DrawingRoomScreen extends StatefulWidget {
  static const String routeName = 'drawing_room';

  const DrawingRoomScreen({Key? key}) : super(key: key);

  @override
  State<DrawingRoomScreen> createState() => _DrawingRoomScreenState();
}

class _DrawingRoomScreenState extends State<DrawingRoomScreen> {
  final ScreenshotController screenshotController = ScreenshotController();
  File? _imageFile;
  var availableColor = [
    Colors.black,
    Colors.red,
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.brown,
  ];
  String uploadImage = '';
  List<DrawingPoint> historyDrawingPoints = [];
  List<DrawingPoint> drawingPoints = [];
  Color selectedColor = Colors.black;
  double selectedWidth = 5.0;

  DrawingPoint? currentDrawingPoint;

  void _takeScreenshot() async {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final directory = (await getApplicationDocumentsDirectory()).path;
    final fileName = '$directory/screenshot_$time.png';

    screenshotController.capture().then((image) {
      if (image != null) {
        File imgFile = File(fileName);
        imgFile.writeAsBytesSync(image);
        UploadImageApi().uploadImage(image, fileName).then((value) {
          setState(() {
            uploadImage = value['location'].toString();
            _imageFile = imgFile;
          });
        }).catchError((error) {
          print(error);
        });
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      currentDrawingPoint = DrawingPoint(
        id: DateTime.now().microsecondsSinceEpoch,
        offsets: [details.localPosition],
        color: selectedColor,
        width: selectedWidth,
      );
      drawingPoints.add(currentDrawingPoint!);
      historyDrawingPoints = List.of(drawingPoints);
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      currentDrawingPoint?.offsets.add(details.localPosition);
      drawingPoints.last = currentDrawingPoint!;
      historyDrawingPoints = List.of(drawingPoints);
    });
  }

  void _onPanEnd() {
    currentDrawingPoint = null;
  }

  void _addToCart(Data args) {
    List<Map<String, dynamic>> items = [
      {
        'id': args.id,
        'productName': args.name,
        'pictureUrl': uploadImage,
        'size': args.productSize?[0].sizename,
        'color': args.productColor?[0].colorname,
        'price': args.price,
        'quantity': 1,
      }
    ];

    Map<String, dynamic> requestData = {
      'id': 'basket1',
      'items': items,
    };

    HomeCubit.get(context).updateCart(data: requestData);
    HomeCubit.get(context).convertCartToJson();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Data?;

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Screenshot(
                controller: screenshotController,
                child: Stack(
                  children: [
                    SizedBox(
                      height: context.deviceHeight,
                      width: context.deviceWidth,
                      child: Image.network(args?.productPictures?[0] ?? ''),
                    ),
                    buildDrawingArea(
                      drawingPoints: drawingPoints,
                      onPanStart: _onPanStart,
                      onPanUpdate: _onPanUpdate,
                      onPanEnd: _onPanEnd,
                    ),
                  ],
                ),
              ),
              buildColorPalette(
                availableColors: availableColor,
                selectedColor: selectedColor,
                onColorSelected: (color) => setState(() {
                  selectedColor = color;
                }),
              ),
              buildBottomButtons(
                onAddToCart: () => _addToCart(args!),
                onTakeScreenshot: _takeScreenshot,
                onUndo: () {
                  setState(() {
                    drawingPoints.removeLast();
                  });
                },
                onRedo: () {
                  setState(() {
                    if (drawingPoints.length < historyDrawingPoints.length) {
                      drawingPoints.add(historyDrawingPoints[drawingPoints.length]);
                    }
                  });
                },
              ),
            ],
          ),
        );
      },
    );

  }
}
