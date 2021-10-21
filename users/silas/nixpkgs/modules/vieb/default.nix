{ config, lib, pkgs, ... }:

{
  home.file."${config.home.homeDirectory}/.viebrc".text = ''
    set firefoxmode=google
    set timeout=false
    set adblocker=update
    set follownewtabswitch=false
    set mapsuggestposition=bottomright
    set permissioncamera=ask
    set permissiondisplaycapture=ask
    set permissiongeolocation=ask
    set permissionmicrophone=ask
    set search="https://www.google.nl/search?q=%s"
    set searchwords+=yt~youtube.com/results?search_query=%s
    set searchwords+=h~hoogle.haskell.org/?hoogle=%s
    set splitbelow=true
    set splitright=true
    set suspendtimeout=3600000
    set guitabbar=always

    nmap u <scrollPageUpHalf>
    nmap d <scrollPageDownHalf>
    nmap x <:close>
    nmap X <reopenTab>
    nmap a <openNewTab><toExploreMode>
    nmap <A-p> <:pin>
    nmap <A-m> <:mute>
    nmap t :buffer<Space>
    nmap p <openNewTab><openFromClipboard>
    nmap J <previousTab>
    nmap K <nextTab>
  '';
}
