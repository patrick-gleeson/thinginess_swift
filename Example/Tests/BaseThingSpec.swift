import Quick
import Nimble
import ThinginessSwift

class ChildThing : BaseThing {}
class GrandchildThing : BaseThing {}

class BaseThingSpec: QuickSpec {
    override func spec() {
        describe("init") {

            it("adds to appropriate places in the ThingRegistry") {
                let _ = ChildThing()
                let registeredBaseThings = ThingRegistry.sharedInstance.objectsOfType("BaseThing")
                let registeredChildThings = ThingRegistry.sharedInstance.objectsOfType("ChildThing")
                let registeredGrandchildThings = ThingRegistry.sharedInstance.objectsOfType("GrandchildThing")
                expect(registeredBaseThings.count).to(equal(1))
                expect(registeredChildThings.count).to(equal(1))
                expect(registeredGrandchildThings.count).to(equal(0))


            }
        }
    }
}
