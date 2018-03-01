# Tutorial for AppStudio/QT Creator for Map Customization and Changing Basemaps
This is an updated tutorial on how to create an app using Esri AppStudio Qt. For the demo we will create an app with 4 maps within the same frame and change the basemaps.

## Step 1: 
Download and install the desktop version of Esri AppStudio. It should include Qt Creator.
[website](https://doc.arcgis.com/en/appstudio/download/)

### Step 2:
Open AppSudio for desktop.

### Step 3:
Click “New App” in the upper left.
![image](https://user-images.githubusercontent.com/35122230/36870473-11f1e2a0-1d54-11e8-9209-3c23c65a9427.png)

### Step 4:
Click on “Hello World (RunTime). Then click “Create”
![image](https://user-images.githubusercontent.com/35122230/36870513-3598d204-1d54-11e8-8ad0-d04dfe801ee6.png)

### Step 5:
Now we should change the title of the map. Click on “Hello World”, then click the pen in the upper right hand corner. Change the Title to whatever you want to call it. Then click on the check mark to save the title. 
![image](https://user-images.githubusercontent.com/35122230/36870622-9699b0dc-1d54-11e8-9e0a-c178ecda247f.png)
![image](https://user-images.githubusercontent.com/35122230/36870649-a1c598e0-1d54-11e8-8dc8-b8864da747cc.png)

### Step 6:
Double click the app to open it. It should look something like this.
![image](https://user-images.githubusercontent.com/35122230/36870669-b2044274-1d54-11e8-854b-3270fc350279.png)

### Step 7:
Now we want to change the base code for the Hello World app (if you changed the name in the previous step use that app) to create 4 maps within app frame. Click on edit in the right hand side. This will open Qt Creator.
![image](https://user-images.githubusercontent.com/35122230/36870689-c2aa3a3e-1d54-11e8-8833-8f91028306d2.png)

### Step 8:
Within Qt select the MyApp QML. Within the code scroll down and find where it says MapView. This is the extent that creates the map within the application. This is what we need to manipulate in order to create more map frames. Create a new line after line 160. Copy all of the text from lines 68-160 and paste into this new line. Ignore the red lines off to the side. Once you save the app these will turn to green. 
![image](https://user-images.githubusercontent.com/35122230/36870719-d2af2912-1d54-11e8-8786-3d0854fb8c13.png)

### Step 9:
In order for this to run you must change the id of all the code in the MapView you just pasted to make it unique. These are lines 162, 183, 187, 199, 208, and 230. I added a 2 afterwards. Save your app. Your code should look like this when you have finished. 
![image](https://user-images.githubusercontent.com/35122230/36870735-e1b4c19c-1d54-11e8-867e-905e89a05745.png)
![image](https://user-images.githubusercontent.com/35122230/36870745-ea6b167e-1d54-11e8-9bbd-64390bdaea5f.png)

### Step 10:
Repeat steps 8 and 9 so that you now have 4 MapViews within the code that each have their own unique ids. Your code should be approximately 440 lines long. Don’t forget to change all the id’s!

### Step 11:
If you ran the app right now it would look exactly the same. What we need to do now is split the screen so that it will display all 4 maps. Within the first MapView find the part where it says anchors, comment out line 75 and 77. Then add width: parent.width * 0.5 and height: parent.height * 0.5 after line 78. This will put the fame in the top left corner. Your code should now look like this. Note your lines might be off by a couple depending on how you pasted the code.
![image](https://user-images.githubusercontent.com/35122230/36870780-01da5914-1d55-11e8-8e82-1c3b3d57d790.png)

### Step 12:
Repeat step 11 within the second MyView with a couple of changes. This time instead of commenting out lines 75 and 77 comment out lines 170 and 171.  Then add width: Then add width: parent.width * 0.5 and height: parent.height * 0.5 after line 173. This will put this frame in the bottom left corner. Your code should look like this. Note your lines might be off by a couple depending on how you pasted the code.
![image](https://user-images.githubusercontent.com/35122230/36870798-0f6ed5aa-1d55-11e8-92b2-1a6b35020be5.png)

### Step 13:
Repeat step 11 within the third MyView with a couple of changes. This time instead of commenting out lines 75 and 77 comment out lines 264 and 267.  Then add width: Then add width: parent.width * 0.5 and height: parent.height * 0.5 after line 268. This will put this frame in the top right corner. Your code should look like this. Note your lines might be off by a couple depending on how you pasted the code.
![image](https://user-images.githubusercontent.com/35122230/36870824-22841bc8-1d55-11e8-912b-00587d042c32.png)

### Step 14:
Repeat step 11 within the fourth MyView with a couple of changes. This time instead of commenting out lines 75 and 77 comment out lines 359 and 361.  Then add width: Then add width: parent.width * 0.5 and height: parent.height * 0.5 after line 363. This will put this frame in the bottom right corner. Your code should look like this. Note your lines might be off by a couple depending on how you pasted the code.
![image](https://user-images.githubusercontent.com/35122230/36870852-3a83cf48-1d55-11e8-80d6-db4c2e60063e.png)

### Step 15:
Make sure to save your changes. Now open your app and it should look like this.
![image](https://user-images.githubusercontent.com/35122230/36870877-48dcd83c-1d55-11e8-9086-90916cb9356f.png)

### Step 16:
We will now change the basemap of each map. Go to following link to see the basemap options. They are located in the left side pane. [website](https://developers.arcgis.com/qt/latest/qml/api-reference/qml-esri-arcgisruntime-viewpointextent.html)  
![image](https://user-images.githubusercontent.com/35122230/36870900-588c12d4-1d55-11e8-97e1-7a26b97ce4ab.png)

### Step 17:
Copy the title of the basemap you wish to you and copy it into the code of whichever map you wish to change. They should be lines 94, 189, 284, and 379. 
![image](https://user-images.githubusercontent.com/35122230/36870944-706271f0-1d55-11e8-8602-1e75abbcab8b.png)
![image](https://user-images.githubusercontent.com/35122230/36870956-7949a824-1d55-11e8-965c-1c88a32f0766.png)

### Step 18:
Save the QML!

### Step 19:
Open the app within the AppStudio. Now you should have 4 maps each with a different basemap.
![image](https://user-images.githubusercontent.com/35122230/36870989-8e69f1fa-1d55-11e8-8420-2cc494777805.png)

### Step 20:
Make sure to upload and share your app when you are finished! Make sure you share it as well, either choose the organization or make it public.
![image](https://user-images.githubusercontent.com/35122230/36871012-9f1e5cd4-1d55-11e8-9f1a-2904ce672cf8.png)

Within the new code linking the extents does not work. I have tried to find a solution online but nothing works. After speaking with a few classmates they have been having the same problem. Not sure how to fix this.


