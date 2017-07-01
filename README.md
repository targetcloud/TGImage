# TGImage
一款以最时髦的方式来使用UIImage的swift插件

![Swift](https://img.shields.io/badge/Swift-3.0-orange.svg)
![Build](https://img.shields.io/badge/build-passing-green.svg)
![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)
![Platform](https://img.shields.io/cocoapods/p/Pastel.svg?style=flat)
![Cocoapod](https://img.shields.io/badge/pod-v0.0.1-blue.svg)


## Features
- [x] 支持链式编程
- [x] 支持with CGContext和size两种开启模式
- [x] 支持+= 、+两种操作
- [x] 用例丰富、快速使用

## Usage

#### size开启模式

UIImage.size() 或.resizable()
.color .border .corner
.image
.position

其中size开启的是固定大小模式、resizable开启的是可变大小模式
其中color支持传入渐变色，如 gradient: [.lightGray, .white], locations: [0, 1], from: CGPoint(x: 0, y: 1), to: CGPoint(x: 0, y: 0)
其中border可以设置color、width、radius、alignment
其中corner可以分别设置4个角或统一设置四个角为同一个值
其中image用于生成 UIImage
其中position用于后面+或+=时用

注意：按上面大的顺序链式编程，在size和image之间的color 、border 、corner没有顺序要求

```swift
UIImage.size(width: CGFloat, height: CGFloat)
UIImage.size(_ size: CGSize)
UIImage.resizable()
```

#### with开启模式

支持UIImage.with类方式开启或image.with类实例开启
类方式是返回单图，实例方式开始是在实例图的基础再加上with图，实际是两图相加模式

```swift
UIImage.with(width: CGFloat, height: CGFloat, block: ContextBlock)
image.with(size: CGSize, opaque: Bool = false, scale: CGFloat = 0, block: ContextBlock)
image.with(_ block: ContextBlock)
```

#### 其他

image.with(color)

#### 应用场景

在cell的某角上放一个某角载剪的渐变图

在某图上再画图

多个图相加放入容器图中

…

#### 1

```swift
UIImageView(image: ({ () -> UIImage in
            var container = UIImage.size(width: 180, height: 20)
                .color(.clear)
                .image
            for i in 0..<7{
                let doti = UIImage.size(width: 20, height: 20)
                    .color(gradient: [UIColor.randomColor(), UIColor.randomColor()], locations: [0, 1], from: CGPoint(x: 0, y: 0), to: CGPoint(x: 1, y: 1))
                    .corner(radius: 10)
                    .image
                    .position(CGPoint(x: i * 20 + (i + 1) * 3, y: 0))
                container = container + doti
            }
            return container
        })())
```

<img src="https://github.com/targetcloud/TGImage/blob/master/snapShot/1.png" width = "20%" hight = "20%"/>


#### 2

```swift
UIImageView(image: ({ () -> UIImage in
            var container = UIImage.size(width: 30, height: 120)
                .color(.clear)
                .image
            for i in 0..<4{
                let doti = UIImage.size(width: CGFloat(30 - i * 4), height: CGFloat(30 - i * 4))
                    .color(gradient: [UIColor.randomColor(), UIColor.randomColor()], locations: [0, 1], from: CGPoint(x: 0, y: 0), to: CGPoint(x: 1, y: 1))
                    .corner(radius: CGFloat(30 - i * 4) * 0.5)
                    .image
                    .position(CGPoint(x: i * 2, y: 30 * i + (i + 1) * 3))
                container += doti
            }
            return container
        })())
```

<img src="https://github.com/targetcloud/TGImage/blob/master/snapShot/2.png" width = "20%" hight = "20%"/>


#### 3

```swift
UIImageView(image: ({ () -> UIImage in
            return UIImage(named: "3")!.with({ context in
                UIColor.red.setFill()
                let rect = CGRect(x: 39, y: 37, width: 10, height: 10)
                context.fillEllipse(in: rect)
            })
        })())
```

<img src="https://github.com/targetcloud/TGImage/blob/master/snapShot/3.png" width = "20%" hight = "20%"/>


#### 4

```swift
UIImageView(image: UIImage.size(width: 100, height: 100)
            .color(gradient: [.green, .blue], locations: [0, 1], from: CGPoint(x: 0, y: 1), to: CGPoint(x: 0, y: 0))
            .border(gradient: [.red, .yellow], locations: [0, 1], from: CGPoint(x: 0, y: 0), to: CGPoint(x: 1, y: 0))
            .border(width: 5)
            .border(alignment: .outside)
            .corner(topLeft: 20)
            .corner(topRight: 50)
            .corner(bottomLeft: 50)
            .corner(bottomRight: 20)
            .image)
```

<img src="https://github.com/targetcloud/TGImage/blob/master/snapShot/4.png" width = "20%" hight = "20%"/>


#### 5

```swift
UIImageView(image: ({ () -> UIImage in
            let background = UIImage.size(width: 120, height: 120)
                .color(gradient: [.black, .white], locations: [0, 1], from: CGPoint(x: 0, y: 0), to: CGPoint(x: 0, y: 1))
                .corner(radius: 13.5)
                .image
            let circle = UIImage.size(width: 106, height: 106)
                .color(.white)
                .corner(radius: 50)
                .image
            let center = UIImage.size(width: 8, height: 8)
                .color(.black)
                .corner(radius: 3)
                .image
            let clock = background + circle + center
            return clock.with { context in
                context.setLineCap(.round)
                UIColor.black.setStroke()
                context.setLineWidth(2)
                context.move(to: CGPoint(x: clock.size.width / 2, y: clock.size.height / 2))
                context.addLine(to: CGPoint(x: clock.size.width / 2 - 5, y: 15))
                context.move(to: CGPoint(x: clock.size.width / 2, y: clock.size.height / 2))
                context.addLine(to: CGPoint(x: clock.size.width - 25, y: clock.size.height / 2 - 3))
                context.strokePath()
                UIColor.red.setStroke()
                context.setLineWidth(1)
                context.move(to: CGPoint(x: clock.size.width / 2 + 8, y: clock.size.height / 2 - 7))
                context.addLine(to: CGPoint(x: 26, y: clock.size.height / 2 + 35))
                context.strokePath()
                UIColor.red.setFill()
                let rect = CGRect(x: clock.size.width / 2 - 1, y: clock.size.height / 2 - 1, width: 3, height: 3)
                context.fillEllipse(in: rect)
            }
        })())
```

<img src="https://github.com/targetcloud/TGImage/blob/master/snapShot/5.png" width = "20%" hight = "20%"/>


#### 6

```swift
```

<img src="https://github.com/targetcloud/TGImage/blob/master/snapShot/6.png" width = "20%" hight = "20%"/>

<img src="https://github.com/targetcloud/TGImage/blob/master/snapShot/7.png" width = "20%" hight = "20%"/>

<img src="https://github.com/targetcloud/TGImage/blob/master/snapShot/8.png" width = "20%" hight = "20%"/>

<img src="https://github.com/targetcloud/TGImage/blob/master/snapShot/9.png" width = "20%" hight = "20%"/>


## Installation
- 下载并拖动TGImage.swift到你的工程中

- Cocoapods
```
pod 'TGImage'
```

## Reference
- http://blog.csdn.net/callzjy
- https://github.com/targetcloud/baisibudejie
- https://github.com/targetcloud/TGLabel <img src="https://github.com/targetcloud/TGLabel/blob/master/logo.png" width = "8%" hight = "8%"/>


如果你觉得赞，请Star
