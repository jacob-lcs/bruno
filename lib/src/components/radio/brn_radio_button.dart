import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

///单选按钮
class BrnRadioButton extends StatelessWidget {
  /// 标识当前Radio的Index
  final int radioIndex;

  /// value 选项发生变化产生的回调
  /// int 选项的index
  /// bool 选项的选中状态，true表示选中，false未选中
  final void Function(int, bool) onValueChangedAtIndex;

  /// 初始值，是否被选择
  /// 默认false
  final bool isSelected;

  /// 是否禁用当前选项
  /// 默认false
  final bool disable;

  /// 选择按钮的padding
  /// 默认EdgeInsets.all(5)
  final EdgeInsets iconPadding;

  /// 配合使用的控件，比如卡片或者text
  final Widget child;

  /// 控件是否在选择按钮的右边，
  /// true时 控件在选择按钮右边
  /// false时 控件在选择按钮的左边
  /// 默认true
  final bool childOnRight;

  /// 控件和选择按钮在row布局里面的alignment
  /// 默认值MainAxisAlignment.start
  final MainAxisAlignment mainAxisAlignment;

  /// 控件和选择按钮在row布局里面的mainAxisSize
  /// 默认值MainAxisSize.min
  final MainAxisSize mainAxisSize;

  const BrnRadioButton({
    Key key,
    @required this.radioIndex,
    @required this.onValueChangedAtIndex,
    this.disable = false,
    this.isSelected = false,
    this.iconPadding,
    this.child,
    this.childOnRight = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
  });

  @override
  Widget build(BuildContext context) {
    return BrnRadioCore(
      radioIndex: radioIndex,
      disable: disable,
      isSelected: isSelected,
      iconPadding: iconPadding,
      childOnRight: childOnRight,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      selectedImage: BrunoTools.getAssetImageWithBandColor(BrnAsset.ICON_RADIO_SINGLE_SELECTED),
      unselectedImage: BrunoTools.getAssetImage(BrnAsset.ICON_RADIO_UNSELECTED),
      disSelectedImage: BrunoTools.getAssetImage(BrnAsset.ICON_RADIO_DISABLE_MULTI_SELECTED),
      disUnselectedImage: BrunoTools.getAssetImage(BrnAsset.ICON_RADIO_DISABLE_UNSELECTED),
      child: child,
      onRadioItemClick: () {
        onValueChangedAtIndex(radioIndex, true);
      },
    );
  }
}
