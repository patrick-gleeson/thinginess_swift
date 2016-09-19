//
//  ThingRegistry.swift
//  Pods
//
//  Created by Patrick Gleeson on 16/09/2016.
//
//

public class ThingRegistry {
    public static let sharedInstance = ThingRegistry()

    public func objectsOfType(type :String) -> Array<Any> {
        return registry[type] ?? []
    }

    func register(thing: Any, with_types types: Array<String>) {
        types.forEach { ( type : String) -> () in
            if var subregistry = registry[type] {
                subregistry.append(thing)
            } else {
                var subregistry = [thing]
                registry[type] = subregistry
            }
        }
        var foo = "bar"
        foo.capitalizedString
    }

    private var registry = [String:Array<Any>]()
}
