ArciemExamples
===========

A growing collection of instructive example projects for C++, Objective-C, iOS, Mac OS X, Java, and Unity3D.

Released under the Apache 2.0 license.

http://arciem.com/

ColorTouch
----------

Created at iOSDevCamp 2011, this example answers the question, "How can I create oddly-shaped touchable regions?" The short answer is, "By painting them!"

* Dependencies: iOS 5

LineDraw
----------

Created to clarify the fundamentals of view drawing with Quartz. Draw simple filled polygons by tapping. Buttons available to clear everything, undo the last tap, or remove the entire last polygon.

* Dependencies: iOS 5
* Universal for iPhone & iPad

TouchCards
----------

Demonstrates positionable views that can "flip" using a Core Animation transition.

* Dependencies: iOS 5

NativeWidget
----------

Demonstrates how to create a native-looking etched button suitable for use in (among other places) navigation bars. Widgets created this way have the "etched glossy look" with a settable tint color.

* Dependencies: iOS 5
* LibArciem (Submodule)

LayoutExample
---------

Demonstrates three different methods of laying out subviews within a view, either programmatically or using Interface Builder (.xib).

* Dependencies: iOS 5
* LibArciem (Submodule)

The app has three tabs, each of which lays out three or four UIWebViews.

The first tab, which is controlled by FirstViewController, does not rely on any special subclasses of UIView, but does rely on the autoresizingMask property of UIViews (in this case the UIWebViews) to harness the built-in resizing machinery to keep the views laid out properly as the iPad rotates.

The second tab, which is controlled by SeondViewController, uses as its main view a custom subclass of UIView called CustomLayoutView. This subclass overrides -layoutSubviews to do the work of layout every time it is necessary. It deliberately turns off the autoresizing machinery so as to avoid redundant work.

The Third tab demonstrates a 4-up layout using a .xib file.

In all cases, control is given to the UIViewController as to what content to place into the UIWebViews. This is done directly in FirstViewController, and via a set of custom property setters and getters with CustomLayoutView in SecondViewController.