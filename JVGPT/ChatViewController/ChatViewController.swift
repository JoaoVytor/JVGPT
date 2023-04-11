//
//  ViewController.swift
//  JVGPT
//
//  Created by João Vitor Sousa on 05/04/23.
//

import UIKit
import OpenAISwift

class ChatViewController: UIViewController {
    
    let openAIModelType: OpenAIModelType = .gpt3(.davinci)
    var token:  OpenAISwift?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        token = OpenAISwift(authToken: API.authToken)
        sendOpenAIRequest(text: "Quando a linguagem swift foi criada?") { result in
            switch result {
            case .success(let sucess):
                print(sucess)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    func sendOpenAIRequest(text: String, completion: @escaping (Result<String, OpenAIError>) -> Void) {
        token?.sendCompletion(with: text, model: openAIModelType, maxTokens: 4000, completionHandler: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    guard let text = model.choices?.first?.text else {
                        completion(.failure(.missingChoiceText))
                        return
                    }
                    completion(.success(text))
                case .failure(let error):
                    completion(.failure(.apiError(error)))
                }
            }
        })
    }
}
