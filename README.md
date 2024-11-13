# Color Test
When persisting a color from a MapFeature in SwiftData, the color stored renders differently in dark appearance than in light appearance. This Xcode project shows that the Colors are all the same when they originate from the SwiftUI ColorPicker, in light and dark appearance, but are not the same when the original color is from the selected MapFeature. In that case, there is a difference in color that appears to be because the dark mode variation of the color is not applied.

In the two screenshots below, the iPhone 16 Pro Max simulator shows the SwiftData Query Color is different than the original color and the color transformed by te UIColorValueTransformer. The iPhone 16 Pro Max simulator is set to dark appearance while the iPhone 16 Pro simulator is set to light appearance and the three colors are the same.

This readme will be updated once Apple Developer Support provides some insight and any workarounds.

In the following screenshot below, the background color of the MapFeature representing Josura Tree National Park, is correctly shown in the light appearance on the iPhone 16 Pro simulator, but not on the iPhone 16 Pro Max simulator. The original color and transformed colors are correct but the color retrieved from SwiftData is the light appearance variation and not the dark appearance variation. 

![Color Bug 1](https://github.com/user-attachments/assets/c43742a5-b0d4-40f6-b101-0a99fe0b0df4)

Interestingly, the background color used for the MapFeature representing Mount Whitney, shown on the left of the screenshot below, does not appear in any of the three color rectangles. In light appearance however, as with the previous example, the background color is correctly displayed in all three.

![Color Bug 2](https://github.com/user-attachments/assets/6ad5010e-1242-4446-80aa-a6ad316a3fd2)

