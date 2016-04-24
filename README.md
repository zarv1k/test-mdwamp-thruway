# test-mdwamp-thruway
Simple iOS app for test connect/disconnect to Thruway WAMP Router using MDWamp client library.

With Thruway router disconnect from WAMP router does not work properly:

0. Start simple Thruway router

```
php ./Thruway-master/Examples/SimpleWsServer.php
```

1. Open workspace in XCode and run app

2. Click 'Connect' button. When connected successfully then button title will change to 'Disconnect'

3. Click 'Disconnect'. You will get assertion fail error.




With Crossbar router the disconnect works well:

0. Start simple Crossbar router

```
crossbar start
```

1. Open workspace in XCode and run app

2. Click connect button. When connected successfully then button title will change to 'Disconnect'

3. Click 'Disconnect'. There is no assertion error and button title will change to 'Connect'


In my web app I am using 'angular-wamp' client library and there are no disconnect errors while using eigher Thruway or crossbar router.
