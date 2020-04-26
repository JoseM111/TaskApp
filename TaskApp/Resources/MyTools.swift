//
// Created by Jose Martinez on 4/24/20.
// Copyright (c) 2020 ©De-Papel. All rights reserved.
//

import Foundation

extension Date {

    /**
     Sets Formatting for out dates. Returns a String
     ## Important Notes ##
     1. This extends a Date; so it is usable on all Date objects
     2. Currently Set to medium Date length
     */
    func dateRightNow() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}