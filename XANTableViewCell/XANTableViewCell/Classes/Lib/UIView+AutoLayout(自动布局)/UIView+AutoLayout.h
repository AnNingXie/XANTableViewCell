//
//  UIView+AutoLayout.h
//  v2.0.0
//  https://github.com/smileyborg/UIView-AutoLayout
//
//  Copyright (c) 2012 Richard Turton
//  Copyright (c) 2013 Tyler Fox
//

#import <UIKit/UIKit.h>

#pragma mark ALAttributes

//位置约束关系枚举
typedef NS_ENUM(NSInteger, ALEdge) {
    ALEdgeLeft = NSLayoutAttributeLeft,             //左边 the left edge of the view
    ALEdgeRight = NSLayoutAttributeRight,           // 右边 the right edge of the view
    ALEdgeTop = NSLayoutAttributeTop,               // 上边 the top edge of the view
    ALEdgeBottom = NSLayoutAttributeBottom,         // 下边 the bottom edge of the view
    ALEdgeLeading = NSLayoutAttributeLeading,       // 左边 the leading edge of the view (left edge for left-to-right languages like English, right edge for right-to-left languages like Arabic)
    ALEdgeTrailing = NSLayoutAttributeTrailing      // 右边 the trailing edge of the view (right edge for left-to-right languages like English, left edge for right-to-left languages like Arabic)
};

/**rr举
 */
typedef NS_ENUM(NSInteger, ALDimension){
    /**
     *  当前视图的宽
     */
    ALDimensionWidth = NSLayoutAttributeWidth,      // the width of the view
    /**
     *  当前视图的高
     */
    ALDimensionHeight = NSLayoutAttributeHeight     // the height of the view
};

/**
 *  约束对齐枚举
 */
typedef NS_ENUM(NSInteger, ALAxis){
    /**
     *  当前视图位于父视图横坐标中心
     */
    ALAxisVertical = NSLayoutAttributeCenterX, // a vertical line through the center of the view
    /**
     *  当前视图位于父视图纵坐标中心
     */
    ALAxisHorizontal = NSLayoutAttributeCenterY,// a horizontal line through the center of the view
    /**
     *  <#Description#>
     */
     ALAxisBaseline = NSLayoutAttributeBaseline      // a horizontal line at the text baseline(not applicable to all views)
};

typedef void(^ALConstraintsBlock)(void);    // a block of method calls to the UIView+AutoLayout category API


#pragma mark - UIView+AutoLayout

/**
 A category on UIView that provides a simple yet powerful interface for creating Auto Layout constraints.
 */
@interface UIView (AutoLayout)


#pragma mark Factory & Initializer Methods

/** Creates and returns a new view that does not convert the autoresizing mask into constraints. */
+ (instancetype)newAutoLayoutView;

/** Initializes and returns a new view that does not convert the autoresizing mask into constraints. */
- (instancetype)initForAutoLayout;


#pragma mark Set Constraint Priority

/** Sets the constraint priority to the given value for all constraints created using the UIView+AutoLayout category API within the given constraints block.
    NOTE: This method will have no effect (and will NOT set the priority) on constraints created or added using the SDK directly within the block! */
+ (void)autoSetPriority:(UILayoutPriority)priority forConstraints:(ALConstraintsBlock)block;


#pragma mark Remove Constraints

/** Removes the given constraint from the view it has been added to. */
+ (void)autoRemoveConstraint:(NSLayoutConstraint *)constraint;

/** Removes the given constraints from the views they have been added to. */
+ (void)autoRemoveConstraints:(NSArray *)constraints;

/** Removes all explicit constraints that affect the view.
    WARNING: Apple's constraint solver is not optimized for large-scale constraint removal; you may encounter major performance issues after using this method.
    NOTE: This method preserves implicit constraints, such as intrinsic content size constraints, which you usually do not want to remove. */
- (void)autoRemoveConstraintsAffectingView;

/** Removes all constraints that affect the view, optionally including implicit constraints.
    WARNING: Apple's constraint solver is not optimized for large-scale constraint removal; you may encounter major performance issues after using this method.
    NOTE: Implicit constraints are auto-generated lower priority constraints, and you usually do not want to remove these. */
- (void)autoRemoveConstraintsAffectingViewIncludingImplicitConstraints:(BOOL)shouldRemoveImplicitConstraints;

/** Recursively removes all explicit constraints that affect the view and its subviews.
    WARNING: Apple's constraint solver is not optimized for large-scale constraint removal; you may encounter major performance issues after using this method.
    NOTE: This method preserves implicit constraints, such as intrinsic content size constraints, which you usually do not want to remove. */
- (void)autoRemoveConstraintsAffectingViewAndSubviews;

/** Recursively removes all constraints from the view and its subviews, optionally including implicit constraints.
    WARNING: Apple's constraint solver is not optimized for large-scale constraint removal; you may encounter major performance issues after using this method.
    NOTE: Implicit constraints are auto-generated lower priority constraints, and you usually do not want to remove these. */
- (void)autoRemoveConstraintsAffectingViewAndSubviewsIncludingImplicitConstraints:(BOOL)shouldRemoveImplicitConstraints;


#pragma mark Center in Superview

/** Centers the view in its superview. */
- (NSArray *)autoCenterInSuperview;

/** 约束view1的横坐标或纵坐标中心在view1的父view中居中 */
- (NSLayoutConstraint *)autoAlignAxisToSuperviewAxis:(ALAxis)axis;


#pragma mark Pin Edges to Superview

/** 距离父视图距离多少----第一个参数为距父视图的方向------第二个参数为距离 */
- (NSLayoutConstraint *)autoPinEdgeToSuperviewEdge:(ALEdge)edge withInset:(CGFloat)inset;

/** Pins the given edge of the view to the same edge of the superview with an inset as a maximum or minimum. */
- (NSLayoutConstraint *)autoPinEdgeToSuperviewEdge:(ALEdge)edge withInset:(CGFloat)inset relation:(NSLayoutRelation)relation;

/** Pins the edges of the view to the edges of its superview with the given edge insets. */
- (NSArray *)autoPinEdgesToSuperviewEdgesWithInsets:(UIEdgeInsets)insets;

/** Pins 3 of the 4 edges of the view to the edges of its superview with the given edge insets, excluding one edge. */
- (NSArray *)autoPinEdgesToSuperviewEdgesWithInsets:(UIEdgeInsets)insets excludingEdge:(ALEdge)edge;


#pragma mark Pin Edges

/** Pins an edge of the view to a given edge of another view. */
- (NSLayoutConstraint *)autoPinEdge:(ALEdge)edge toEdge:(ALEdge)toEdge ofView:(UIView *)peerView;

/** 当前视图的某边 距离另外个视图的 某边的距离  第一个参数为当前视图的方向，第二个参数为 另外个视图的方向， 第三个参数为 另外个视图  第四个参数为距离。
 eg:我的左边 距离 他的右边 为 0 */
- (NSLayoutConstraint *)autoPinEdge:(ALEdge)edge toEdge:(ALEdge)toEdge ofView:(UIView *)peerView withOffset:(CGFloat)offset;

/** Pins an edge of the view to a given edge of another view with an offset as a maximum or minimum. */
- (NSLayoutConstraint *)autoPinEdge:(ALEdge)edge toEdge:(ALEdge)toEdge ofView:(UIView *)peerView withOffset:(CGFloat)offset relation:(NSLayoutRelation)relation;


#pragma mark Align Axes

/** Aligns an axis of the view to the same axis of another view. */
- (NSLayoutConstraint *)autoAlignAxis:(ALAxis)axis toSameAxisOfView:(UIView *)peerView;

/** Aligns an axis of the view to the same axis of another view with an offset. */
- (NSLayoutConstraint *)autoAlignAxis:(ALAxis)axis toSameAxisOfView:(UIView *)peerView withOffset:(CGFloat)offset;


#pragma mark Match Dimensions

/** Matches a dimension of the view to a given dimension of another view. */
- (NSLayoutConstraint *)autoMatchDimension:(ALDimension)dimension toDimension:(ALDimension)toDimension ofView:(UIView *)peerView;

/** Matches a dimension of the view to a given dimension of another view with an offset. */
- (NSLayoutConstraint *)autoMatchDimension:(ALDimension)dimension toDimension:(ALDimension)toDimension ofView:(UIView *)peerView withOffset:(CGFloat)offset;

/** Matches a dimension of the view to a given dimension of another view with an offset as a maximum or minimum. */
- (NSLayoutConstraint *)autoMatchDimension:(ALDimension)dimension toDimension:(ALDimension)toDimension ofView:(UIView *)peerView withOffset:(CGFloat)offset relation:(NSLayoutRelation)relation;

/** Matches a dimension of the view to a multiple of a given dimension of another view. */
- (NSLayoutConstraint *)autoMatchDimension:(ALDimension)dimension toDimension:(ALDimension)toDimension ofView:(UIView *)peerView withMultiplier:(CGFloat)multiplier;

/** Matches a dimension of the view to a multiple of a given dimension of another view as a maximum or minimum. */
- (NSLayoutConstraint *)autoMatchDimension:(ALDimension)dimension toDimension:(ALDimension)toDimension ofView:(UIView *)peerView withMultiplier:(CGFloat)multiplier relation:(NSLayoutRelation)relation;


#pragma mark Set Dimensions  设置Size类

/** 设置当前视图的宽和高 设置两个，都设置使用这个 */
- (NSArray *)autoSetDimensionsToSize:(CGSize)size;

/** 设置当前视图的宽或者高 ,只设置其中一个使用这个*/
- (NSLayoutConstraint *)autoSetDimension:(ALDimension)dimension toSize:(CGFloat)size;

/** Sets the given dimension of the view to a specific size as a maximum or minimum. */
- (NSLayoutConstraint *)autoSetDimension:(ALDimension)dimension toSize:(CGFloat)size relation:(NSLayoutRelation)relation;


#pragma mark Set Content Compression Resistance & Hugging

/** Sets the priority of content compression resistance for an axis.
    NOTE: This method must only be called from within the block passed into the method +[UIView autoSetPriority:forConstraints:] */
- (void)autoSetContentCompressionResistancePriorityForAxis:(ALAxis)axis;

/** Sets the priority of content hugging for an axis.
    NOTE: This method must only be called from within the block passed into the method +[UIView autoSetPriority:forConstraints:] */
- (void)autoSetContentHuggingPriorityForAxis:(ALAxis)axis;


#pragma mark Constrain Any Attributes

/** Constrains an attribute (any ALEdge, ALAxis, or ALDimension) of the view to a given attribute of another view. */
- (NSLayoutConstraint *)autoConstrainAttribute:(NSInteger)attribute toAttribute:(NSInteger)toAttribute ofView:(UIView *)peerView;

/** Constrains an attribute (any ALEdge, ALAxis, or ALDimension) of the view to a given attribute of another view with an offset. */
- (NSLayoutConstraint *)autoConstrainAttribute:(NSInteger)attribute toAttribute:(NSInteger)toAttribute ofView:(UIView *)peerView withOffset:(CGFloat)offset;

/** Constrains an attribute (any ALEdge, ALAxis, or ALDimension) of the view to a given attribute of another view with an offset as a maximum or minimum. */
- (NSLayoutConstraint *)autoConstrainAttribute:(NSInteger)attribute toAttribute:(NSInteger)toAttribute ofView:(UIView *)peerView withOffset:(CGFloat)offset relation:(NSLayoutRelation)relation;

/** Constrains an attribute (any ALEdge, ALAxis, or ALDimension) of the view to a given attribute of another view with a multiplier. */
- (NSLayoutConstraint *)autoConstrainAttribute:(NSInteger)attribute toAttribute:(NSInteger)toAttribute ofView:(UIView *)peerView withMultiplier:(CGFloat)multiplier;

/** Constrains an attribute (any ALEdge, ALAxis, or ALDimension) of the view to a given attribute of another view with a multiplier as a maximum or minimum. */
- (NSLayoutConstraint *)autoConstrainAttribute:(NSInteger)attribute toAttribute:(NSInteger)toAttribute ofView:(UIView *)peerView withMultiplier:(CGFloat)multiplier relation:(NSLayoutRelation)relation;


#pragma mark Pin to Layout Guides

/** Pins the top edge of the view to the top layout guide of the given view controller with an inset. */
- (NSLayoutConstraint *)autoPinToTopLayoutGuideOfViewController:(UIViewController *)viewController withInset:(CGFloat)inset;

/** Pins the bottom edge of the view to the bottom layout guide of the given view controller with an inset. */
- (NSLayoutConstraint *)autoPinToBottomLayoutGuideOfViewController:(UIViewController *)viewController withInset:(CGFloat)inset;

@end


#pragma mark - NSArray+AutoLayout

/**
 A category on NSArray that provides a simple yet powerful interface for applying constraints to groups of views.
 */
@interface NSArray (AutoLayout)


#pragma mark Constrain Multiple Views

/** Aligns views in this array to one another along a given edge. */
- (NSArray *)autoAlignViewsToEdge:(ALEdge)edge;

/** Aligns views in this array to one another along a given axis. */
- (NSArray *)autoAlignViewsToAxis:(ALAxis)axis;

/** Matches a given dimension of all the views in this array. */
- (NSArray *)autoMatchViewsDimension:(ALDimension)dimension;

/** Sets the given dimension of all the views in this array to a given size. */
- (NSArray *)autoSetViewsDimension:(ALDimension)dimension toSize:(CGFloat)size;


#pragma mark Distribute Multiple Views

/** Distributes the views in this array equally along the selected axis in their superview. Views will be the same size (variable) in the dimension along the axis and will have spacing (fixed) between them. */
- (NSArray *)autoDistributeViewsAlongAxis:(ALAxis)axis withFixedSpacing:(CGFloat)spacing alignment:(NSLayoutFormatOptions)alignment;

/** Distributes the views in this array equally along the selected axis in their superview. Views will be the same size (variable) in the dimension along the axis and will have spacing (fixed) between them, with optional insets from the first and last views to their superview. */
- (NSArray *)autoDistributeViewsAlongAxis:(ALAxis)axis withFixedSpacing:(CGFloat)spacing insetSpacing:(BOOL)shouldSpaceInsets alignment:(NSLayoutFormatOptions)alignment;

/** Distributes the views in this array equally along the selected axis in their superview. Views will be the same size (fixed) in the dimension along the axis and will have spacing (variable) between them. */
- (NSArray *)autoDistributeViewsAlongAxis:(ALAxis)axis withFixedSize:(CGFloat)size alignment:(NSLayoutFormatOptions)alignment;

/** Distributes the views in this array equally along the selected axis in their superview. Views will be the same size (fixed) in the dimension along the axis and will have spacing (variable) between them, with optional insets from the first and last views to their superview. */
- (NSArray *)autoDistributeViewsAlongAxis:(ALAxis)axis withFixedSize:(CGFloat)size insetSpacing:(BOOL)shouldSpaceInsets alignment:(NSLayoutFormatOptions)alignment;

@end


#pragma mark - NSLayoutConstraint+AutoLayout

/**
 A category on NSLayoutConstraint that allows constraints to be easily removed.
 */
@interface NSLayoutConstraint (AutoLayout)

/** Adds the constraint to the appropriate view. */
- (void)autoInstall;

/** Removes the constraint from the view it has been added to. */
- (void)autoRemove;

@end
