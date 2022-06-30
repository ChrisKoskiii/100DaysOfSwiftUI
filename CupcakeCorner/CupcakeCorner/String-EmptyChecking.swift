//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Christopher Koski on 6/25/22.
//

import Foundation

extension String {
  var isReallyEmpty: Bool {
    self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }
}
