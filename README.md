# Color Test
When persisting a color from a MapFeature in SwiftData, the color stored renders differently in dark appearance than in light appearance. This Xcode project shows that the Colors are all the same when they originate from the SwiftUI ColorPicker, in light and dark appearance, but are not the same when the original color is from the selected MapFeature. In that case, there is a difference in color that appears to be because the dark mode variation of the color is not applied.

In the two screenshots below, the iPhone 16 Pro Max simulator shows the SwiftData Query Color is different than the original color and the color transformed by te UIColorValueTransformer. The iPhone 16 Pro Max simulator is set to dark appearance while the iPhone 16 Pro simulator is set to light appearance and the three colors are the same.

This readme will be updated once Apple Developer Support provides some insight and any workarounds.

![Color Bug 1](https://github.com/user-attachments/assets/c43742a5-b0d4-40f6-b101-0a99fe0b0df4)

![Color Bug 2](https://github.com/user-attachments/assets/6ad5010e-1242-4446-80aa-a6ad316a3fd2)

