{
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": 105554172285166,
  "extensionVersion": "1.0.0",
  "packageId": "",
  "productId": "ACBD3CFF4E539AD869A0E8E3B4B022DD",
  "author": "",
  "date": "2021-03-12T21:28:16.1509251+00:00",
  "license": "Proprietary",
  "description": "",
  "helpfile": "",
  "iosProps": false,
  "tvosProps": false,
  "androidProps": false,
  "installdir": "",
  "files": [
    {"filename":"window_frame.dll","origname":"extensions\\window_frame.dll","init":"","final":"","kind":1,"uncompress":false,"functions":[
        {"externalName":"window_frame_has_focus","kind":1,"help":"window_frame_has_focus()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_frame_has_focus","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_get_handle","kind":11,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"window_frame_get_handle","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_get_wid","kind":11,"help":"","hidden":false,"returnType":1,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_frame_get_wid","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_set_visible_raw","kind":11,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"window_frame_set_visible_raw","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_get_width","kind":1,"help":"window_frame_get_width()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_frame_get_width","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_get_height","kind":1,"help":"window_frame_get_height()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_frame_get_height","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_get_x","kind":1,"help":"window_frame_get_x()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_frame_get_x","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_get_y","kind":1,"help":"window_frame_get_y()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_frame_get_y","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_get_rect_raw","kind":11,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"window_frame_get_rect_raw","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_set_rect","kind":1,"help":"window_frame_set_rect(x, y, w, h)","hidden":false,"returnType":2,"argCount":4,"args":[
            2,
            2,
            2,
            2,
          ],"resourceVersion":"1.0","name":"window_frame_set_rect","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_get_fakefullscreen","kind":11,"help":"","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_frame_get_fakefullscreen","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_set_fakefullscreen","kind":11,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"window_frame_set_fakefullscreen","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_set_region","kind":1,"help":"window_frame_set_region(x, y, w, h)","hidden":false,"returnType":2,"argCount":4,"args":[
            2,
            2,
            2,
            2,
          ],"resourceVersion":"1.0","name":"window_frame_set_region","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_set_caption","kind":1,"help":"window_frame_set_caption(text)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"window_frame_set_caption","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_command_run_raw","kind":11,"help":"","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"window_command_run_raw","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_command_hook_raw","kind":11,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"window_command_hook_raw","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_command_unhook_raw","kind":11,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"window_command_unhook_raw","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_command_get_active_raw","kind":11,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"window_command_get_active_raw","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_command_set_active_raw","kind":11,"help":"","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"window_command_set_active_raw","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_command_check","kind":1,"help":"window_command_check(button) : Returns whether the given button was pressed since the last call to this function.","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"window_command_check","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_get_topmost","kind":1,"help":"window_get_topmost()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_get_topmost","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_set_topmost","kind":1,"help":"window_set_topmost(stayontop)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"window_set_topmost","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_set_background","kind":1,"help":"window_frame_set_background(color)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"window_frame_set_background","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_set_min_size","kind":1,"help":"window_frame_set_min_size(minWidth, minHeight)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"window_frame_set_min_size","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_set_max_size","kind":1,"help":"window_frame_set_max_size(maxWidth, maxHeight)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"window_frame_set_max_size","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_set_caption_visible","kind":1,"help":"window_set_caption_visible(enable)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"window_set_caption_visible","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_init_raw","kind":11,"help":"","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"window_frame_init_raw","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_cleanup_raw","kind":11,"help":"","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_frame_cleanup_raw","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":64,"order":[
        {"name":"window_frame_has_focus","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_get_handle","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_get_wid","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_set_visible_raw","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_get_width","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_get_height","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_get_x","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_get_y","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_get_rect_raw","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_set_rect","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_get_fakefullscreen","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_set_fakefullscreen","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_set_region","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_set_caption","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_command_run_raw","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_command_hook_raw","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_command_unhook_raw","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_command_get_active_raw","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_command_set_active_raw","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_command_check","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_get_topmost","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_set_topmost","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_set_background","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_set_min_size","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_set_max_size","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_set_caption_visible","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_init_raw","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_cleanup_raw","path":"extensions/window_frame/window_frame.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"window_frame.gml","origname":"extensions\\gml.gml","init":"window_frame_init","final":"window_frame_cleanup","kind":2,"uncompress":false,"functions":[
        {"externalName":"window_frame_init","kind":2,"help":"window_frame_init()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_frame_init","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_update","kind":2,"help":"window_frame_update(): Should be called once per frame.","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_frame_update","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_get_visible","kind":2,"help":"window_frame_get_visible(): Returns whether the frame is currently on.","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_frame_get_visible","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_set_visible","kind":2,"help":"window_frame_set_visible(visible): Turns the frame on/off.","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"window_frame_set_visible","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_get_rect","kind":2,"help":"window_frame_get_rect(): Returns an array of x, y, width, height","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_frame_get_rect","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_set_fullscreen","kind":2,"help":"window_frame_set_fullscreen(full): ","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"window_frame_set_fullscreen","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_get_fullscreen","kind":2,"help":"window_frame_get_fullscreen():","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_frame_get_fullscreen","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_command_hook","kind":2,"help":"window_command_hook(index): Hooks the specified command ","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"window_command_hook","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_command_unhook","kind":2,"help":"window_command_unhook(index):","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"window_command_unhook","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_command_run","kind":2,"help":"window_command_run(index, param = 0):","hidden":false,"returnType":2,"argCount":-1,"args":[],"resourceVersion":"1.0","name":"window_command_run","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_command_get_active","kind":2,"help":"window_command_get_active(command): Returns whether the given command is currently available.","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"window_command_get_active","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_command_set_active","kind":2,"help":"window_command_set_active(command, status:bool): Enables/disables the command. Returns -1 if not possible.","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"window_command_set_active","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"window_frame_cleanup","kind":11,"help":"","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"window_frame_cleanup","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[
        {"value":"global.window_frame_ready","hidden":false,"resourceVersion":"1.0","name":"window_frame_is_ready","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"$F060","hidden":false,"resourceVersion":"1.0","name":"window_command_close","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"$F030","hidden":false,"resourceVersion":"1.0","name":"window_command_maximize","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"$F020","hidden":false,"resourceVersion":"1.0","name":"window_command_minimize","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"$F120","hidden":false,"resourceVersion":"1.0","name":"window_command_restore","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"$F000","hidden":false,"resourceVersion":"1.0","name":"window_command_resize","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"$F010","hidden":false,"resourceVersion":"1.0","name":"window_command_move","tags":[],"resourceType":"GMExtensionConstant",},
      ],"ProxyFiles":[],"copyToTargets":64,"order":[
        {"name":"window_frame_init","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_update","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_get_visible","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_set_visible","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_get_rect","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_set_fullscreen","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_get_fullscreen","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_command_hook","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_command_unhook","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_command_run","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_command_get_active","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_command_set_active","path":"extensions/window_frame/window_frame.yy",},
        {"name":"window_frame_cleanup","path":"extensions/window_frame/window_frame.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"window_frame_host.exe","origname":"extensions\\window_frame_host.exe","init":"","final":"","kind":4,"uncompress":false,"functions":[],"constants":[],"ProxyFiles":[],"copyToTargets":64,"order":[],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
  ],
  "classname": "",
  "tvosclassname": "",
  "tvosdelegatename": "",
  "iosdelegatename": "",
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": "",
  "tvosplistinject": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidactivityinject": "",
  "gradleinject": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [
    "Objects\\obj_window_frame_test",
    "Rooms\\rm_window_frame_test",
    "Fonts\\fnt_window_frame_test",
    "Included Files\\window_frame.html",
  ],
  "androidPermissions": [],
  "copyToTargets": 64,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "resourceVersion": "1.2",
  "name": "window_frame",
  "tags": [],
  "resourceType": "GMExtension",
}