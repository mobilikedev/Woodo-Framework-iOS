Woodo Framework (v1.0.0)
==================================


Requirements
----------------------------------

- Minimum deployment target - 

  - iOS 6.0

- Auto Reference Counting (ARC) -

  - Yes, it requires ARC.

- Frameworks -

  - As of "-ObjC" flag must be defined, no need to link additional binary libraries (frameworks)



Installation
----------------------------------

- Framework installation -

  - Drag and drop -

    1. Drag "Woodo.framework" into "Frameworks" folder. 
      If folder is not visible at the left side of XCode window, you could reveal navigation bar with (command + shift + j) keyboard shortcut and find it under your project.
      A dialog for file adding options will appear

      // TODO: Insert screenshot here


      . On dialog;

        * Create groups for any added folders and

        	// TODO: add screenshot


        * "<YourProjectName>" at "Add to targets" section

      must be selected.

      If cloned Woodo's git repository, it is recommended, but not mandatory, to un-check (de-select) "Copy items into destination group's folder (if needed)", as keeping repository up-to-date would be much more easier.

    2. Now, you have to add 'Other Linker Flags'. Click project navigator icon /** TODO: Add icon here */ at upper-left corner (below run button)

      ! If unable to see project navigator, navigator might be closed. You could reveal navigation bar with (command + shift + j) keyboard shortcut.

    3. Select your project from project navigator

      // TODO: Add screenshot

    4. Select project target

      // TODO: Add screenshot

    5. Select "Build settings" tab

      // TODO: Add screenshot

    6. Search for "Other Linker Flags"

      // TODO: Add screenshot

    7. Add "-ObjC" flag, and you are done.

    ! To dive in coding, see "How to use" section below.
  	! Have questions, ask them on StackOverflow: http://stackoverflow.com/questions/tagged/woodo

  
  - Adding from project settings -

    1. Click project navigator icon /** TODO: Add icon here */ at upper-left corner (below run button)

      ! If unable to see project navigator, navigator might be closed. You could reveal navigation bar with (command + shift + j) keyboard shortcut.

    2. Select your project from project navigator

      // TODO: Add screenshot

    3. Select project target

      // TODO: Add screenshot

    4. Select "Build phases" tab

      // TODO: Add screenshot

    5. Open "Link with binary libraries"

      // TODO: Add screenshot

    6. Select "Add items (+)"

      // TODO: Add screenshot

    7. Select "Add other..."

      // TODO: Add screenshot

    8. Find Woodo.framework at the opened dialog

      // TODO: Add screenshot

    9. Select "OK"

    10. Now, you have to add 'Other Linker Flags'. Click project navigator icon /** TODO: Add icon here */ at upper-left corner (below run button)

      ! If unable to see project navigator, navigator might be closed. You could reveal navigation bar with (command + shift + j) keyboard shortcut.

    11. Select your project from project navigator

      // TODO: Add screenshot

    12. Select project target

      // TODO: Add screenshot

    13. Select "Build settings" tab

      // TODO: Add screenshot

    14. Search for "Other Linker Flags"

      // TODO: Add screenshot

    15. Add "-ObjC" flag

    , and you are done.

    ! To dive in coding, see "How to use" section below.
    ! Have questions, ask them on StackOverflow: http://stackoverflow.com/questions/tagged/woodo


Usage
----------------------------------

  - Setup -

    In order to use Woodo Framework properly "AccessToken", "AppToken" and "ClientSecret" parameters need to be decleared on WPWoodoView class before usage. It is recommended to perform setup on "UIApplicationDelegate" instance's "application:application didFinishLaunchingWithOptions:." selector. 

    i.e

    ******************************
    ** - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    ** {
    **     // Override point for customization after application launch.
    **     
    **     // ...
    **     
    **     [WPWoodoView setAccessToken:@"<Please contact team@woodo.tv for access token data>"];
    **     [WPWoodoView setAppToken:@"<Please contact team@woodo.tv for app token data>"];
    **     [WPWoodoView setClientSecret:@"<Please contact team@woodo.tv for client secret data>"];
    **
    **     // ...
    **    
    **     return YES;
    ** }

  - See sample project for usage


  ! On iPhone environment, it is mandatory to present WPWoodoViewController.