# Color Test
When persisting a color from a MapFeature in SwiftData, the color stored renders differently in dark appearance than in light appearance. This Xcode project shows that the Colors are all the same when they originate from the SwiftUI ColorPicker, in light and dark appearance, but are not the same when the original color originates from the selected MapFeature. In that case, there is a difference in color that appears to be because the dark mode variation of the color is not applied.

In the two screenshots below, the iPhone 16 Pro Max simulator shows the SwiftData Query Color is different than the original color and the color transformed by te UIColorValueTransformer. The iPhone 16 Pro Max simulator is set to dark appearance while the iPhone 16 Pro simulator is set to light appearance and the three colors are the same.

This readme will be updated once Apple Developer Support provides some insight and any workarounds.

In the following screenshot below, the background color of the MapFeature representing Josura Tree National Park, is correctly shown in the light appearance on the iPhone 16 Pro simulator, but not on the iPhone 16 Pro Max simulator. The original color and transformed colors are correct but the color retrieved from SwiftData is the light appearance variation and not the dark appearance variation. 

![Color Bug 1](https://github.com/user-attachments/assets/c43742a5-b0d4-40f6-b101-0a99fe0b0df4)

Interestingly, the background color used for the MapFeature representing Mount Whitney, shown on the left of the screenshot below, does not appear in any of the three color rectangles. In light appearance however, as with the previous example, the background color is correctly displayed in all three.

![Color Bug 2](https://github.com/user-attachments/assets/6ad5010e-1242-4446-80aa-a6ad316a3fd2)

## Update

Ed Ford from Apple responded to the [forum post](https://forums.developer.apple.com/forums/thread/768918) suggesting that instead of storing the SwiftUI Color as one variable within the SwiftData model, it should instead be stored as separate values for its components. I have updated the code in this repository to additionally store the components as CGFloat values and recreate the color accordingly. The original issue however, is still present. When storing a Color that originates from the MapKit MapFeature.backgroundColor, it appears to be restored as the light appearance variation of the color rather than the dark appearance variation. Ideally, we should be able to store one Color and have the system adjust it based on whether the user has the light or dark appearance selected.

This is illustrated below, where the MapFeature representing Joshua Tree National Park is selected. The original color and transformed color are the same as the MapFeature.backgroundColor, while the restored colors from SwiftData are the light appearance variation.

![Color Bug 4](https://github.com/user-attachments/assets/913bb184-b29b-447b-b608-101a1245a5ba)

![Color Bug 5](https://github.com/user-attachments/assets/b48aecf5-97c7-4386-8aa6-ee38f61ea25a)
