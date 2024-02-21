# FlickPick

![image](https://github.com/weitzel926/FlickPic/assets/3514194/75e50148-9611-4d0f-a40c-67cb516cc0c2)

FlickPick is a sample SwiftUI app meant as a light demonstration of SwiftUI skills.  It is a continuation of a text home interview I was given.  This uses a Flickr API to query the last twenty or so images tagged with a given string and displays them in a "photo picker" grid.  When the customer taps on a photo, a detail page appears with the image and some details about the image.  Please consider this a work in progress. 

Things to note:

- A remote call is made every time the user modifies the text field.  This is to show a concurrency scheme featuring task cancellation.  If this were done in reality with user experience in mind, a smarter mechanism could be used to limit the number of network calls.  For example, we could wait until the user has entered at least three characters and/or add a timer so we aren't making so many requests at once.
- Images on the "photo picker" page are square, but feature an aspect fill to preserve the aspect ratio of the original image.  On the detail page, they are shown in their actual aspect ratio.
- The description is placed on a modal sheet.  The description comes in via Flickr as an HTML string.  I tried a few open source projects that can convert an html string to an attributed string.  The ones I found were lossy enough I preferred displaying them as a web view.  I put this web view in a modal sheet so scrolling isn't an issue with the rest of the details UI.  It would be my preference to handle this with an attributed string.
- Please note that the network call itself is not (yet) unit tested.
- This has some voice over support for accessibility, but it is not complete.  Note that tapping on a photo in the picker will read out the title of the photo. 
