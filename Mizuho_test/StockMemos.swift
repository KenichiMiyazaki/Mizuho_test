//
//  StockMemos.swift
//  Mizuho_test
//
//  Created by Kenichi Miyazaki on 2017/03/06.
//  Copyright © 2017年 Kenichi Miyazaki. All rights reserved.
//


import UIKit
import Alamofire
internal var ans1 :String = "default"
internal var keepAlive = true
class StockMemos: NSObject {
    
    // 保存ボタンが押されたときに呼ばれるメソッドを定義
    class func postMemo(_ memo: Memo) -> String {
        
        let params: [String:AnyObject] = [
            "text1": memo.text1 as AnyObject,
            "text2": memo.text2 as AnyObject
        ]
        
        
        // HTTP通信
        let urlString = "http://localhost:3000/api/memos"
        
        Alamofire.request(urlString, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON {(response:DataResponse<Any>) in
            
            switch response.result {
            case .success(_):
                if let jsonResult = response.result.value as? [String: Any] {
                    let ans1 = jsonResult["answer"] as! String
                    print(ans1)
                    keepAlive = false
                }
                break
            case .failure(_):
                print("There is an error")
                break
            }
        }
        
        let runLoop = RunLoop.current
        while keepAlive &&
            runLoop.run(mode: RunLoopMode.defaultRunLoopMode, before: Date(timeIntervalSinceNow: 0.1)) {
                // 0.1秒毎の処理なので、処理が止まらない
        }
        print(ans1)
        return ans1
    }
    
    
}

