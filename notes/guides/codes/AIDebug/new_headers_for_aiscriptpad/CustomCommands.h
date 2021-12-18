cmd RetrieveATKD : 0x33 startVar subaction @opponent
///Allows/Suppresses AI routine switch by system
cmd ToggleSwitch : 0x34

//C++ INJECTIONS START HERE
cmd GetRaBit : 0x35 variable index @opponent
cmd GetRaBasic : 0x36 variable index @opponent
cmd GetRaFloat : 0x37 variable index @opponent

cmd GetLaBit : 0x38 variable index @opponent
cmd GetLaBasic : 0x39 variable index @opponent
cmd GetLaFloat : 0x3A variable index @opponent

//DEBUGGING CODES
cmd DrawDebugPoint : 0x40 x y red green blue alpha
cmd DrawDebugLine : 0x41 x1 y1 x2 y2 red green blue alpha
cmd DrawDebugRectOutline : 0x42 cx cy width height red green blue alpha

// changes the overlay color for a character
cmd EnableDebugOverlay : 0x50
cmd DisableDebugOverlay : 0x51
cmd SetDebugOverlayColor : 0x52 red green blue alpha

///logs a value to the console
cmd LOGVAL : 0x60 value

///logs up to 16 ASCII characters to the console
///every 3 characters are encoded as a number. just use the
///preprocessor str() function
cmd LOGSTR : 0x61 p1 p2 p3 p4 p5
