//
//  ViewController.swift
//  reflectColor_gpt
//
//  Created by 森杏菜 on 2024/07/07.
//

import UIKit
import SwiftyJSON
import Alamofire
import RealmSwift


class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let realm = try! Realm()
    var items: [ShoppingItem] = []
    
    //    @IBOutlet var button: UIButton!
    //    @IBOutlet var label: UILabel!
    //    @IBOutlet var field: UITextField!
    //    @IBOutlet var responseText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        items = readItems()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = readItems()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let item: ShoppingItem = items[indexPath.row]
        cell.setCell(title: item.title, price: item.price,isMarked: item.isMarked)
        
        return cell
    }
    
    func readItems() -> [ShoppingItem] {
        return Array(realm.objects(ShoppingItem.self))
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //    var flag : Int = 0
    //    var action: String?
    //    var messageString: String?
    //    var responseString: String?
    //    var dekigoto_raw: String?
    //    var dekigoto_gpt: String?
    //    var good_or_bad: Bool?
    //    var detail_raw: String?
    //    var detail_gpt: String?
    //    var good_action_raw: String?
    //    var good_action_gpt: [String]?
    //    var kadai_raw: String?
    //    var kadai_gpt: String?
    //    var bad_action_raw: String?
    //    var bad_action_gpt: [String]?
    //
    //    @IBAction func buttonTapped(_ sender: UIButton) {
    //        if flag == 0 {
    //            dekigoto_raw = field.text
    //            chatGpt(flag: flag, rawData: dekigoto_raw ?? "")
    //            flag = 1
    //        } else if flag == 1 {
    //            detail_raw = field.text
    //            chatGpt(flag: flag, rawData: detail_raw ?? "")
    //            flag = 2
    //        } else if flag == 2 {
    //            good_action_raw = field.text
    //            chatGpt(flag: flag, rawData: good_action_raw ?? "")
    //        } else if flag == 3 {
    //        kadai_raw = field.text
    //        chatGpt(flag: flag, rawData: kadai_raw ?? "")
    //        } else if flag == 4 {
    //            bad_action_raw = field.text
    //            chatGpt(flag: flag, rawData: bad_action_raw ?? "")
    //        }
    //}
    //
    //
    //func chatGpt(flag: Int,rawData:String){
    //
    //    //        var messageString:String!
    //
    //    if flag == 0{
    //        messageString = "下記の文章と下記の条件を参考にしてください。＃文章\(rawData)＃条件・今日の出来事を10字以内で要約・全体の返答としては、「お話をまとめると、今日は[出来事]が主な出来事だと感じました。正しいですか？」に当てはめて返答するように。"
    //    }
    //    else if flag == 1{
    //
    //
    //    }
    //    else if flag == 2{
    //
    //    }
    //
    //    let headers: HTTPHeaders = [
    //        "Authorization": "Bearer \("")",
    //        "OpenAI-Organization": "org-3gb99V4ZvIh1MIKllYjYuWSn",
    //        "Content-Type": "application/json"
    //    ]
    //
    //    let parameters: Parameters = [
    //        "model": "gpt-3.5-turbo",
    //        "messages": [
    //            ["role": "user", "content": messageString]
    //        ]
    //    ]
    //
    //    AF.request("https://api.openai.com/v1/chat/completions", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
    //        .responseData { response in
    //            switch response.result {
    //            case .success(let data):
    //                do {
    //                    let json = try JSON(data: data)
    //                    if let content = json["choices"][0]["message"]["content"].string {
    //                        self.responseString = content
    //
    //                        if flag == 0{
    //                            //「」の中身抜く関数ここ
    //                            self.dekigoto_gpt = self.responseString
    //                            print(self.dekigoto_gpt)
    //                        }
    //                        else if flag == 1{
    //                            //「」の中身抜く関数ここ
    //                            self.detail_gpt = self.responseString
    //                            print(self.detail_gpt)
    //                        }
    //                        else if flag == 2{
    //                            //「」の中身抜く関数ここ
    //                            self.good_action_gpt = self.responseStringb
    //                            print(self.good_action_gpt)
    //                        }
    //                        else if flag == 3{
    //                            //「」の中身抜く関数ここ
    //                            self.kadai_gpt = self.responseString
    //                            print(self.kadai_gpt)
    //                        }
    //                        else if flag == 4{
    //                            //「」の中身抜く関数ここ
    //                            self.bad_action_gpt = self.responseString
    //                            print(self.bad_action_gpt)
    //                        }
    //                    } else {
    //                        print("Failed to get content as string")
    //                    }
    //                } catch {
    //                    print("Failed to parse JSON: \(error)")
    //                }
    //            case .failure(let error):
    //                print("Error: \(error)")
    //            }
    //        }
    //
    //
    //
    //
    //}
    //
    //}
}
