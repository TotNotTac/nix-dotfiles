import XMonad
import XMonad.Actions.Navigation2D
import XMonad.Config.Xfce

import XMonad.Layout.Gaps
import XMonad.Layout.Fullscreen
import XMonad.Layout.BinarySpacePartition as BSP
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spacing
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.Renamed
import XMonad.Layout.Simplest
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowNavigation
import XMonad.Layout.ZoomRow
import XMonad.Layout.ResizableTile

import Graphics.X11.ExtraTypes.XF86
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys, mkKeymap, checkKeymap)
import System.IO

myBrowser = "brave"
myLauncher = "xfce4-appfinder -c"
myTerminal = "xfce4-terminal"
myEditor = "emacsclient -a \"\" -c"

myKeys = [ ("M-q", kill)
        , ("M-S-<Space>", sendMessage NextLayout)
        -- , ((modMask .|. controlMask, xK_space), setLayout $ XMonad.layoutHook conf)
        , ("M-n", refresh)
        , ("M-j", windows W.focusDown)
        , ("M-k", windows W.focusUp)

        , ("M-C-j", sendMessage Shrink)
        , ("M-C-k", sendMessage Expand)
        , ("M-C-h", sendMessage MirrorShrink)
        , ("M-C-l", sendMessage MirrorExpand)
        , ("M-<Space>", windows W.swapMaster)
        , ("M-[", sendMessage (IncMasterN (-1)))
        , ("M-]", sendMessage (IncMasterN 1))


        , ("M-t", withFocused $ windows . W.sink)
        , ("M-<Return>", spawn myTerminal)
        , ("M-b", spawn myBrowser)
        , ("M-e", spawn myEditor)
        , ("M-r", spawn $ myTerminal ++ " -e ranger")
        , ("M-x", spawn myLauncher)
        ]

myNav2DConf = def
    { defaultTiledNavigation    = centerNavigation
    , floatNavigation           = centerNavigation
    , screenNavigation          = lineNavigation
    , layoutNavigation          = [("Full",          centerNavigation)
    -- line/center same results   ,("Tabs", lineNavigation)
    --                            ,("Tabs", centerNavigation)
                                  ]
    , unmappedWindowRect        = [("Full", singleWindowRect)
    -- works but breaks tab deco  ,("Tabs", singleWindowRect)
    -- doesn't work but deco ok   ,("Tabs", fullScreenRect)
                                  ]
    }

main = xmonad $ docks
  $ withNavigation2DConfig myNav2DConf
  $ additionalNav2DKeys (xK_k, xK_h, xK_j, xK_l)
                               [
                                  (mod4Mask,               windowGo  )
                                , (mod4Mask .|. shiftMask, windowSwap)
                               ]
                               False
  $ defaults

defaults = xfceConfig  {
    -- simple stuff
    terminal              = myTerminal,
    -- focusFollowsMouse  = myFocusFollowsMouse,
    -- borderWidth        = myBorderWidth,
    modMask               = mod4Mask,
    -- workspaces         = myWorkspaces,
    -- normalBorderColor  = myNormalBorderColor,
    -- focusedBorderColor = myFocusedBorderColor,

    -- -- key bindings
    keys                  = \c -> mkKeymap defaults myKeys,
    -- mouseBindings      = myMouseBindings,

    -- -- hooks, layouts
    -- layoutHook         = myLayout,
    -- -- handleEventHook = E.fullscreenEventHook,
    -- handleEventHook    = fullscreenEventHook,
    -- manageHook         = manageDocks <+> myManageHook,
    startupHook           = do
        checkKeymap defaults myKeys
        return ()
}
