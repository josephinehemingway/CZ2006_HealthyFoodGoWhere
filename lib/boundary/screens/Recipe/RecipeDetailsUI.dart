import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entity/RecipeDetails.dart';
import '../../widgets/customAppBar.dart';
import 'RecipesListUI.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../widgets/bottomNavBar.dart';
import 'package:flutter_app/boundary/widgets/animation.dart';

/// This is the boundary class which displays the Individual Recipes Screen in the mobile UI.
class RecipeDetailsUI extends StatefulWidget {

  /// The route name for navigation to [RecipeDetailsUI].
  static String routeName = '/recipeDetails';
  
  /// Parameters for [RecipeDetailsUI].
  final RecipeDetails recipeDetails;

  /// Parameters for [RecipeDetailsUI].
  final String recipeTitle, recipeImg;

  /// Class constructor for [RecipeDetailsUI].
  RecipeDetailsUI({
    this.recipeDetails,
    this.recipeTitle,
    this.recipeImg
  });

  @override
  _RecipeDetailsUIState createState() => _RecipeDetailsUIState();
}

/// This class manages the state of the [RecipeDetailsUI].
///
/// Includes the business logic behind [RecipeDetailsUI].
class _RecipeDetailsUIState extends State<RecipeDetailsUI> {
  
  /// Widget build method to implement [RecipeDetailsUI].
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: myAppBar(widget.recipeTitle, context, HealthyRecipesList()),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.recipe),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            RecipeAppBar(widget.recipeTitle, context, HealthyRecipesList(),
                widget.recipeImg),
          ];
        },

        // To display the website of the recipe selected.
        body: WebView(
            initialUrl: widget.recipeDetails.spoonacularSourceUrl,
            //JS unrestricted, so that JS can execute in the webview
            javascriptMode: JavascriptMode.unrestricted,
            gestureRecognizers: [
              Factory(() => PlatformViewVerticalGestureRecognizer()),
            ].toSet()
        ),
      )
      );
  }
}

class PlatformViewVerticalGestureRecognizer
    extends VerticalDragGestureRecognizer {
  PlatformViewVerticalGestureRecognizer({PointerDeviceKind kind})
      : super(kind: kind);

  Offset _dragDistance = Offset.zero;

  @override
  void addPointer(PointerEvent event) {
    startTrackingPointer(event.pointer);
  }

  @override
  void handleEvent(PointerEvent event) {
    _dragDistance = _dragDistance + event.delta;
    if (event is PointerMoveEvent) {
      final double dy = _dragDistance.dy.abs();
      final double dx = _dragDistance.dx.abs();

      if (dy > dx && dy > kTouchSlop) {
        // vertical drag - accept
        resolve(GestureDisposition.accepted);
        _dragDistance = Offset.zero;
      } else if (dx > kTouchSlop && dx > dy) {
        // horizontal drag - stop tracking
        stopTrackingPointer(event.pointer);
        _dragDistance = Offset.zero;
      }
    }
  }

  @override
  String get debugDescription => 'horizontal drag (platform view)';

  @override
  void didStopTrackingLastPointer(int pointer) {}
}