//
//  ViewController.swift
//  TGImage
//
//  Created by targetcloud on 2017/6/30.
//  Copyright © 2017年 targetcloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let iv : UIImageView = UIImageView(image: UIImage.size(width: UIScreen.main.bounds.width, height: 20)
            .color(gradient: [.lightGray, .white], locations: [0, 1], from: CGPoint(x: 0, y: 1), to: CGPoint(x: 0, y: 0))
            .border(color: .gray)
            .border(width: 1)
            .corner(radius: 5)
            .image)
        iv.frame.origin = CGPoint(x: 0, y: 20)
        self.view.addSubview(iv)
        
        let iv2 : UIImageView = UIImageView(image: UIImage.size(width: UIScreen.main.bounds.width, height: 34)
            .color(.orange)
            .corner(bottomLeft: 10)
            .corner(bottomRight: 10)
            .image)
        iv2.frame.origin = CGPoint(x: 0, y: iv.frame.maxY+5)
        self.view.addSubview(iv2)
        
        let iv3 : UIImageView = UIImageView(image: UIImage.size(width: 100, height: 70)
            .color(gradient: [UIColor.randomColor(), .white], locations: [0, 1], from: CGPoint(x: 0, y: 0), to: CGPoint(x: 1, y: 0))
            .border(color: .darkGray)
            .border(width: 5)
            .border(alignment: .outside)
            .corner(topLeft: 1)
            .corner(bottomLeft: 20)
            .corner(topRight: 20)
            .corner(bottomRight: 30)
            .image)
        iv3.frame.origin = CGPoint(x: 0, y: iv2.frame.maxY+5)
        self.view.addSubview(iv3)
        
        let iv4 = UIImageView(image: UIImage.size(width: 100, height: 100)
            .color(gradient: [.green, .blue], locations: [0, 1], from: CGPoint(x: 0, y: 1), to: CGPoint(x: 0, y: 0))
            .border(gradient: [.red, .yellow], locations: [0, 1], from: CGPoint(x: 0, y: 0), to: CGPoint(x: 1, y: 0))
            .border(width: 5)
            .border(alignment: .outside)
            .corner(topLeft: 20)
            .corner(topRight: 50)
            .corner(bottomLeft: 50)
            .corner(bottomRight: 20)
            .image)
        iv4.frame.origin = CGPoint(x: 0, y: iv3.frame.maxY+5)
        self.view.addSubview(iv4)
        
        let iv5 = UIImageView(image: UIImage(named: "2")!.with(size: CGSize(width: 50, height: 20)) { context in
            UIColor.red.setFill()
            context.fillEllipse(in: CGRect(x: 0, y: 0, width: 20, height: 20))
        })
        iv5.frame.origin = CGPoint(x: 0, y: iv4.frame.maxY)
        self.view.addSubview(iv5)
        
        let iv6 = UIImageView(image: ({ () -> UIImage in
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
        iv6.frame.origin.y = iv5.frame.maxY
        self.view.addSubview(iv6)
        
        self.view.addSubview(({ () -> UIButton in
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
            button.setBackgroundImage(
                UIImage.resizable()
                    .color(.lightGray)
                    .border(gradient: [.red, .white], locations: [0, 1], from: CGPoint(x: 0, y: 0), to: CGPoint(x: 1, y: 1))
                    .border(width: 5)
                    .border(alignment: .outside)
                    .corner(radius: 15)
                    .image,
                for: .normal
            )
            button.frame.origin.y = iv6.frame.maxY+5
            return button
        })())
        
        let topLeftCorner = UIImageView(image:
            ({ () -> UIImage in
                return UIImage.size(width: UIScreen.main.bounds.width*0.5, height: 22)
                    .color(gradient: [UIColor.randomColor(), .white], locations: [0, 1], from: CGPoint(x: 0, y: 0), to: CGPoint(x: 1, y: 1))
                    .corner(topLeft: 10)
                    .image
            })())
        topLeftCorner.frame.origin.y = self.view.bounds.height - 44
        self.view.addSubview(topLeftCorner)
        
        let bottomLeftCorner = UIImageView(image:
            ({ () -> UIImage in
                return UIImage.size(width: UIScreen.main.bounds.width*0.5, height: 22)
                    .color(gradient: [.lightGray, .white], locations: [0, 1], from: CGPoint(x: 0, y: 0), to: CGPoint(x: 1, y: 1))
                    .corner(bottomLeft: 10)
                    .image
            })())
        bottomLeftCorner.frame.origin.y = self.view.bounds.height - 22
        self.view.addSubview(bottomLeftCorner)
        
        let iv7 = UIImageView(image: ({ () -> UIImage in
            let img = UIImage.size(width: 180, height: 50)
                .color(.black)
                .corner(radius: 5)
                .image
            let background = UIImage.size(width: 160, height: 40)
                .color(.white)
                .corner(radius: 5)
                .image
            let circle = UIImage.size(width: 8, height: 8)
                .color(.white)
                .corner(radius: 4)
                .image
                //.with(color: .red)
                .position(CGPoint(x: 2, y: 10))
            
            return img + background + circle
        })())
        iv7.frame.origin = CGPoint(x: UIScreen.main.bounds.width*0.5, y: iv2.frame.maxY+5)
        self.view.addSubview(iv7)
        
        let iv8 = UIImageView(image:
            ({ () -> UIImage in
                return UIImage.size(width: UIScreen.main.bounds.width*0.5, height: 44)
                    .color(gradient: [.red, .white], locations: [0, 1], from: CGPoint(x: 0, y: 0), to: CGPoint(x: 1, y: 1))
                    .corner(bottomRight: 20)
                    .image
            })())
        iv8.frame.origin.x = iv7.frame.origin.x
        iv8.frame.origin.y = iv7.frame.maxY + 5
        self.view.addSubview(iv8)
        
        let iv9 = UIImageView(image:
            ({ () -> UIImage in
                return UIImage.size(width: UIScreen.main.bounds.width*0.5, height: 44)
                    .color(gradient: [.white, .lightGray], locations: [0, 1], from: CGPoint(x: 0, y: 0), to: CGPoint(x: 1, y: 1))
                    .corner(bottomLeft: 20)
                    .image
            })())
        iv9.frame.origin.x = iv8.frame.origin.x
        iv9.frame.origin.y = iv8.frame.maxY + 5
        self.view.addSubview(iv9)
        
        let iv10 = UIImageView(image: ({ () -> UIImage in
            let img = UIImage.size(width: 180, height: 70)
                .color(.red)
                .corner(radius: 15)
                .image
            let circle = UIImage.size(width: 18, height: 18)
                .color(.white)
                .corner(radius: 9)
                .image
                .position(CGPoint(x: 10, y: 10))
            return img + circle
        })())
        iv10.frame.origin = CGPoint(x: UIScreen.main.bounds.width*0.5, y: iv9.frame.maxY+5)
        self.view.addSubview(iv10)
        
        let iv11 = UIImageView(image: ({ () -> UIImage in
            let img = UIImage.size(width: 180, height: 60)
                .border(color: .black)
                .border(width: 2)
                .corner(radius: 5)
                .image
            let pinecone = UIImage(named: "1")?.position(CGPoint(x: 10, y: 10))
            return img + pinecone!
        })())
        iv11.frame.origin = CGPoint(x: UIScreen.main.bounds.width*0.5, y: iv10.frame.maxY+5)
        self.view.addSubview(iv11)
        
        let iv12 = UIImageView(image: ({ () -> UIImage in
            return UIImage(named: "3")!.with({ context in
                UIColor.red.setFill()
                let rect = CGRect(x: 39, y: 37, width: 10, height: 10)
                context.fillEllipse(in: rect)
            })
        })())
        iv12.frame.origin = CGPoint(x: UIScreen.main.bounds.width*0.5, y: iv11.frame.maxY+5)
        self.view.addSubview(iv12)
        
        let iv13 = UIImageView(image: ({ () -> UIImage in
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
        iv13.frame.origin = CGPoint(x: UIScreen.main.bounds.width*0.5, y: iv12.frame.maxY+5)
        self.view.addSubview(iv13)
        
        let iv14 = UIImageView(image: ({ () -> UIImage in
            var container = UIImage.size(width: 30, height: 120)
                .color(.clear)
                .image
            for i in 0..<4{
                let doti = UIImage.size(width: CGFloat(30 - i * 4), height: CGFloat(30 - i * 4))
                    .color(gradient: [UIColor.randomColor(), UIColor.randomColor()], locations: [0, 1], from: CGPoint(x: 0, y: 0), to: CGPoint(x: 1, y: 1))
                    .corner(radius: CGFloat(30 - i * 4) * 0.5)
                    .image
                    .position(CGPoint(x: i * 2, y: 30 * i + (i + 1) * 3))
                //container = container + doti
                container += doti
            }
            return container
        })())
        iv14.frame.origin = CGPoint(x: UIScreen.main.bounds.width*0.5, y: iv13.frame.maxY+5)
        self.view.addSubview(iv14)
        
        let iv99 = UIImageView(image:
            ({ () -> UIImage in
                return UIImage.size(width: UIScreen.main.bounds.width*0.5, height: 44)
                    .color(gradient: [.white, UIColor.randomColor().withAlphaComponent(0.5)], locations: [0, 1], from: CGPoint(x: 0, y: 0), to: CGPoint(x: 1, y: 1))
                    .corner(topLeft: 20)
                    .image
            })())
        iv99.frame.origin.x = iv8.frame.origin.x
        iv99.frame.origin.y = self.view.bounds.height - 44
        self.view.addSubview(iv99)
    }
}

