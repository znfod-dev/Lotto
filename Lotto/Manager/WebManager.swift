//
//  WebManager.swift
//  Lotto
//
//  Created by JongHyun Park on 2020/04/26.
//  Copyright © 2020 Znfod. All rights reserved.
//

import UIKit
import Alamofire
import SwiftSoup

class WebManager: NSObject {
    static let shared = WebManager()
    
    //http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=819
    private var manager = Session.init(configuration: URLSessionConfiguration.af.default,
                                       delegate: SessionDelegate(),
                                       rootQueue: DispatchQueue(label: "org.alamofire.session.rootQueue"),
                                       startRequestsImmediately: true,
                                       serverTrustManager: ServerTrustManager.init(allHostsMustBeEvaluated: false,
                                                                                   evaluators: ["www.nlotto.co.kr" : DisabledEvaluator()] )
    )
    
    override init() {
        super.init()
        
    }
    
    func getLottoNumber(drwNo:Int,
                        success: @escaping(_ success: Bool,_ drw: DRW?)-> Void,
                        fail: @escaping (_ error: String)-> Void) {
        let url = "http://www.nlotto.co.kr/common.do?method=getLottoNumber"
        let parameters = [
            "drwNo": drwNo] as [String : Any]
        
        manager.request(url, method: .get, parameters: parameters).responseJSON { response in
            if response.error == nil {
                print("error == nil")
                let dictionary:Dictionary<String, Any> = self.convertToDictionary(data: response.data!)
                
                if let returnValue = dictionary["returnValue"] {
                    if returnValue as! String == "success" {
                        let drw = DRW.init(dictionary: dictionary)
                        success(true, drw)
                    }else {
                        success(false, nil)
                    }
                }else {
                    success(false, nil)
                }
            }else {
                print(response.description)
                fail(response.description)
            }
        }
        
    }
    
    // 당첨 확인
    func getLottoResult(url:String,
                        success: @escaping(_ results: Array<Result>,_ drwNo: Int?)-> Void,
                        fail: @escaping (_ error: String)-> Void){
        let url = "https://m.dhlottery.co.kr/qr.do?method=winQr&v=0908m040708121923m041315192331m021719243642m091124333945m0919203436421288760331"
        
        AF.request(url, method: .get).responseJSON { response in
            guard let data = response.data else { return }
            let str = String(data: data, encoding: String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(0x0422)))
            do {
                
                let doc: Document = try SwiftSoup.parse(str!)
                
                let drw = try doc.getElementsByClass("key_clr1").text().filter {$0.isNumber}
                print("drw : \(drw)")
                // let date = try doc.getElementsByClass("date")
                let trs:Elements = try doc.select("tr")
                
                var results = Array<Result>()
                for tr in trs {
                    var arr = Array<String>()
                    arr.append(try tr.getElementsByClass("result").text())
                    let clrs = try tr.getElementsByClass("clr")
                    for clr in clrs {
                        arr.append(try clr.text())
                    }
                    let result = Result.init(arr)
                    results.append(result)
                }
                success(results,
                        Int(drw))
            } catch Exception.Error(let type, let message) {
                print("type : \(type), message : \(message)")
                fail(message)
            } catch {
                fail("Error")
            }
        }
    }
    
    // 하나만 오는거 반환
    func convertToDictionary(data:Data) -> Dictionary<String, Any>! {
        // print("convertToDictionary")
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]
            return json
        } catch {
            print("Something went wrong")
        }
        return nil
    }
    
}
