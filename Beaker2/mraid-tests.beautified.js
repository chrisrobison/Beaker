{
    "setName": "Cobalt MRAID Tests",
    "defaults": {
        "server": "http://adsx.greystripe.com/openx/www/delivery/ia.php",
        "guid": "296834ba-e559-11e4-b59c-d04f09e98198",
        "useBudget": false,
        "useFrequencyCapping": false,
        "ipv4": "123.45.67.89",
        "sendGps": false
    },
    "tests": [{
        "name": "Integration Test-Standard integration test GUID",
        "guid": "51d7ee3c-95fd-48d5-b648-c915209a00a5",
        "notes": "Should load generic Conversant themed ad."
    }, {
    
        "name": "getCurrentPosition",
        "mid": "1239188",
        "notes": "Should return current ad position x,y relative to getMaxSize dimensions"
    }, {
        "name": "getDefaultPosition",
        "mid": "1243767",
        "notes": "Should return default ad position x,y relative to getMaxSize dimensions"
    }, {
        "name": "getMaxSize",
        "mid": "1243768",
        "notes": "Should return available screen size in pixels minus tool/status bars"
    }, {
        "name": "getPlacementType",
        "mid": "1243771",
        "notes": "Return placement type: inline"
    }, {
        "name": "getScreenSize",
        "mid": "1243772",
        "notes": "Return total screen size in pixels"
    }, {
        "name": "open",
        "mid": "1243773",
        "notes": "Open url to IAD site"
    }, {
        "name": "playVideo",
        "mid": "1243774",
        "notes": "Play IAB video"
    }, {
        "name": "resize - Allow Offscreen",
        "mid": "1243775",
        "notes": "When set to true will allow the ad to resize offscreen, when false ad should resize centered"
    }, {
        "name": "Resize - Custom Close Positions",
        "mid": "1243778",
        "notes": "Should resize with custom close in indicated area"
    }, {
        "name": "resize - Simple",
        "mid": "1243779",
        "notes": "Resize ad as shown in icons with partial screen dimensions"
    }, {
        "name": "setExpandProperties - All Params",
        "mid": "1243780",
        "notes": "Should set the following properties: width:288,height:292,useCustomClose:true,isModal:true\nNote: isModal is read only\n"
    }, {
        "name": "setExpandProperties - String Vs. Boolean",
        "mid": "1243794",
        "notes": "Set the following properties: width:288,height:292,useCustomClose:'true'\nNote: In our SDK, should translate string 'true' to boolean true.\n"
    }, {
        "name": "setExpandProperties - String Vs. Integer",
        "mid": "1243795",
        "notes": "Should set the following properties: width:'288',height:'292',useCustomClose:true\nNote: In our SDK, should fail to change because values are not numbers\n"
    }, {
        "name": "setExpandProperties - Width",
        "mid": "1243796",
        "notes": "Should set expand width to 288px"
    }, {
        "name": "setExpandProperties - Width Height",
        "mid": "1243797",
        "notes": "Should set expand height / width to width:288\/height:292"
    }, {
        "name": "setExpandProperties- Width Height UCC",
        "mid": "1243798",
        "notes": "should set values width:288,height:292,useCustomClose:true"
    }, {
        "name": "setOrientationProperties - Allow Orientation Change",
        "mid": "1243800",
        "notes": "should set values: allowOrientationChange:false"
    }, {
        "name": "setOrientationProperties - All Params",
        "mid": "1243801",
        "notes": "should set values: allowOrientationChange:false,forceOrientation:'portrait'"
    }, {
        "name": "setOrientationProperties - Bad Params",
        "mid": "1243802",
        "notes": "Param 'pineapple' should not be accepted"
    }, {
        "name": "setOrientationProperties - Force Orientation",
        "mid": "1243804",
        "notes": "should set value: forceOrientation:'landscape'"
    }, {
        "name": "setOrientationProperties - String Vs. Boolean",
        "mid": "1243805",
        "notes": "attempt set values: allowOrientationChange:'false',forceOrientation:'portrait'\nNote: should either fail to set or translate string value into boolean\n"
    }, {
        "name": "setResizeProperties - All Params",
        "mid": "1243806",
        "notes": "should set values: width:295,height:290,offsetX:7,offsetY:8,customClosePosition:'top-left',allowOffscreen:false\n"
    }, {
        "name": "setResizeProperties - Bad Allow Offscreen",
        "mid": "1243807",
        "notes": "attempt to set values: width:295,height:290,offsetX:7,offsetY:8,customClosePosition:'top-left',allowOffscreen:'pineapple'\nNote: should not accept bad param \"pineapple\"\n"
    }, {
        "name": "setResizeProperties - Bad CCP Value",
        "mid": "1243808",
        "notes": "attempt to set values: width:295,height:290,offsetX:7,offsetY:8,customClosePosition:'pineapple',allowOffscreen:'false'\nNote: should not accept bad param \"pineapple\"\n"
    }, {
        "name": "setResizeProperties - Omit Some Required",
        "mid": "1243809",
        "notes": "attempt to set values: width:295,offsetY:8\nNote incomplete values, should not set\n"
    }, {
        "name": "setResizeProperties - Required Only",
        "mid": "1243810",
        "notes": "should set values: width:295,height:290,offsetX:7,offsetY:8,customClosePosition:'top-right',allowOffscreen:'true'"
    }, {
        "name": "setResizeProperties - String Vs. Boolean",
        "mid": "1243811",
        "notes": "attempt to set values: width:295,height:290,offsetX:7,offsetY:8,customClosePosition:'top-left',allowOffscreen:'false'\nNote: Our SDK refuses the change to allowOffscreen because of the string 'false'\n"
    }, {
        "name": "setResizeProperties - String Vs. Integer",
        "mid": "1243812",
        "notes": "attempt to set values: width:'295',height:'290',offsetX:'7',offsetY:'8',customClosePosition:'top-left',allowOffscreen:false\nShould fail to set or translate string values to int.\n"
    }, {
        "name": "setResizeProperties - Too Big \/ Too Small",
        "mid": "1243813",
        "notes": "attempt to set values too big or too small for device screen size. Should fail to set values.\n"
    }, {
        "name": "expand - Expand Again",
        "mid": "1243814",
        "notes": "Both Expand Again Buttons Should do nothing."
    }, {
        "name": "expand - Get Tests",
        "mid": "1243815",
        "notes": "Should expand, then buttons will get current expand properties."
    }, {
        "name": "expand - Orientation Properties",
        "mid": "1243816",
        "notes": "Should expand, buttons will return current orientation properties."
    }, {
        "name": "expand - Set Before Expand",
        "mid": "1243817",
        "notes": "Should expand to full screen size.\n"
    }, {
        "name": "expand - Simple",
        "mid": "1243818",
        "notes": "should expand add to fullscreen"
    }, {
        "name": "expand - Two Part",
        "mid": "1243819",
        "notes": "expand ad to IAB url"
    }, {
        "name": "expand - Two Part Bad URL",
        "mid": "1243820",
        "notes": "Should expand the the current view due to bad url, will have custom close area in upper right corner."
    }, {
        "name": "addEventListener - Multiple Events",
        "mid": "1243821",
        "notes": "event ads\/removes multiple events fires on error of bad setResizeProperties({})"
    }, {
        "name": "addEventListener",
        "mid": "1243822",
        "notes": "event ads\/removes multiple events fires on error of bad setResizeProperties({})"
    }, {
        "name": "Bad Methods",
        "mid": "1243823",
        "notes": "These buttons should all result in nothing"
    }, {
        "name": "getTests",
        "mid": "1243824",
        "notes": "Get tests in interstitial"
    }, {
        "name": "Supports",
        "mid": "1243825",
        "notes": "Tests for Call, Text, Calendar, Picture, and Inline Video\n"
    }]
}

