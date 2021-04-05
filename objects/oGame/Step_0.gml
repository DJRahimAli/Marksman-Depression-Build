//Detect operating system
switch (os_type)
{
   case os_windows: global.os = 0; break;
   case os_linux: global.os = 1; break;
   case os_macosx: global.os = 2; break;
   case os_android: global.os = 3; break;
   case os_ios: global.os = 4; break;
   case os_ps3: global.os = 5; break;
   case os_ps4: global.os = 6; break;
   case os_psvita: global.os = 7; break;
   case os_xboxone: global.os = 8; break;
   case os_uwp: global.os = 9; break;
   case os_unknown: global.os = 10; break;
}
