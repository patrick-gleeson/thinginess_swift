//
//  ThrowawaySpec.swift
//  ThinginessSwift
//
//  Created by Patrick Gleeson on 16/09/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import ThinginessSwift

class ThrowawaySpec: QuickSpec {
    override func spec() {
        describe("initialized vars") {

            it("sets them correctly") {
                let throwaway = Throwaway()

                expect(throwaway.setToFoo) == "foo"
            }
        }
    }
}

