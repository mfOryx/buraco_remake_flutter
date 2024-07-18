import 'package:buracoplus/menu_views/notices/buttons/decoration.dart'
    show MenuButtonDecor;
import 'package:buracoplus/menu_views/notices/buttons/template.dart'
    show ButtonTemplate;

class NoticeLeftButton extends ButtonTemplate {
  const NoticeLeftButton({
    required super.noticeTextButton,
    super.key,
  }) : super(
          getDecoration: MenuButtonDecor.getDecoration1,
        );
}

class NoticeRightButton extends ButtonTemplate {
  const NoticeRightButton({
    required super.noticeTextButton,
    super.key,
  }) : super(
          getDecoration: MenuButtonDecor.getDecoration2,
        );
}
