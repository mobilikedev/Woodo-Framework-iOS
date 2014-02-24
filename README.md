Woodo Framework (v1.0.0)
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

- Framework installation

  - Drag and drop

    1. Drag "Woodo.framework" into "Frameworks" folder. 
      If folder is not visible at the left side of XCode window, you could reveal navigation bar with (command + shift + j) keyboard shortcut and find it under your project.
      A dialog for file adding options will appear


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

    ! To dive in coding, see "How to use" section below.
  	! Have questions, ask them on StackOverflow: http://stackoverflow.com/questions/tagged/woodo

  
  - Adding from project settings -

    1. Click project navigator icon ![Alt text](/ReadmeAssets/Common/iconnavigator.png "Navigator icon") at upper-left corner (below run button)

      ! If unable to see project navigator, navigator might be closed. You could reveal navigation bar with (command + shift + j) keyboard shortcut.

    2. Select your project from project navigator

      ![Alt text](/ReadmeAssets/Common/selectproject.png "Select project")

    3. Select project target

      ![Alt text](/ReadmeAssets/Common/selecttarget.png "Select target")

    4. Select "Build Phases" tab

      ![Alt text](/ReadmeAssets/Common/selectbuildphases.png "Select 'Build Phases'")

    5. Open "Link with binary libraries" selectlinkbinarywithlibraries

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


    ! To dive in coding, see "How to use" section below.
    ! Have questions, ask them on StackOverflow: http://stackoverflow.com/questions/tagged/woodo


How to use
----------------------------------

  - Setup -

    In order to use Woodo Framework properly "AccessToken", "AppToken" and "ClientSecret" parameters need to be decleared on WPWoodoView class before usage. It is recommended to perform setup on "UIApplicationDelegate" instance's "application:application didFinishLaunchingWithOptions:." selector. 

    i.e

    ```Objective-C
      - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
      {
        // Override point for customization after application launch.
        
        // ...
        
        [WPWoodoView setAccessToken:@"<Please contact team@woodo.tv for access token data>"];
        [WPWoodoView setAppToken:@"<Please contact team@woodo.tv for app token data>"];
        [WPWoodoView setClientSecret:@"<Please contact team@woodo.tv for client secret data>"];
        // ...
       
        return YES;
      }
    ```

  - iPhone -

    - Basic usage

      - Import required headers 

      ```Objective-C
        #import <Woodo/WPWoodoViewController.h>
      ```

      Note that: Only WPWoodoViewController is allowed to use at iPhone environment

      - Allocate and initialize new view WPWoodoViewController instance. WPWoodoViewController's url variable should be defined in order to play desired content.

      ```Objective-C
      // Allocate & initialize new instance
      WPWoodoViewController *woodoViewController = [[WPWoodoViewController alloc] init];
      
      // Setup
      // Advertisement token
      woodoViewController.token = @"<Please contact team@woodo.tv for token data>";
      // Video content url (The content url that you want to play)
      woodoViewController.url = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
      ```

      - Present WPWoodoViewController instance. Video will start playing automatically, once modal presentation done.

      ```Objective-C
      [self presentViewController:woodoViewController
                       animated:YES
                     completion:nil];
      ```

    - Add default video controllers

      - Import required headers

      ```Objective-C
        #import <Woodo/WPDefaultVideoControllerView.h>
      ```

      - Assign new instance of WPDefaultVideoController to WPWoodoViewController's attachmentView variable.

      ```Objective-C
      // Attach mint-fresh instance of default view controller
      woodoViewController.attachmentView = [[WPDefaultVideoControllerView alloc] init];
      ```

      If given, attachment view will be added to main content, content you want to play, with same size with video player's boundaries.

  - iPad -

    - Basic usage

      - As subview

        - Import required headers 

        ```Objective-C
        #import <Woodo/WPWoodoView.h>
        ```

        - Allocate and initialize new view WPWoodoView instance.

        ```Objective-C
        // Allocate & initialized new instance
        WPWoodoView *woodoView = [[WPWoodoView alloc] initWithFrame:CGRectZero];
        ```

        - Attach WPWoodoView instance to its container

        ```Objective-C
        // Attach woodo view into its container
        [self.videoThumbnail addSubview:woodoView];
        self.woodoView = woodoView;
        
        // Define metrics via auto layout constraints
        NSDictionary *views = NSDictionaryOfVariableBindings(woodoView);
        
        NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[woodoView]-|" options:0 metrics:nil views:views];
        
        NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[woodoView]-|" options:0 metrics:nil views:views];
        
        [self.videoThumbnail addConstraints:horizontalConstraints];
        [self.videoThumbnail addConstraints:verticalConstraints];
        ```

        - Start playing video

        ```Objective-C
        [self.woodoView play:[NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"]
          withAttachment:nil
  withAdvertisementToken:@"<Please contact team@woodo.tv for token data>"];
        ```

        - Add default video controllers

          - Import required headers

          ```Objective-C
            #import <Woodo/WPDefaultVideoControllerView.h>
          ```

          - Pass WPDefaultVideoControllerView instance as attachmentView to "play:withAttachment:withAdvertisementToken:."" selector.

            ```Objective-C
            [self.woodoView play:[NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"]
                  withAttachment:[[WPDefaultVideoControllerView alloc] init]
          withAdvertisementToken:@"<Please contact team@woodo.tv for token data>"];
            ```

          If given, attachment view will be added to main content, content you want to play, with same size with video player's boundaries.


      - As modal view controller

        - Import required headers 

        ```Objective-C
          #import <Woodo/WPWoodoViewController.h>
        ```

        - Allocate and initialize new view WPWoodoViewController instance. WPWoodoViewController's url variable should be defined in order to play desired content.

        ```Objective-C
        // Allocate & initialize new instance
        WPWoodoViewController *woodoViewController = [[WPWoodoViewController alloc] init];
        
        // Setup
        // Advertisement token
        woodoViewController.token = @"<Please contact team@woodo.tv for token data>";
        // Video content url (The content url that you want to play)
        woodoViewController.url = [NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
        ```

        - Present WPWoodoViewController instance. Video will start playing automatically, once modal presentation done.

        ```Objective-C
        [self presentViewController:woodoViewController
                         animated:YES
                       completion:nil];
        ```

        - Add default video controllers

          - Import required headers

          ```Objective-C
            #import <Woodo/WPDefaultVideoControllerView.h>
          ```

          - Assign new instance of WPDefaultVideoController to WPWoodoViewController's attachmentView variable.

          ```Objective-C
          // Attach mint-fresh instance of default view controller
          woodoViewController.attachmentView = [[WPDefaultVideoControllerView alloc] init];
          ```

          If given, attachment view will be added to main content, content you want to play, with same size with video player's boundaries.

  
  - Custom player controllers -
  
    // TODO: 


  - See sample project for usage


  ! On iPhone environment, it is mandatory to present WPWoodoViewController.