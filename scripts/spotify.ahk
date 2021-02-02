; GLOBAL SETTINGS ===============================================================================================================

#NoEnv
#Persistent
#SingleInstance Force

SetBatchLines -1

global app := { author: "TiPSY", licence: "MIT", ahk: "1.1.32.02", version: "21.02.02", name: "spotify" }

global FilePath := "D:\OBS\Spotify.txt"


; CONTROL MEDIA KEYS ============================================================================================================

#Numpad7::Media_Prev
#Numpad8::Media_Play_Pause
#Numpad9::Media_Next


; SCRIPT ========================================================================================================================

SetTimer, GetCurrentSong, 5000
return


GetCurrentSong:
	if (WinExist("ahk_exe spotify.exe"))
	{
		WinGetTitle, GetSong, % "ahk_exe spotify.exe"
		if (InStr(GetSong, "Spotify"))
			FileWrite(FilePath, "")
		else
			FileWrite(FilePath, " " GetSong)
	}
return


; FUNCTIONS =====================================================================================================================

FileWrite(FileName, FileInput)
{
	if (IsObject(file := FileOpen(FileName, "w", "UTF-8")))
	{
		file.Write(FileInput)
		file.Close()
	}
	return false
}


; ===============================================================================================================================