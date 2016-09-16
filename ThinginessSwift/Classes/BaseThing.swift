//
//  BaseThing.swift
//  Pods
//
//  Created by Patrick Gleeson on 16/09/2016.
//
//

public class BaseThing {
    public init(attributes: [String: String]) {
        self.attributes = attributes ?? [String:String]()

        ThingRegistry.sharedInstance.register(self, with_types: thingTypes())
    }

    public convenience init() {
        self.init(attributes: [:])
    }

    public func attribute(attribute_name: String) -> String? {
        return attributes[attribute_name]
    }

    public func thingTypes() -> Array<String> {
        return thingTypesFromMirror(Mirror(reflecting: self))
    }

    private func thingTypesFromMirror(mirror: Mirror) -> Array<String> {
        let typeString = String(mirror.subjectType)
        if typeString == "BaseThing" {
            return [typeString]
        } else {
            return [typeString] + thingTypesFromMirror(mirror.superclassMirror()!)
        }
    }

    private var attributes : [String: String]
}
