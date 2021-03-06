//
//  TransitionModel.swift
//  RxMemo
//
//  Created by Dustin on 2021/02/19.
//

import Foundation


enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}

