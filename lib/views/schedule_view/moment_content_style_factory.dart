import 'moment_content_style.dart';

class MomentContentStyleFactory {
  //! init

  MomentContentStyleFactory(this.isMomentSelected);

  //! properties

  final bool isMomentSelected;

  //! methods

  MomentContentStyle makeContentStyle() {
    if (isMomentSelected) {
      return SelectedMomentContentStyle();
    }

    return UnselectedMomentContentStyle();
  }
}
