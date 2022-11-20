import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Layout.Spacing

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP


myTerminal = "terminator"
myWorkspaces = ["1: term", "2: web", "3: code", "4: media"] ++ map show [5..9]
myLauncher = "dmenu_run"
myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
	where
		threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
		tiled = Tall nmaster delta ratio
		nmaster = 1
		ratio = 1/2
		delta = 3/100

myDefaultGaps = [(15, 0, 0, 0)]
myBorderWidth = 2
myNormalBorderColor = "#000000"
myFocusedBorderColor = "#eef204"


myConfig = def {
 terminal = "terminator",
 modMask = mod4Mask,
 workspaces = myWorkspaces,
 layoutHook = spacingWithEdge 10 $ myLayout,
 normalBorderColor = myNormalBorderColor,
 focusedBorderColor = myFocusedBorderColor,
 borderWidth = myBorderWidth
}

main = xmonad $ ewmhFullscreen $ ewmh $ xmobarProp $ myConfig

