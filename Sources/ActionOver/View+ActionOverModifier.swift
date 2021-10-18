//
//  View+ActionOverModifier.swift
//  
//
//  Created by Andrea Miotto on 19/4/20.
//

import SwiftUI

extension View {
    /**
     Presents an **Action Over**. It will be an **Action Sheet** on *iPhone* and a **Popover** on *iPad and Mac*.
     - parameter presented: This should be set to true when the Action Over has to be displayed.
     - parameter title: The title of the Action Over.
     - parameter message:The message of the action Over.
     - parameter buttons: An array of ActionOverButton that will be rendered in the proper format according the displayed menu type.
     Default is *true*.
     - parameter ipadAndMacConfiguration: The configuration that helpd the menu to position itself on iPad and Mac.
     */
    public func actionOver(
        presented: Binding<Bool>,
        title: ActionOverTitle,
        message: String?,
        buttons: [ActionOverButton],
        ipadAndMacConfiguration: IpadAndMacConfiguration? = nil
    ) -> some View {
        return self.modifier(
            ActionOver(
                presented: presented,
                title: title,
                message: message,
                buttons: buttons,
                ipadAndMacConfiguration: ipadAndMacConfiguration
            )
        )
    }
    
}
