import 'package:flutter/widgets.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

extension WoltExtensions on BuildContext {
  // Navigation
  bool popModalPage() {
    return WoltModalSheet.of(this).popPage();
  }

  // Adds a new page to the modal sheet stack and displays it.
  void pushModalPage(
    SliverWoltModalSheetPage page,
  ) {
    WoltModalSheet.of(this).pushPage(page);
  }

  // Replaces the current page with a new page.
  void replaceModalPage(
    String id,
    SliverWoltModalSheetPage page,
  ) {
    WoltModalSheet.of(this).replacePage(id, page);
  }

  // Removes a page from the modal sheet stack.
  void removeModalPageById(
    String id,
  ) {
    WoltModalSheet.of(this).removePage(id);
  }

  // Shows the previous page in the modal sheet stack.
  bool showPrevModalPage() {
    return WoltModalSheet.of(this).showPrevious();
  }

  // Shows the next page in the modal sheet stack.
  bool showNextModalPage() {
    return WoltModalSheet.of(this).showNext();
  }

  // Shows a modal page with a list of pages.
  Future<void> showWoltModalPage(
    List<SliverWoltModalSheetPage> Function(BuildContext) pageListBuilder,
  ) {
    return WoltModalSheet.show<void>(
      context: this,
      pageListBuilder: pageListBuilder,
      // modalTypeBuilder: (context) {
      //   if (context.isMobile) {
      //     return WoltModalType.bottomSheet();
      //   } else if (context.isTablet || context.isLargeTablet) {
      //     return WoltModalType.dialog();
      //   } else {
      //     return WoltModalType.sideSheet();
      //   }
      // },
    );
  }
}
