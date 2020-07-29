import XMonad
import XMonad.Config.Desktop

import XMonad.Util.SpawnOnce

import XMonad.Hooks.DynamicLog

import XMonad.Layout.Spacing
import XMonad.Layout.Spiral
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
  
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- The preferred terminal program, which is used in a binding below and by certain contrib modules.
myTerminal      = "alacritty"

-- modMask lets you specify which modkey you want to use.
-- The default is mod1Mask ("left alt").  You may also consider using mod3Mask ("right alt"), which does not conflict with emacs keybindings.
-- The "windows key" is usually mod4Mask.
myModMask       = mod4Mask

-- Border colors for unfocused and focused windows, respectively.
myNormalBorderColor  = "#282a36"
myFocusedBorderColor = "#ff5555"

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    -- XMonad
    [ ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))                    -- Quit xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart") -- Restart xmonad

    -- Window related things
    , ((modm .|. shiftMask, xK_c     ), kill)                                         -- close focused window
    , ((modm,               xK_space ), sendMessage NextLayout)                       -- Rotate through the available layout algorithms
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)           --  Reset the layouts on the current workspace to default
    , ((modm,               xK_n     ), refresh)                                      -- Resize viewed windows to the correct size
    , ((modm,               xK_Tab   ), windows W.focusDown)                          -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)                          -- Move focus to the next window
    , ((modm,               xK_k     ), windows W.focusUp  )                          -- Move focus to the previous window
    , ((modm,               xK_m     ), windows W.focusMaster  )                      -- Move focus to the master window
    , ((modm,               xK_Return), windows W.swapMaster)                         -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )                         -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )                         -- Swap the focused window with the previous window
    , ((modm,               xK_h     ), sendMessage Shrink)                           -- Shrink the master area
    , ((modm,               xK_l     ), sendMessage Expand)                           -- Expand the master area
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)               -- Push window back into tiling
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))                   -- Increment the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))                -- Deincrement the number of windows in the master area

    -- Must have
    , ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)                 -- launch a terminal
    , ((modm,               xK_p     ), spawn "exe=`dmenu_path | dmenu -nb '#282a36' -nf '#f8f8f2' -sb '#ff5555' -sf '#f8f8f2'` && eval $exe") -- launch dmenu

    -- Other
    , ((modm .|. shiftMask, xK_n     ), spawn (myTerminal ++ " -e newsboat"))         -- launch newsboat
    , ((modm .|. shiftMask, xK_p     ), spawn "sxiv -ft ~/stuff/images/wallpapers/")  -- launch sxiv in wallpaper folder
    ]
    ++

    -- mod-[1..9], Switch to workspace N
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myLayout = spacingRaw True (Border 0 5 5 5) True (Border 5 5 5 5) True $ spiral (4/5) ||| tiled ||| Full
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = Tall nmaster delta ratio

    -- The default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio   = 1/2

    -- Percent of screen to increment by when resizing panes
    delta   = 3/100

myManageHook =  composeAll
    [ className =? "Firefox"        --> doFloat
    , className =? "mpv"            --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "discord"        --> doFloat
    , className =? "KeepassXC"      --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

myStartupHook = do
              spawnOnce "xsetroot -cursor_name left_ptr"
              spawnOnce "nitrogen --restore"
              spawnOnce "trayer --edge top --align right --SetDockType true --SetPartialStrut true --width 4 --transparent true --alpha 0 --tint 0x282a36 --height 17"
              spawnOnce "compton"

-- Command used to run bar
myBar = "xmobar ~/.config/xmobar/.xmobarrc"

-- Pretty printing
myPP = xmobarPP
  { ppSep =  " > "
  , ppCurrent = wrap "[" "]" . xmobarColor "#50fa7b" ""
  , ppUrgent = xmobarColor "#282a36" "#ff5555"
  , ppHidden = xmobarColor "#ffb86c" ""
  , ppLayout = (\x -> case x of
                                    "Spacing Spiral"             ->      "@"
                                    "Spacing Tall"               ->      "[]="
                                    "Spacing Full"               ->      "[]"
                                    _                            ->      x
                                )
  , ppTitle = (++ " ") . xmobarColor "#50fa7b" "" . shorten 50
  }

-- Keybind to toggle bar
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myConfig = desktopConfig
         { terminal           = myTerminal
         , modMask            = myModMask
         , normalBorderColor  = myNormalBorderColor
         , focusedBorderColor = myFocusedBorderColor
         , keys               = myKeys
         , layoutHook         = myLayout
         , handleEventHook    = fullscreenEventHook
         , manageHook         = ( isFullscreen --> doFullFloat ) <+> myManageHook
         , startupHook        = myStartupHook
         }
