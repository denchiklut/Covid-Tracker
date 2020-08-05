//
//  Binding.swift
//  COVID 19
//
//  Created by Александров Денис Александрович on 8/5/20.
//  Copyright © 2020 Александров Денис Александрович. All rights reserved.
//

import SwiftUI

public extension Binding where Value: CaseIterable & Equatable {
  var caseIndex: Binding<Value.AllCases.Index> {
    Binding<Value.AllCases.Index>(
      get: { Value.allCases.firstIndex(of: self.wrappedValue)! },
      set: { self.wrappedValue = Value.allCases[$0] }
    )
  }
}

