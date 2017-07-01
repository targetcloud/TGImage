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

#### with开启模式

支持UIImage.with类方式开启或image.with类实例开启

类方式是返回单图，实例方式开始是在实例图的基础再加上with图，实际是两图相加模式

#### 其他

image.with(color)

#### 应用场景

在cell的某角上放一个某角载剪的渐变图

在某图上再画图

多个图相加放入容器图中

…

如果你觉得赞，请Star
