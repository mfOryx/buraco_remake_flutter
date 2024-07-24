import 'package:buracoplus/menu_views/notices/buttons/decoration.dart'
    show MenuButtonDecor;
import 'package:buracoplus/menu_views/notices/buttons/action.dart'
    show ButtonAction;

class NoticeLeftButton extends ButtonAction {
  const NoticeLeftButton({
    required super.noticeTextButton,
    super.key,
  }) : super(
          getDecoration: MenuButtonDecor.decoration1,
        );
}

class NoticeRightButton extends ButtonAction {
  const NoticeRightButton({
    required super.noticeTextButton,
    super.key,
  }) : super(
          getDecoration: MenuButtonDecor.decoration2,
        );
}
