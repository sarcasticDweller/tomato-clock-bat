@echo off
setlocal enabledelayedexpansion

set /a long=1500
set /a short=300
set /a last=long
set "leading_whitespace="


set /a counter=long


:loop

if !counter! lss 1 goto switch_timer

set /a counter-=1
timeout /t 1 >nul

if !counter! gtr 1 set "whitespace=   "
if !counter! gtr 9 set "whitespace=  "
if !counter! gtr 99 set "whitespace= "
if !counter! gtr 999 set "whitespace="

cls
echo          \ /
echo       /-------\
echo      ^|  !whitespace!!counter!   ^|
echo      ^|         ^|
echo       \___^^___/

goto loop

:switch_timer

msg * "Timer up!"

if !last! == !long! (
    set /a counter=!short!
    set /a last=!short!
) else if !last! == !short! (
    set /a counter=!long!
    set /a last=!long!
)

goto loop

