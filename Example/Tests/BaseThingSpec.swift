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
    }
}
