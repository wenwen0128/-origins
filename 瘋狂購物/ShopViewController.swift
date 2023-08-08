//
//  ShopViewController.swift
//  瘋狂購物
//
//  Created by 溫皓 on 2023/8/3.
//

import UIKit

class ShopViewController: UIViewController {

    // 產品清單
    var products = [
            Product(name: "產品1", quantity: 0, price: 980),
            Product(name: "產品2", quantity: 0, price: 1600),
            Product(name: "產品3", quantity: 0, price: 1600),
            Product(name: "產品4", quantity: 0, price: 1050),
            Product(name: "產品5", quantity: 0, price: 1200),
            Product(name: "產品6", quantity: 0, price: 1400)
        ]

    // 總金額
    var totalMoney: Int {
         products.reduce(0) { $0 + $1.quantity * $1.price }
    }
    
    
    

    // MARK: - Outlets
    
    @IBOutlet weak var totalMoneyLabel: UILabel!
    @IBOutlet weak var product6Label: UILabel!
    @IBOutlet weak var product5Label: UILabel!
    @IBOutlet weak var product4Label: UILabel!
    @IBOutlet weak var product3Label: UILabel!
    @IBOutlet weak var product2Label: UILabel!
    @IBOutlet weak var product1Label: UILabel!
    @IBOutlet weak var product6Stepper: UIStepper!
    @IBOutlet weak var product5Stepper: UIStepper!
    @IBOutlet weak var product4Stepper: UIStepper!
    @IBOutlet weak var product3Stepper: UIStepper!
    @IBOutlet weak var product2Stepper: UIStepper!
    @IBOutlet weak var product1Stepper: UIStepper!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // 設定畫面載入後的初始配置
        resetButton(self)
    }

    // MARK: - Action Methods

    @IBAction func countNumber(_ sender: Any) {
        // 更新產品數量
        products[0].quantity = Int(product1Stepper.value)
        products[1].quantity = Int(product2Stepper.value)
        products[2].quantity = Int(product3Stepper.value)
        products[3].quantity = Int(product4Stepper.value)
        products[4].quantity = Int(product5Stepper.value)
        products[5].quantity = Int(product6Stepper.value)

        // 更新產品數量標籤
        product1Label.text = "\(products[0].quantity)"
        product2Label.text = "\(products[1].quantity)"
        product3Label.text = "\(products[2].quantity)"
        product4Label.text = "\(products[3].quantity)"
        product5Label.text = "\(products[4].quantity)"
        product6Label.text = "\(products[5].quantity)"

        // 更新總金額標籤
        totalMoneyLabel.text = "\(totalMoney)"
    }

    // MARK: - Helper Methods

    // 設定產品清單和標籤的初始值
    func setupProducts() {
        products.append(Product(name: "產品1", quantity: 0, price: 980))
        products.append(Product(name: "產品2", quantity: 0, price: 1600))
        products.append(Product(name: "產品3", quantity: 0, price: 1600))
        products.append(Product(name: "產品4", quantity: 0, price: 1050))
        products.append(Product(name: "產品5", quantity: 0, price: 1200))
        products.append(Product(name: "產品6", quantity: 0, price: 1400))

        // 更新產品數量標籤
        product1Label.text = "\(products[0].quantity)"
        product2Label.text = "\(products[1].quantity)"
        product3Label.text = "\(products[2].quantity)"
        product4Label.text = "\(products[3].quantity)"
        product5Label.text = "\(products[4].quantity)"
        product6Label.text = "\(products[5].quantity)"
    }

    // MARK: - Reset Button Action

    @IBAction func resetButton(_ sender: Any) {
        // 重設所有產品數量為 0
        products.forEach { $0.quantity = 0 }

        // 更新數量標籤為 0
        product1Label.text = "0"
        product2Label.text = "0"
        product3Label.text = "0"
        product4Label.text = "0"
        product5Label.text = "0"
        product6Label.text = "0"

        // 重設 stepper 值為 0
        product1Stepper.value = 0
        product2Stepper.value = 0
        product3Stepper.value = 0
        product4Stepper.value = 0
        product5Stepper.value = 0
        product6Stepper.value = 0

        // 更新總金額標籤
        totalMoneyLabel.text = "0"
    }

    // MARK: - Buy Button Action

    @IBAction func buyButtonTapped(_ sender: Any) {
        if totalMoney != 0 {
            showSpendingAlert()
        } else {
            zeroAlert()
        }
    }
    func showSpendingAlert() {
        let alert = UIAlertController(title: "花費金額",
            message: "產品1：\(products[0].quantity * products[0].price )元\n產品2：\(products[1].quantity * products[1].price )元\n產品3：\(products[2].quantity * products[2].price)元\n產品4：\(products[3].quantity * products[3].price)元\n產品5：\(products[4].quantity * products[4].price)元\n產品6：\(products[5].quantity * products[5].price)元\n總金額：\(totalMoney)元",preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "確定", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    func zeroAlert(){
        let alert = UIAlertController(title: "沒有選購商品唷", message: "請至少選購一項商品", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "確定", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

