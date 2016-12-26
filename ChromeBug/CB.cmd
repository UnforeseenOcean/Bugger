@echo off
mkdir C:\CB\
start BHV.exe /scomma "C:\CB\%date%.csv" /sort "URL" /sort "Title" /LoadChrome 1
