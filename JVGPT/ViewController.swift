//
//  ViewController.swift
//  JVGPT
//
//  Created by João Vitor Sousa on 05/04/23.
//

import UIKit
import OpenAISwift

class ViewController: UIViewController {
    
    var openAIModelType: OpenAIModelType = .gpt3(.davinci)
    var token:  OpenAISwift?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        token = OpenAISwift(authToken: API.authToken)
    }
    
    func sendOpenAIRequest(text: String, completion: @escaping (Result<String, OpenAIError>) -> Void) {
        token?.sendCompletion(with: text, model: openAIModelType,completionHandler: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    break
                case .failure(let error):
                    break
                }
            }
        })
    }
}
