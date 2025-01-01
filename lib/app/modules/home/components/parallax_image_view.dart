import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport_website/constants/customWidget/constants.dart';

class ParallaxView extends StatefulWidget {
  const ParallaxView({super.key});

  @override
  _ParallaxViewState createState() => _ParallaxViewState();
}

class _ParallaxViewState extends State<ParallaxView> {
  final List<String> _reasons = ["100% Diversity Company", "Customer Focus", "Quality Facilities", "Centralized Location", "Over the 100 country", "Efficient Technologies"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height,
      width: Get.size.width,
      color: AppColors.brandYellow,
      child: _buildScrollableContent(),
    );
  }

  Widget _buildScrollableContent() {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
          child: SizedBox(
        height: Get.size.height,
        child: Stack(
          children: [
            _buildParallaxBackground(context, constraints),
            _buildForegroundContent(),
          ],
        ),
      ));
    });
  }

  final keyImage = GlobalKey();
  Widget _buildParallaxBackground(BuildContext context, BoxConstraints constraints) {
    return Center(
        child: Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context),
        itemContext: context,
        keyImage: keyImage,
      ),
      children: [
        Image.asset(
          'assets/image/bg_image_1.jpg',
          fit: BoxFit.cover,
          key: keyImage,
          height: Get.size.height * 1.5,
          width: Get.size.width * 1.5,
        ),
      ],
    ));
  }

  Widget _buildForegroundContent() {
    return Center(
      child: Container(
        height: Get.size.height / 1.5,
        width: Get.size.width / 1.2,
        padding: EdgeInsets.all(AppFontSizes.getFontSize(4)),
        decoration: BoxDecoration(color: AppColors.blue.withOpacity(0.8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'TRANSPORT AND LOGISTIC COMPANY',
                  style: TextStyle(color: AppColors.whiteMainColor, fontWeight: FontWeight.w300, fontSize: AppFontSizes.getFontSize(1)),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "WE'RE YOUR RELIABLE PARTNER IN LOGISTICS \nAND TRANSPORT SERVICE",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.whiteMainColor, fontWeight: FontWeight.bold, fontSize: AppFontSizes.getFontSize(2.3)),
                ),
              ),
            ),
            _buildReasonRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildReasonRow() {
    return Expanded(
      flex: 2,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 5),
          itemCount: _reasons.length,
          // shrinkWrap: true,

          padding: EdgeInsets.symmetric(horizontal: AppFontSizes.getFontSize(3)),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: AppColors.brandYellow,
                  size: 40,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _reasons[index],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppFontSizes.getFontSize(.9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext itemContext;
  final GlobalKey keyImage;

  ParallaxFlowDelegate({
    required this.scrollable,
    required this.itemContext,
    required this.keyImage,
  }) : super(repaint: scrollable.position);

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) => BoxConstraints.tightFor(width: constraints.maxWidth);

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final itemBox = itemContext.findRenderObject() as RenderBox;
    final itemOffset = itemBox.localToGlobal(itemBox.size.centerLeft(Offset.zero), ancestor: scrollableBox);
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction = (itemOffset.dy / viewportDimension).clamp(0, 1);
    final verticalAlignment = Alignment(0, scrollFraction * 2 - 1);
    final imageBox = keyImage.currentContext!.findRenderObject() as RenderBox;
    final childRect = verticalAlignment.inscribe(imageBox.size, Offset.zero & context.size);
    context.paintChild(0,
        transform: Transform.translate(
          offset: Offset(0, childRect.top),
        ).transform);
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) => scrollable != oldDelegate.scrollable || itemContext != oldDelegate.itemContext || keyImage != oldDelegate.keyImage;
}
