# 【译】Core Graphics，第一部分：序章

> [Core Graphics, Part 1: In the Beginning - Mark Dalrymple](https://www.bignerdranch.com/blog/core-graphics-part-1-in-the-beginning/)

Mac 和 iOS 开发者有许多不同的让东西显示在屏幕上的编程接口。UIKit 和 AppKit 有各种各样的 image、color 和 path 类。Core Animation 让你可以移动 layer。OpenGL 让你可以在三维空间渲染东西。SpriteKit 让你可以做动画。AVFoundation 让你可以播放视频。

Core Graphics，或者它在市场中被人熟知的名字“Quartz”，是这个平台上最老的图形相关 API 之一。Quartz 构建了大多数二维的东西的基础。想要画些图形，给它们填充上渐变并且加上阴影？用 Core Graphics。想要在屏幕上合成图片？Core Graphics 能解决。想要创建 PDF？还是 Core Graphics。

CG 是一个相当大的 API，包括了从基本的几何数据结构（例如：点、大小、向量和矩形）和用于操作它们的方法、用于将像素渲染进图片或者屏幕的东西，一直到事件处理。你可以用 CG 来创建“events taps”，它能帮你监听和操作应用中的事件流（鼠标点击、屏幕点击、任意键盘按键）。

好吧。最后一项是有点奇怪。为什么一个 graphics API 要处理用户事件呢？这啊和别的一样，还得从历史说起。而且了解一点历史也可以帮助理解为什么 CG 是那样工作的。

## 历史中的 PostScript

从时间的迷雾往回看（二十世纪八十年代，Duran Duran 还在上升期时），graphic API 相比今天还非常初级。你能做的只有从有限的色盘中挑选颜色、绘制独立的像素点、连线和画一些基本的图形比如矩形和椭圆。你可以设置剪切范围来告诉别人，“嘿，这儿不能画，”而且有时候你会有一些不受控的特性比如调整线有多宽。经常会有一些“像素位块传输”的功能用于将像素块到处复制。Mac 上的 QuickDraw 有一个很酷的功能叫做 `regions`，它能让你创建任意形状的区域然后使用它们来绘制、剪切、绘制轮廓或者 hit -test。不过基本上，当时的 API 都是面向像素的。

1985 年，Apple 发布了 LaserWriter，一个是其链接的计算机价格两倍的打印机。它包含一个比其链接的计算机更强劲的微处理器，以及一个 12 倍的 RAM。归功于一个叫做 PostScript 的技术，这款打印机（在当时）制作出了魅力惊人的打印制品。

PostScript 是一个来自 Adobe 的基于栈的计算机语言，与 FORTH 类似。PostScript， 这种技术，是为了创建矢量图（艺术的数学描述）而非基于像素。在 LaserWriter 中内嵌了一个 PostScript 解释器，因此当 Mac 上的程序想要打印什么东西的时候，这个程序（或者某个打印机驱动）将会生成一段程序代码，将其载入打印机并执行。

下面是一个 PostScript 代码的例子以及结果图像：

![](https://www.bignerdranch.com/assets/img/blog/2014/10/postscript-code.png)

你可以在 [Github](https://github.com/markd2/CGPS) 上找到这个项目。

将页面用代码形式来展现是一个非常重要的设计上的决策。这使得程序可以以算法的形式展现页面中的内容，因此用于执行这段程序的设备能够用其最大分辨率来绘制页面。对于当时大多数打印机，这个值是 300dpi。对于其他的，1200dpi。它们都是由同样的生成的程序绘制的。

除了渲染页面，PostScript 是图灵完备的，并且可以被当作通用编程语言。你甚至可以用它写 Web Server。

## Companion CuBEs

NeXT 工程师在设计他们的系统时，他们选择了 PostScript 作为渲染模型。Display PostScript，简称 DPS，扩展了 PostScript 模型，使其能够在窗口化的计算机显示器工作。不过其核心仍是一个 PostScript 解释器。NeXT 的应用可以用 PostScript 代码实现其屏幕绘制，并且用同一段代码进行打印。你同样也可以用 C 函数来包裹 postScript （使用一个叫 pswrap 的程序）以从应用代码中调用。

Display PostScript 是用户交互的基础。事件（鼠标、键盘、更新等等）通过 DPS 系统然后被分发到应用中去。

NeXT 并非当时唯一使用 PostScript 的窗口化系统。Sun 的 NeWS（除了名字像之外，和 NeXT 没有一点关系）也有一个用于驱动系统中用户交互的内嵌 PostScript 解释器。

## 说说 Quartz

为什么 OS X 和 iOS 不用 Display PostScript？基本上是钱的原因。Adobe 收取 Display PostScript 证书费用。同时，Apple 也是有名的想要尽可能有更多他们自有的技术栈。通过实现 PostScript 绘制模型，但并不真正使用 PostScript，他们既避免了付证书费也有了 Core Graphics 的代码。

有一种普遍的说法是 Quartz 是“基于” PDF 的，在某种意义上的确如此。PDF 就是没有任意编程功能的 PostScript 绘制模型。Quartz 被设计成其 API 的典型使用和 PDF 本身支持的非常接近，以至于在这个平台上创建 PDF 几乎不费吹灰之力。

哪怕 Display PostScript 被 Quartz 取代了，同样的基本原理被保留下来了，包括事件处理。看看 Cocoa 栈轨迹的 18 帧吧。DPS 仍在！

![](https://www.bignerdranch.com/assets/img/blog/2014/10/stack-trace.png)

## 基础架构

我会在接下来的几周讲到更多 Quartz 细节的各个方面，但是有一个重点是用于“画东西”的那段代码被从实际图形渲染中抽象出来了。“渲染”可以是“让东西在 NSView 中显示”，或者“让东西显示在 UIImage 里面”，甚至是“让东西显示在 PDF 中”。

你所有的 CG 绘制都在一个“context（上下文）”中执行，它是数据结构和用于控制如何绘制的方法的指针的集合。

![](https://www.bignerdranch.com/assets/img/blog/2014/10/output.png)

Context 有很多种，比如（在 Mac 上）有 NSWindowGraphicsContext。这一特定 context 获取你的代码安排的绘制指令，然后在你的应用的地址空间里中一块共享内存里绘制出像素。这一段内存也与窗口服务器共享。窗口服务器将所有正在运行的应用的窗口表面样子一起展示在屏幕上。

另一种 CG Context 是一种图片 context。任何你运行的绘制代码都会将像素布置在一个位图图片中。你可以使用这个图片来绘入其它 context 中或者作为 PNG 或 JPEG 保存在文件系统。同样也有一个 PDF context。运行的绘制代码不会变成像素，而是变成了 PDF 命令并被存进一个文件中。此后，PDF查看器可以使用那些 PDF 命令来渲染成某种可以查看的东西。

![](https://www.bignerdranch.com/assets/img/blog/2014/10/different-results.png)

## 接下来

下一次，更近距离来看看 context，以及一些 Core Graphics 中的便捷 API。
