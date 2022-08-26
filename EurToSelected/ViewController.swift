//
//  ViewController.swift
//  exampleProject
//
//  Created by Mehmet Ak on 12.08.2022.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var messageTextfield: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    var pickerData = ["BMD","BTC", "CAD", "USD", "TRY"]
    var amount = 0.0
    var currencyUnit = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        messageText()
        self.picker.delegate = self
        self.picker.dataSource = self
        currencyUnit = pickerData[0]
    }
    @IBAction func secondPageOpen(_ sender: Any) {let secondPage = self.storyboard?.instantiateViewController(withIdentifier: "secondPage"
    )
        valueControl()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondPage" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.amount = amount
            destinationVC.currencyUnit = currencyUnit
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencyUnit = pickerData[row]
    }
    private func valueControl(){
        if amountText.text != "" {
            amount = Double(amountText.text!)!
            performSegue(withIdentifier: "secondPage", sender: nil)
        }
        else
        {
            print("hata")
            return
        }
    }
    private func moneyControl(){
        if amountText.text != "" {
            amount = Double(amountText.text!)!
        }
        else
        {
            print("hata")
            return
        }
    }
    private func messageText(){
        messageTextfield.text = "Dönüştürmek İstediğiniz Para Birimini Seçiniz:"
        amountLabel.text = "Miktar Giriniz:"
    }
}
