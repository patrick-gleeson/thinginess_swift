//
//  BaseThing.swift
//  Pods
//
//  Created by Patrick Gleeson on 16/09/2016.
//
//

public class BaseThing {
    public init() {
        ThingRegistry.sharedInstance.register(self, with_types: thingTypes())
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
}

