//
//  AlmofireUtility.swift
//  MasterProject
//
//  Created by UTHOS Ltd. on 09/06/18.
//  Copyright © 2018 UTHOS Ltd. All rights reserved.
//

import UIKit

protocol AlmofireUtilityDelegate:NSObjectProtocol {
    
    func afmofireSucess(almofire:AlmofireUtility , dicsResponse:NSDictionary)
    func afmofireFail(almofire:AlmofireUtility, error:NSError)
}

class AlmofireUtility: NSObject {
    
    public var returnResponse: ((String?) -> ())?
    
    weak var delegateAlmo:AlmofireUtilityDelegate? = nil
    func almoRequest(strUrl:String , method:HTTPMethod , dictParam:NSDictionary ){
        
        request(strUrl, method: method, parameters: dictParam as? Parameters, encoding: URLEncoding.default, headers: nil).response { (response) in
            
            print(response.data as Any)
            
            if response.error != nil {
                if let _ = self.delegateAlmo {
                    self.delegateAlmo?.afmofireFail(almofire: self, error: response.error! as NSError)
                }
                return
            }else{
                do{
                    let jsondata = try JSONSerialization .jsonObject(with: response.data!, options: .mutableContainers) as? NSDictionary
                    
                    if let _ = self.delegateAlmo {
                        self.delegateAlmo?.afmofireSucess(almofire: self, dicsResponse: jsondata!)
                    }
                }catch{
                    if let _ = self.delegateAlmo {
                        if response.error != nil {
                            self.delegateAlmo?.afmofireFail(almofire: self, error: response.error! as NSError)
                        }else{
                            self.delegateAlmo?.afmofireFail(almofire: self, error: error as NSError)
                        }
                    }
                    return
                }
            }
        }
    }
    func updateDeviceToken()
       {
           /*
           user_device
           
           Params :
           method
           udid
           "method": "set_udid",
           "udid": "5456654d-456464-45656-df4df54d"
    */
           
//           if let deviceToken = Defaults(key: DefaultsKeys.USER_DEFAULT_UDID) as? String {
//
//               if deviceToken.count > 0 {
//                   let dict = NSMutableDictionary()
//                   dict["method"] = "set_udid"
//                   dict["udid"] = deviceToken
//                print(dict)
//                   ContactWithServerForResponse(baseUrl: getBaseURL(strName: "user_device"), dict: dict, header: GetHeaderWithAuthor() as! HTTPHeaders) { (dicsResponse) in
//
//                       if dicsResponse != nil {
//                           print(dicsResponse!)
//
//                       } else {
//                       }
//                   }
//               }
//           }
       }

    func almoRequest(strUrl:String , method:HTTPMethod , dictParam:NSDictionary , header:HTTPHeaders ){
        
        print(strUrl)
        print(dictParam)
        print(header)
        request(strUrl, method: method, parameters: dictParam as? Parameters, encoding: URLEncoding.default, headers: header).response { (response) in

            print(response.data as Any)
            
            if response.error != nil {
                if let _ = self.delegateAlmo {
                    self.delegateAlmo?.afmofireFail(almofire: self, error: response.error! as NSError)
                }
                return
            }else{
                do{
                    let jsondata = try JSONSerialization .jsonObject(with: response.data!, options: .mutableContainers) as? NSDictionary
                    
                    if let _ = self.delegateAlmo {
                        self.delegateAlmo?.afmofireSucess(almofire: self, dicsResponse: jsondata!)
                    }
                }catch{
                    if let _ = self.delegateAlmo {
                        if response.error != nil {
                            self.delegateAlmo?.afmofireFail(almofire: self, error: response.error! as NSError)
                        }else{
                            self.delegateAlmo?.afmofireFail(almofire: self, error: error as NSError)
                        }
                    }
                    return
                }
            }
        }
    }
    
    
    func almoRequest1(strUrl:String , method:HTTPMethod , dictParam:[String:Any] , header:HTTPHeaders ){       
        
        request(strUrl, method: method, parameters: dictParam , encoding: URLEncoding.default, headers: header).response { (response) in
            
            print(response.data as Any)
            
            if response.error != nil {
                if let _ = self.delegateAlmo {
                    self.delegateAlmo?.afmofireFail(almofire: self, error: response.error! as NSError)
                }
                return
            }else{
                do{
                    let jsondata = try JSONSerialization .jsonObject(with: response.data!, options: .mutableContainers) as? NSDictionary
                    
                    if let _ = self.delegateAlmo {
                        self.delegateAlmo?.afmofireSucess(almofire: self, dicsResponse: jsondata!)
                    }
                }catch{
                    if let _ = self.delegateAlmo {
                        if response.error != nil {
                            self.delegateAlmo?.afmofireFail(almofire: self, error: response.error! as NSError)
                        }else{
                            self.delegateAlmo?.afmofireFail(almofire: self, error: error as NSError)
                        }
                    }
                    return
                }
            }
        }
    }
    
    func almoRequestWithDict(strUrl:String , method:HTTPMethod , dictParam:NSDictionary , isHeader:Bool){
        var header : HTTPHeaders!
        if isHeader {
            header = GetHeaderWithAuthor() as? [String : String]
        } else {
            header = GetHeader()
        }
        
        
        let dict = NSMutableDictionary()
        dict.addEntries(from: dictParam as! [AnyHashable : Any] )
        
        print( dict)
        
        request(strUrl, method: method, parameters: dict as? Parameters , encoding: URLEncoding.default, headers: header).response { (response) in
            
          //  printLog(data: response.data as Any)
            print(String(data: response.data! , encoding: .utf8))
            if response.error != nil {
                if let _ = self.delegateAlmo {
                    self.delegateAlmo?.afmofireFail(almofire: self, error: response.error! as NSError)
                }
                return
            }else{
                do{
                    let jsondata = try JSONSerialization .jsonObject(with: response.data!, options: .mutableContainers) as? NSDictionary
                    
                    if let _ = self.delegateAlmo {
                        self.delegateAlmo?.afmofireSucess(almofire: self, dicsResponse: jsondata!)
                    }
                }catch{
                    
                    if let _ = self.delegateAlmo {
                        if response.error != nil {
                            self.delegateAlmo?.afmofireFail(almofire: self, error: response.error! as NSError)
                        }else{
                            self.delegateAlmo?.afmofireFail(almofire: self, error: error as NSError)
                        }
                    }
                    return
                }
            }
        }
    }
}

// MARK: - API CALLING FUNCTION

func ContactWithServerForResponse(baseUrl:String,dict:NSDictionary , header:HTTPHeaders,compilation: @escaping (NSDictionary?) -> Void) {
   
    let dictParams = NSMutableDictionary()
    dictParams.addEntries(from: dict as! [AnyHashable : Any] )
       
    request(baseUrl, method: .post, parameters: dictParams as? Parameters, encoding: URLEncoding.default, headers:header).response { (response) in
        if response.error != nil {
            print(response.error!)
            compilation(nil)
        }else{
            do{
                if let jsondata = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as? NSDictionary {
                    compilation(jsondata)
                }
            }catch {
                print(error)
                compilation(nil)
            }
        }
    }
}

func ContactWithServerForResponse1(baseUrl:String, method:HTTPMethod, dict:NSDictionary , header:HTTPHeaders,compilation: @escaping (NSDictionary?) -> Void) {
   
    let dictParams = NSMutableDictionary()
    dictParams.addEntries(from: dict as! [AnyHashable : Any] )
       
    request(baseUrl, method: method , parameters: dictParams as? Parameters, encoding: URLEncoding.default, headers:header).response { (response) in
        if response.error != nil {
            print(response.error!)
            compilation(nil)
        }else{
            do{
                if let jsondata = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as? NSDictionary {
                    compilation(jsondata)
                }
            }catch {
                print(error)
                compilation(nil)
            }
        }
    }
}
