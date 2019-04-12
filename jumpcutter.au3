#cs ----------------------------------------------------------------------------

	Author:         Patrick Mitchell 
					Original Jumpcutter by carykh

#ce ----------------------------------------------------------------------------

#include <Array.au3>
#include <File.au3>
#include <FileConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <SliderConstants.au3>
#include <ProgressConstants.au3>
#include <InetConstants.au3>
#include <String.au3>
#include <ButtonConstants.au3>


Global $optUpdate, $aIsMajor, $LatestVersionDev, $aVersionActual, $aCurVersion, $isMajor, $updateStat, $folderpath, $nvar, $cuicountdown, $rndvarprog, $radio4, $radio3, $progress1, $slidecheckbox, $readslide, $slider1, $button2, $label14, $rndnumbinput, $min, $max, $rndnumb, $message, $ms, $msgs, $spamnumb, $input1, $input2, $input3, $button1, $input4, $label1, $label2, $label3, $radio1, $radio2, $msgstosend, $spammeduser, $label5, $label6, $label7, $label8, $suicidalscript, $label10, $label11, $label12, $label13, $label14, $label15, $label16, $input10

gui()

$ScriptVersion = "3.07"

Func gui()
	ConsoleWrite('@@ (34) :(' & @MIN & ':' & @SEC & ') gui()' & @CR) ;### Function Trace
	#Region ### START Koda GUI section ### Form=
	$form1_1_1 = GUICreate("xstmaSpamBot", 400, 260, 900, 400, BitOr($WS_BORDER, $WS_POPUP), BitOR($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW))
	$input1 = GUICtrlCreateInput("", 200, 80, 190, 21)
	$input3 = GUICtrlCreateInput("", 200, 105, 190, 21)
	$input4 = GUICtrlCreateInput("", 200, 142, 190, 21)
	$input10 = GUICtrlCreateInput("", 200, 167, 190, 21)
	$label1 = GUICtrlCreateLabel("Input File", 10, 80, 80, 17)
	$label3 = GUICtrlCreateLabel("Output File", 10, 105, 109, 17)
	$msgstosend = GUICtrlCreateLabel("Silent Speed", 10, 142, 144, 17)
	$msgstosend = GUICtrlCreateLabel("Sounded Speed", 10, 167, 144, 17)

	$label4 = GUICtrlCreateLabel("USE QUOTES FOR FILENAMES WITH SPACES <3", 90, 45, 400, 17)
	$button1 = GUICtrlCreateButton("GO", 10, 195, 380, 30)
	$button99 = GUICtrlCreateButton("QUIT", 10, 225, 380, 30)
	$progress1 = GUICtrlCreateProgress(10, 8, 380, 25)
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###
	GUISetState(@SW_SHOW)


	While 1
		$msg = GUIGetMsg()
		If $msg = $gui_event_close Then ExitLoop
		If $msg = $button1 Then button1()
		If $msg = $button99 Then button99()
WEnd
EndFunc 

Func button99()
	ConsoleWrite('@@ (106) :(' & @MIN & ':' & @SEC & ') button99()' & @CR) ;### Function Trace
	GUISetState(@SW_DISABLE)
		kill()
EndFunc

Func button1()
	ConsoleWrite('@@ (106) :(' & @MIN & ':' & @SEC & ') button1()' & @CR) ;### Function Trace
	GUISetState(@SW_DISABLE)
		rscript()
EndFunc


Func kill()
	ConsoleWrite('@@ (138) :(' & @MIN & ':' & @SEC & ') kill()' & @CR) ;### Function Trace
	Opt("SendKeyDelay", 0)
	Opt("SendKeyDownDelay", 0)
	Sleep(50)
	Send(" ")
	Send("{ENTER}")
	Sleep(30)
	Exit
EndFunc 

Func rscript()
	ConsoleWrite('@@ (150) :(' & @MIN & ':' & @SEC & ') rscript()' & @CR) ;### Function Trace
	GUICtrlSetData($progress1, 100)
	$rndvarprog = False
	$infile = GUICtrlRead($input1)
	$outfile = GUICtrlRead($input3)
	$soundspeed = GUICtrlRead($input4)
	$silentspeed = GUICtrlRead($input10)
	Opt("SendKeyDelay", 0)
	Opt("SendKeyDownDelay", 0)
	Opt("TrayAutoPause", 1)
	GUICtrlSetData($progress1, 0)
	FileWrite ( "cmdstore.bat", "python jumpcutter.py --input_file ")
	FileWrite ( "cmdstore.bat", $infile)
	FileWrite ( "cmdstore.bat", " --output_file ")
	FileWrite ( "cmdstore.bat", $outfile )
	FileWrite ( "cmdstore.bat", " --sounded_speed ")
	FileWrite ( "cmdstore.bat", $soundspeed )
	FileWrite ( "cmdstore.bat", " --silent_speed ")
	FileWrite ( "cmdstore.bat", $silentspeed )
	RunWait("cmdstore.bat")
	FileDelete ( "cmdstore.bat" )
	Exit
EndFunc
