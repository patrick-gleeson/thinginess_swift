import Quick
import Nimble
import ThinginessSwift

class ThingRegistrySpec: QuickSpec {
    class ChildThing : BaseThing {}
    class GrandchildThing : BaseThing {}
    
    override func spec() {
        describe("#thingsOfType") {

            it("adds to appropriate places in the ThingRegistry") {
                let _ = ChildThing()
                let registeredBaseThings = ThingRegistry.sharedInstance.thingsOfType("BaseThing")
                let registeredChildThings = ThingRegistry.sharedInstance.thingsOfType("ChildThing")
                let registeredGrandchildThings = ThingRegistry.sharedInstance.thingsOfType("GrandchildThing")
                expect(registeredBaseThings.count).to(equal(1))
                expect(registeredChildThings.count).to(equal(1))
                expect(registeredGrandchildThings.count).to(equal(0))
            }
        }
    }
}
