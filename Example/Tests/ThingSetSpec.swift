import Quick
import Nimble
import ThinginessSwift

class ThingSetSpec: QuickSpec {
    override func spec() {
        describe("#forEach") {

            it("iterates through each thing") {
                let thingSet = ThingSet(things: [BaseThing(), BaseThing()])
                var iterations = 0
                thingSet.forEach { ( thing: BaseThing) -> () in
                    iterations += 1
                }
                expect(iterations).to(equal(2))
            }
        }

        describe("#count") {
            it("counts the number of things") {
                let thingSet = ThingSet(things: [BaseThing(), BaseThing()])
                expect(thingSet.count).to(equal(2))
            }
        }

        describe("#matching") {
            it("filters to only matching things") {
                let thingSet = ThingSet(things: [BaseThing(attributes: ["foo":"bar"]), BaseThing(attributes: ["foo":"car"]), BaseThing()])
                let result = thingSet.matching(["foo":"bar"])
                expect(result.count).to(equal(1))
            }
        }

        describe("#updateAll") {
            it("sets attributes as passed in") {
                let thingSet = ThingSet(things: [BaseThing(attributes: ["foo":"bar"]), BaseThing(attributes: ["foo":"car"]), BaseThing()])
                thingSet.updateAll(["foo":"bar"])
                let result = thingSet.matching(["foo":"bar"])
                expect(result.count).to(equal(3))
            }
        }
    }
}
