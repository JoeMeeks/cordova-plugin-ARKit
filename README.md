# cordova-plugin-ARKit

This fork upgrades the cordova-plugin-add-swift-support version to 2.0.2 and sets the iOS target version to 11.3 (minimum ARKit version) for XCode 11.5 compatibility:
```xml
<preference name="deployment-target" value="11.3" />
<dependency id="cordova-plugin-add-swift-support" version="~2.0.2" />
```

## Supported Platforms

- iOS

## Installation

    cordova plugin add https://github.com/JoeMeeks/cordova-plugin-ARKit

Add the following lines into your config.xml in the platform tag.
```xml
<platform name="ios">
  <preference name="UseSwiftLanguageVersion" value="4.2" />
</platform>
```

For Ionic AppFlow compatibility set the following iOS preference

## Methods

- cordova.plugins.arkit.addARView
- cordova.plugins.arkit.removeARView
- cordova.plugins.arkit.setListenerForArChanges
- cordova.plugins.arkit.reloadSession

### addARView

Insert the camera view under the WebView

```js
cordova.plugins.arkit.addARView();
```

### removeARView

Remove the camera view

```js
cordova.plugins.arkit.removeARView();
```

### setListenerForArChanges

Set listener for event from ARKit

##### Parameters

| Parameter        | Type       | Description                                |
| ---------------- | ---------- | ------------------------------------------ |
| `arHandler`      | `Function` | Is called after initializing an AR session |

##### Callback parameters

`arHandler`

| Parameter  | Type      | Description                         |
| ---------- | --------- | ----------------------------------- |
|   `str`    | `String`  | Line with camera change information. <br> Format: `positionX, positionY, positionZ, quatirionX, quatirionY, quatirionZ, quatirionW` |


```js
cordova.plugins.arkit.setListenerForArChanges((str) => {});
```

### reloadSession

Reload AR session

```js
cordova.plugins.arkit.reloadSession();
```
