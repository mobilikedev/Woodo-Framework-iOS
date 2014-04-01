Woodo Framework (v1.4.0)
==================================


Requirements
----------------------------------

- Minimum deployment target

  - iOS 6.0

- Auto Reference Counting (ARC)

  - Yes, it requires ARC.

- Frameworks

  - As of "-ObjC" flag must be defined, no need to link additional binary libraries (frameworks)



Installation
----------------------------------

### Drag and drop

  1. Drag "Woodo.framework" into "Frameworks" folder. 
     If folder is not visible at the left side of XCode window, you could reveal navigation bar with (command + shift + j) keyboard shortcut and find it under your project. A dialog for file adding options will appear


      ![Alt text](/ReadmeAssets/DragAndDrop/dragframework.png "Drag & drop Woodo.framework")

      ![Alt text](/ReadmeAssets/DragAndDrop/dragsetup.png "File adding options setup dialog")


      . On dialog;

        * Create groups for any added folders and

          ![Alt text](/ReadmeAssets/DragAndDrop/dragsetupfolders.png "Select 'Create groups for any added folders and'")



        * "YourProjectName" at "Add to targets" section.

          ![Alt text](/ReadmeAssets/DragAndDrop/dragsetuptarget.png "Select <YourProjectName> at "Add to targets" section.")


          must be selected.

          If cloned Woodo's git repository, it is recommended, but not mandatory, to un-check (de-select) "Copy items into destination group's folder (if needed)", as keeping repository up-to-date would be much more easier.

  2. Now, you have to add 'Other Linker Flags'. Click project navigator icon ![Alt text](/ReadmeAssets/Common/iconnavigator.png "Navigator icon") at upper-left corner (below run button)

    ! If unable to see project navigator, navigator might be closed. You could reveal navigation bar with (command + shift + j) keyboard shortcut.

  3. Select your project from project navigator

    ![Alt text](/ReadmeAssets/Common/selectproject.png "Select project")

  4. Select project target

    ![Alt text](/ReadmeAssets/Common/selecttarget.png "Select target")

  5. Select "Build settings" tab

     ![Alt text](/ReadmeAssets/Common/selectbuildsettings.png "Select 'Build Settings'")

  6. Search for "Other Linker Flags"

    ![Alt text](/ReadmeAssets/Common/searchotherlinkerflags.png "Search for 'Other Linker Flags'")

  7. Add "-ObjC" flag

    ![Alt text](/ReadmeAssets/Common/addflagobjc.png "Add linker flag '-ObjC'")

  , and you are done.

  *To dive in coding, see **"How to use"** section below.*
  
  *Have questions, ask them on **StackOverflow**:* http://stackoverflow.com/questions/tagged/woodo

  
### Adding from project settings

  1. Click project navigator icon ![Alt text](/ReadmeAssets/Common/iconnavigator.png "Navigator icon") at upper-left corner (below run button)

    ! If unable to see project navigator, navigator might be closed. You could reveal navigation bar with (command + shift + j) keyboard shortcut.

  2. Select your project from project navigator

    ![Alt text](/ReadmeAssets/Common/selectproject.png "Select project")

  3. Select project target

    ![Alt text](/ReadmeAssets/Common/selecttarget.png "Select target")

  4. Select "Build Phases" tab

    ![Alt text](/ReadmeAssets/Common/selectbuildphases.png "Select 'Build Phases'")

  5. Open "Link with binary libraries"

    ![Alt text](/ReadmeAssets/Common/selectlinkwithbinarylibraries.png "Select 'Link with binary libraries'")

  6. Select "Add items" ![Alt text](/ReadmeAssets/Common/iconadd.png "Add items (+)"). Framework and library chooser dialog will open

    ![Alt text](/ReadmeAssets/Common/librarychooserdialog.png "Framework and library chooser dialog")

  7. Select "Add other..." ![Alt text](/ReadmeAssets/Common/iconaddother.png "Add other...")

  8. Find Woodo.framework at the opened dialog

    ![Alt text](/ReadmeAssets/Common/otherlibrarychooserdialog.png "Other library chooser dialog")

  9. Select "Open" ![Alt text](/ReadmeAssets/Common/iconopen.png "Open")

  10. Now, you have to add 'Other Linker Flags'. Click project navigator icon ![Alt text](/ReadmeAssets/Common/iconnavigator.png "Navigator icon") at upper-left corner (below run button)

    ! If unable to see project navigator, navigator might be closed. You could reveal navigation bar with (command + shift + j) keyboard shortcut.

  11. Select your project from project navigator

    ![Alt text](/ReadmeAssets/Common/selectproject.png "Select project")

  12. Select project target

    ![Alt text](/ReadmeAssets/Common/selecttarget.png "Select target")

  13. Select "Build settings" tab

    ![Alt text](/ReadmeAssets/Common/selectbuildsettings.png "Select 'Build Settings'")

  14. Search for "Other Linker Flags"

    ![Alt text](/ReadmeAssets/Common/searchotherlinkerflags.png "Search for 'Other Linker Flags'")

  15. Add "-ObjC" flag

    ![Alt text](/ReadmeAssets/Common/addflagobjc.png "Add linker flag '-ObjC'")

  , and you are done.


  *To dive in coding, see "How to use" section below.*

  *Have questions, ask them on StackOverflow:* http://stackoverflow.com/questions/tagged/woodo


How to use
----------------------------------

### Setup

  In order to use Woodo Framework properly "AccessToken", "AppToken" and "ClientSecret" parameters need to be decleared on WPManager class before usage. It is recommended to perform setup on "UIApplicationDelegate" instance's "application:application didFinishLaunchingWithOptions:." selector. 

  i.e

  ```Objective-C
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    {
      // Override point for customization after application launch.
        
      // ...
        
      [WPManager setAccessToken:@"<Please contact team@woodo.tv for access token data>"];
      [WPManager setAppToken:@"<Please contact team@woodo.tv for app token data>"];
      [WPManager setClientSecret:@"<Please contact team@woodo.tv for client secret data>"];
      // ...
       
      return YES;
    }
  ```

### Basic usage

  - As subview

    - Import required headers 

      ```Objective-C
        #import <Woodo/WPManager.h>
      ```

    - Call presentation method over WPManager's shared instance with required parameters

      ```Objective-C
        NSURL *url = [NSURL URLWithString:@"<Your video content url>"];
        NSString *token = @"<Please contact team@woodo.tv for player token data>";

        [[WPManager sharedManager]
         addWoodoToView:self.videoThumbnail
         url:url
         token:token
         attachmentView:nil
         shareText:nil
         shareTitle:nil
         shareRecipients:nil
         presentationHandler:nil
         startHandler:nil
         progressHandler:nil
         finishHandler:nil
         errorHandler:nil];
      ```


  - As modal view controller

    - Import required headers 

      ```Objective-C
        #import <Woodo/WPManager.h>
      ```

    - Call presentation method over WPManager's shared instance with required parameters

      ```Objective-C
        NSURL *url = [NSURL URLWithString:@"<Your video content url>"];
        NSString *token = @"<Please contact team@woodo.tv for player token data>";

        [[WPManager sharedManager]
          presentWoodoWithUrl:url
          token:token
          attachmentView:nil
          shareText:nil
          shareUrls:nil
          shareImages:nil
          shareTitle:nil
          shareRecipients:nil
          presentationHandler:nil
          startHandler:nil
          progressHandler:nil
          finishHandler:nil
          errorHandler:nil];
      ```


### Woodo callbacks


  **If don't have comprehesinve knowledge on self usage with objective-c blocks, you might want to look at http://albertodebortoli.github.io/blog/2013/08/03/objective-c-blocks-caveat/**


  - Presentation handler,

    . if presenting Woodo as view controller, this callback fired right after presentation animation completed.

    . if adding Woodo as subview, this callback fired right after attached to superview.

    ```Objective-C

    // Definition of presentation handler
    void(^presentationHandler)();

    // Allocation & initialization of presentation handler
    presentationHandler = ^(){
        
      NSLog(@"Woodo presented (Available on UI)");
    };

    // Assignment of presentation handler
    [[WPManager sharedManager]
      // ...
      presentationHandler:presentationHandler
      // ...];

    ```


  - Start handler, fired when user-content (non-advertisement) started playback.
        
    ```Objective-C

    // Definition of start handler
    void(^startHandler)();

    // Allocation & initialization of start handler
    startHandler = ^(){
      
      NSLog(@"Woodo started");
    };

    // Assignment of start handler
    [[WPManager sharedManager]
      // ...
      startHandler:startHandler
      // ...];

    ```


  - Progress handler, fired when user-content (non-advertisement) playback progress (current playback timestamp) altered.

    ```Objective-C

    // Definition of progress handler
    void(^progressHandler)(CGFloat currentTime, CGFloat duration);

    // Allocation & initialization of progress handler
    progressHandler = ^(CGFloat currentTime, CGFloat duration){
              
      // Video progress updated
      NSLog(@"Woodo progress: %f / %f", currentTime, duration);
    };

    // Assignment of start handler
    [[WPManager sharedManager]
      // ...
      progressHandler:progressHandler
      // ...];

    ```


  - Finish handler,

    . if presented Woodo as view controller, this callback fired right after dismiss animation completed.

    . if added Woodo as subview, this callback fired right after detached from superview.

    Finish handler callback means Woodo completed playing each content (including advertisements).

    ```Objective-C

    // Definition of finish handler
    void(^finishHandler)();

    // Allocation & initialization of finish handler
    finishHandler = ^(){
        
      NSLog(@"Woodo finished (Removed from UI)");
    };

    // Assignment of finish handler
    [[WPManager sharedManager]
      // ...
      finishHandler:finishHandler
      // ...];

    ```


  - Error handler, fired if any error occured during playback. i.e, Timeout occured, non-supported video format provided, ...

    **If this callback fired, finish handler won't be called.**

    ```Objective-C

    // Definition of error handler
    void(^errorHandler)();

    // Allocation & initialization of error handler
    errorHandler = ^(){
        
      NSLog(@"Woodo error (Removed from UI)");
    };

    // Assignment of error handler
    [[WPManager sharedManager]
      // ...
      errorHandler:errorHandler
      // ...];

    ```


### Default video controllers

  - Import required headers

    ```Objective-C
      #import <Woodo/WPDefaultVideoControllerView.h>
    ```

  - Import required assets

    - Drag and drop

      1. Drag "WoodoImages.xcassets" into "Project" folder. If folder is not visible at the left side of XCode window, you could reveal navigation bar with (command + shift + j) keyboard shortcut and find it under your project. A dialog for file adding options will appear


      ![Alt text](/ReadmeAssets/DragAndDrop/dragassets.png "Drag & drop WoodoImages.xcassets")

      ![Alt text](/ReadmeAssets/DragAndDrop/dragsetup.png "File adding options setup dialog")


      . On dialog;

        * Create groups for any added folders and

          ![Alt text](/ReadmeAssets/DragAndDrop/dragsetupfolders.png "Select 'Create groups for any added folders and'")



        * "YourProjectName" at "Add to targets" section.

          ![Alt text](/ReadmeAssets/DragAndDrop/dragsetuptarget.png "Select <YourProjectName> at "Add to targets" section.")


          must be selected.

          If cloned Woodo's git repository, it is recommended, but not mandatory, to un-check (de-select) "Copy items into destination group's folder (if needed)", as keeping repository up-to-date would be much more easier.

            
    - Adding from project settings -

      1. Click project navigator icon ![Alt text](/ReadmeAssets/Common/iconnavigator.png "Navigator icon") at upper-left corner (below run button)

        ! If unable to see project navigator, navigator might be closed. You could reveal navigation bar with (command + shift + j) keyboard shortcut.

      2. Select your project from project navigator

        ![Alt text](/ReadmeAssets/Common/selectproject.png "Select project")

      3. Select project target

        ![Alt text](/ReadmeAssets/Common/selecttarget.png "Select target")

      4. Select "Build Phases" tab

        ![Alt text](/ReadmeAssets/Common/selectbuildphases.png "Select 'Build Phases'")

      5. Open "Copy bundle resources"

        ![Alt text](/ReadmeAssets/Common/selectcopybundleresources.png "Select 'Link with binary libraries'")

      6. Select "Add items" ![Alt text](/ReadmeAssets/Common/iconadd.png "Add items (+)"). Bundle resource chooser dialog will open

        ![Alt text](/ReadmeAssets/Common/bundleresourcechooserdialog.png "Bundle resource chooser dialog")

      7. Select "Add other..." ![Alt text](/ReadmeAssets/Common/iconaddother.png "Add other...")

      8. Find WoodoImages.xcassets at the opened dialog

        ![Alt text](/ReadmeAssets/Common/otherbundleresourcechooserdialog.png "Other bundle resource chooser dialog")

      9. Select "Open" ![Alt text](/ReadmeAssets/Common/iconopen.png "Open")

  - Pass new instance of WPDefaultVideoController to "presentWoodoWithUrl:token:attachmentView:shareText:shareTitle:shareRecipients:presentationHandler:startHandler:progressHandler:finishHandler:errorHandler:." selector.

    ```Objective-C

      UIView *attachmentView = [WPDefaultVideoControllerView new];

      [[WPManager sharedManager]
       addWoodoToView:self.videoThumbnail
       url:url
       token:token
       attachmentView:attachmentView
       shareText:nil 
       shareUrls:nil 
       shareImages:nil
       shareTitle:nil
       shareRecipients:nil
       presentationHandler:nil
       startHandler:nil
       progressHandler:nil
       finishHandler:nil
       errorHandler:nil];
    ```

    If given, attachment view will be added to main content, content you want to play, with same size with video player's boundaries.


### Social share data

  Social share is easy to implement built-in widget, that covers Facebook, Twitter and Mail share options. These options are valid if and only if accounts enabled at device settings.

  Available share data are;

    - Share text, takes NSString instance input as share data.
    - Share urls, takes NSArray instance. NSArray elements could be either NSURL instance or NSString instance with valid NSURL.
    - Share images, takes NSArray instance. NSArray elements could be either UIImage instance, NSURL instance of image data or NSString instance with valid image data URL.

    - Share title, takes NSString instance input as mail title. Only used when share via mail prompted.
    - Share recipients, takes NSArray instance input as share mail recipients. Only used when share via mail prompted.


  **In order to share widget to activate, at least one of share text, image or url is required.**


  ```Objective-C

    NSString *shareText = @"Woodo'nun yeni sitesi yayında";
    NSArray *shareUrls = @[@"http://woodo.tv/"];
    NSArray *shareImages = @[@"http://woodo.tv/wp-content/uploads/2014/03/logo.png"];
    NSString *shareTitle = @"Woodo";
    NSArray *shareRecipients = @[@"love@woodo.tv"];

    [[WPManager sharedManager]
     addWoodoToView:self.videoThumbnail
     url:url
     token:token
     attachmentView:nil
     shareText:shareText 
     shareUrls:shareUrls 
     shareImages:shareImages
     shareTitle:shareTitle
     shareRecipients:shareRecipients
     presentationHandler:nil
     startHandler:nil
     progressHandler:nil
     finishHandler:nil
     errorHandler:nil];

  ```

### Custom player controllers
  
  // Coming soon to documentation


### See sample project for usage