//
//  Cart.swift
//  Shopywood
//
//  Created by CodergirlTM on 24.07.21.
//

import CoreData

@objc(Cart)
class Cart: NSManagedObject {
    @NSManaged var imageUrl: URL!
    @NSManaged var name: String!
    @NSManaged var price: NSNumber!
    @NSManaged var quantity: NSNumber?
}
