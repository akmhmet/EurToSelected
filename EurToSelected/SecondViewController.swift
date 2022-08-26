//
//  SecondViewController.swift
//  exampleProject
//
//  Created by Mehmet Ak on 13.08.2022.
//

import UIKit

class   SecondViewController: UIViewController {
    @IBOutlet weak var moneyLabel: UILabel!
    var amount = 0.0
    var currencyUnit = ""
    var money = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        urlSession()
    }
     func urlSession(){
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=4a990ae1cc0ef5a920e4c7e9eeb1123c")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response , error) in
            if error != nil {
                self.generalError()
            } else {
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [ String : Any ] {
                                
                                if let cad = rates[self.currencyUnit] as? Double {
                                    print(self.amount)
                                    self.money = self.amount * cad
                                    self.moneyLabel.text = String(self.money)
                                }
                            }
                        }
                    } catch {
                        print("error")
                    }
                }
            }
        }
        task.resume()
    }
    private func generalError(){
        let alert = UIAlertController(title: "Error" ,
                                      message: "Hata",
                                      preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK",
                                     style: UIAlertAction.Style.default ,
                                     handler: nil)
        alert.addAction(okButton)
        self.present(alert , animated: true , completion: nil)
        print("hata")
    }
}
