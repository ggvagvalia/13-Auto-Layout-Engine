//
//  ViewController.swift
//  13. დავალება - Auto Layout Engine
//
//  Created by gvantsa gvagvalia on 4/5/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var coffeNameLabel: UILabel!
    @IBOutlet weak var coffeeWithLabel: UILabel!
    @IBOutlet weak var numberOfHearts: UILabel!
    @IBOutlet weak var ratingOfHearts: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var largeSizeButton: UIButton!
    @IBOutlet weak var mediumSizeButton: UIButton!
    @IBOutlet weak var smallSizeButton: UIButton!
    @IBOutlet weak var coffeePrice: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    var productName: String = "კაპუჩინო"
    var coffeeWith: String = "შოკოლადით"
    var numberOfHeartsVar: Int = 230
    var ratingOfHeartsVar: Decimal = 4.8
    var price: Double = 0.0
    var smallPrice = 4.53
    var mediumPrice = 7.00
    var largePrice = 9.00
    let unfilledHeart = UIImage(systemName: "heart")
    let filledHeart = UIImage(systemName: "heart.fill")
    var isHearted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 15
        buyButton.layer.cornerRadius = 25
        coffeNameLabel.text = productName
        coffeeWithLabel.text = coffeeWith
        numberOfHearts.text = "(\(numberOfHeartsVar))"
        ratingOfHearts.text = "\(ratingOfHeartsVar)"
        heartButton.setImage(unfilledHeart, for: .normal)
        coffeePrice.text = String(price)
    }
    
    @IBAction func heartedButton(_ sender: UIButton) {
        isHearted.toggle()
        
        switch isHearted {
        case true:
            numberOfHeartsVar += 1
            ratingOfHeartsVar += Decimal(0.1)
            heartButton.setImage(filledHeart, for: .normal)
        case false:
            numberOfHeartsVar -= 1
            ratingOfHeartsVar -= Decimal(0.1)
            heartButton.setImage(unfilledHeart, for: .normal)
        }
        numberOfHearts.text = "(\(numberOfHeartsVar))"
        ratingOfHearts.text = "\(ratingOfHeartsVar)"
    }
    
    @IBAction func sizesButton(_ sender: UIButton) {
        smallSizeButton.isSelected = false
        mediumSizeButton.isSelected = false
        largeSizeButton.isSelected = false
        sender.isSelected = true
        
        switch true {
        case smallSizeButton.isSelected:
            price = smallPrice
        case mediumSizeButton.isSelected:
            price = mediumPrice
        case largeSizeButton.isSelected:
            price = largePrice
        default:
            price = 0.0
        }
        
        coffeePrice.text = String(price)
    }
}
//#Preview {
//    ViewController()
//}
