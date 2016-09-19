import Quick
import Nimble
import ThinginessSwift

class BaseThingSpec: QuickSpec {
    override func spec() {
        describe("#attribute") {

            it("returns attributes set on init") {
                let thing = BaseThing(attributes: ["foo":"bar"])
                expect(thing.attribute("foo")).to(equal("bar"))
            }

            it("returns nil for an unknown attribute") {
                let thing = BaseThing(attributes: ["foo":"bar"])
                expect(thing.attribute("boo")).to(beNil())
            }
        }

        describe("#update") {
            it("sets new attributes as provided") {
                let thing = BaseThing()
                thing.update(["foo": "bar"])
                expect(thing.attribute("foo")).to(equal("bar"))
            }

            it("overwrites existing attributes") {
                let thing = BaseThing(attributes: ["foo": "bar"])
                thing.update(["foo": "far"])
                expect(thing.attribute("foo")).to(equal("far"))
            }
        }
    }
}
