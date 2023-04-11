//
//  ServiceManager.swift
//  JVGPT
//
//  Created by João Vitor Sousa on 11/04/23.
//

import UIKit
import OpenAISwift

enum OpenAIError: Error {
    case missingChoiceText
    case apiError(Error)
}

class ServiceManager {
    let openAIModelType: OpenAIModelType = .gpt3(.davinci)
    let token:  OpenAISwift = OpenAISwift(authToken: API.authToken)
}
