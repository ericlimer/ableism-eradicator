/*
Compiled by Eric Limer

Adapted from OverusedWords.ahk by Jack Dunning, October 31, 2015 (https://jacksautohotkeyblog.wordpress.com/2015/10/31/replacing-overused-words-with-pop-up-synonym-menus-part-7-beginning-hotstrings/)

Replacement words in part from Anagnori (https://anagnori.tumblr.com/post/71020734063/alternatives-to-saying-stupid). 

*/

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

LastChar := A_Space

:B0:stupid::
WordMenuSubset(7,"absurd,asinine,awful,banal,baseless,clueless,dull,erroneous,fallacious,fatuous,foolhardy,foolish,frivolous,gullible,ignorant,ill-advised,ill-considered,illogical,imperceptive,imprudent,inaccurate,inane,incompetent,indefensible,inept,injudicious,insipid,irrational,laughable,ludicrous,misguided,misinformed,mistaken,naive,nonsensical,oblivious,obtuse,outrageous,pathetic,pig-headed,pointless,preposterous,puerile,rash,ridiculous,senseless,shallow,silly,simplistic,stubborn,substandard,thoughtless,trifling,trite,trivial,unfounded,uninformed,unreasonable,unsound,untenable,unwarranted,unwise,useless,vacuous,vapid,waste of time,wasteful,willfully ignorant,worthless,wrong")
Return

:B0:dumb::
WordMenuSubset(5,"absurd,asinine,awful,banal,baseless,clueless,dull,erroneous,fallacious,fatuous,foolhardy,foolish,frivolous,gullible,ignorant,ill-advised,ill-considered,illogical,imperceptive,imprudent,inaccurate,inane,incompetent,indefensible,inept,injudicious,insipid,irrational,laughable,ludicrous,misguided,misinformed,mistaken,naive,nonsensical,oblivious,obtuse,outrageous,pathetic,pig-headed,pointless,preposterous,puerile,rash,ridiculous,senseless,shallow,silly,simplistic,stubborn,substandard,thoughtless,trifling,trite,trivial,unfounded,uninformed,unreasonable,unsound,untenable,unwarranted,unwise,useless,vacuous,vapid,waste of time,wasteful,willfully ignorant,worthless,wrong")
Return

:B0:!s::
WordMenuSubset(3,"absurd,asinine,awful,banal,baseless,clueless,dull,erroneous,fallacious,fatuous,foolhardy,foolish,frivolous,gullible,ignorant,ill-advised,ill-considered,illogical,imperceptive,imprudent,inaccurate,inane,incompetent,indefensible,inept,injudicious,insipid,irrational,laughable,ludicrous,misguided,misinformed,mistaken,naive,nonsensical,oblivious,obtuse,outrageous,pathetic,pig-headed,pointless,preposterous,puerile,rash,ridiculous,senseless,shallow,silly,simplistic,stubborn,substandard,thoughtless,trifling,trite,trivial,unfounded,uninformed,unreasonable,unsound,untenable,unwarranted,unwise,useless,vacuous,vapid,waste of time,wasteful,willfully ignorant,worthless,wrong")
Return

:B0:#s::
WordMenu(3,"absurd,asinine,awful,banal,baseless,clueless,dull,erroneous,fallacious,fatuous,foolhardy,foolish,frivolous,gullible,ignorant,ill-advised,ill-considered,illogical,imperceptive,imprudent,inaccurate,inane,incompetent,indefensible,inept,injudicious,insipid,irrational,laughable,ludicrous,misguided,misinformed,mistaken,naive,nonsensical,oblivious,obtuse,outrageous,pathetic,pig-headed,pointless,preposterous,puerile,rash,ridiculous,senseless,shallow,silly,simplistic,stubborn,substandard,thoughtless,trifling,trite,trivial,unfounded,uninformed,unreasonable,unsound,untenable,unwarranted,unwise,useless,vacuous,vapid,waste of time,wasteful,willfully ignorant,worthless,wrong")
Return

:B0:an idiot::
WordMenu(9,"a dolt,a shithead,a dipshit,a doofus,a dork,an ass,a fuckwit,a blockhead,a pinhead,a dope,a jackass,a twit,a jerk,an asshat,an asswipe,a prick,a dickhead,a clod,a loser,a jerkass")
Return

:B0:idiots::
WordMenu(7,"dolts,shitheads,dipshits,doofuses,dorks,asses,fuckwits,blockheads,pinheads,dopes,jackasses,twits,jerks,asshats,asswipes,pricks,dickheads,clods,losers,jerkasses")
Return

:B0:idiot::
WordMenu(6,"dolt,shithead,dipshit,doofus,dork,ass,fuckwit,blockhead,pinhead,dope,jackass,twit,jerk,asshat,asswipe,prick,dickhead,clod,loser,jerkass")
Return

:B0:!i::
WordMenu(6,"dolt,shithead,dipshit,doofus,dork,ass,fuckwit,blockhead,pinhead,dope,jackass,twit,jerk,asshat,asswipe,prick,dickhead,clod,loser,jerkass")
Return

:B0:crazy::
WordMenu(6,"absurd,wild,ridiculous ,bonkers,ludicrous,overwhelming,bizarre,outlandish,peculiar,unbelievable,unfathomable") 
Return

:B0:insane::
WordMenu(7,"absurd,wild,ridiculous ,bonkers,ludicrous,overwhelming,bizarre,outlandish,peculiar,unbelievable,unfathomable")  
Return

:B0:!c::
WordMenu(6,"absurd,wild,ridiculous ,bonkers,ludicrous,overwhelming,bizarre,outlandish,peculiar,unbelievable,unfathomable")  
Return



WordMenu(Spaces,TextOptions)
{
 Global BackSpaces
 BackSpaces := Spaces
 StringSplit, MenuItems, TextOptions , `,
 Loop %MenuItems0%
  {
    Item := MenuItems%A_Index%
    Menu, MyMenu, add, %Item%, WordMenuAction
  }
 Menu, MyMenu, Show
 Menu, MyMenu, DeleteAll
} 

WordMenuSubset(Spaces,TextOptions) ;  for lists that are very long, this function picks a random subset of ~25%
{
 Global BackSpaces
 BackSpaces := Spaces
 StringSplit, MenuItems, TextOptions , `,
 Loop %MenuItems0%
  {
    Random, rand, 0, 2

    if (rand == 0) ; the list is v v long so this picks a random subset of ~25%
    {
    Item := MenuItems%A_Index%
    Menu, MyMenu, add, %Item%, WordMenuAction
    }
  }
 Menu, MyMenu, Show
 Menu, MyMenu, DeleteAll
} 

WordMenuAction:
 Check := BackSpaces -1
 SendInput {BackSpace %Check%}
 SendInput {Shift down}{Left}{Shift up}
 OldClipboard:= Clipboard
 Clipboard:= ""
 Send, ^c ;cuts selected text
 ClipWait 0
If Clipboard Is Upper
   {
     First := SubStr(A_ThisMenuItem, 1 , 1)
     Second := SubStr(A_ThisMenuItem, 2)
     Stringupper First, First
     InitialCap := First . Second
     SendInput %InitialCap%{raw}%A_EndChar%
   }
Else
 SendInput %A_ThisMenuItem%{raw}%A_EndChar%
 Clipboard:= OldClipboard
Return