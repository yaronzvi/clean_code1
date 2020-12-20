# flutter_lecture_clean_code

Hi everyone,
This code open for learning best practice for clean code architecture by isung this plugins:

## flutter_bloc

state managemnt packge

https://pub.dev/packages/flutter_bloc

## get_it

plugin for eacsy implememnt DI(dependency injection)

note its not pure DI this is service locator that in the background working diff from di but same result :)

https://pub.dev/packages/get_it

## retrofit

plugin for http request this is wrapper for dio plugin

https://pub.dev/packages/retrofit

## Run project

For run this project we need to do some things:

1.clone project XD

2. search for server_nodejs.zip extract it and open it with your favorite ide/command line (vs code,web storm,etc... )

3. run at the terminal/cmd from the path of the server proj ```npm_install```

4. run ```npm start server```

5. open flutter project and run it with emulator (enjoy)

## **Notice

if you want to run it on a areal device you need to change some properties:

1. go to ypur network setting in your pc and checkout whats your ip of your network/wifi then copy it

2. go to ```api_configuration.dart``` in your flutter project and change this value :

```static const BASE_URL = "http://10.0.0.27:5000/api/";```

to your new address ip value

```static const BASE_URL = "http://{YOURIP}:5000/api/";```

3. run the project and enjoy :)


