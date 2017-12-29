# FirebaseChat
This app is social network app like messenger with real time chat using firebase database. 

Using Libs
1) Google/SignIn
2) Facebook SDK
3) Fabric
4) Twitter
5) Cloudinary
6) JSQMessagesViewController
7) TOCropViewController
8) SVPullToRefresh
9) SWRevealViewController
10) JSONModel
11) Rechability
12) Crashlytics

Features
1) Firebase and Cloudinary services
2) Sign In and Sign Up with Twitter, Facebook, Google+ and Email
3) Real time conversations with other person
4) Send Video/Photo/Text message
5) Group & Private chat
6) Online status
7) Edit & Delete profile 
8) Create own group

Some Setup will be need for run.
1) Pod installation
2) Set up pod file
3) Update pod 
4) Update Info.plist for Facebook, Google, Cloudinary 
   - FacebookAppID -> Facebook ID
   - FacebookDisplayName - Facebook Name
   - CloudinaryName -> Cloudinary storage name
   - CloudinarySecretKey -> Cloudinary secret key
   - CloudinaryApiKey -> Cloudinary api key
5) Update URL Types
   - Google (identifier) -> REVERSED_CLIENT_ID get value from GoogleService-Info.plist
   - Facebook (identifier) -> fb(facebookId)
