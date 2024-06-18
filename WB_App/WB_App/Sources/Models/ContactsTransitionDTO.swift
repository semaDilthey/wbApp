//
//  ContactsTransitionDTO.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 18.06.2024.
//

import Foundation

struct ContactsTransitionDTO {
    var selectedContact: Contact?
    var pushView: Bool = false
    var hideView : (Bool, Bool) = (false, false)
    
}
