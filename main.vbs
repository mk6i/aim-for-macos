Option Explicit

Dim objFSO, objShell
Dim aimPath, aimInstallerPath, aimURL

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objShell = CreateObject("WScript.Shell")

' Check if AIM95 is installed
aimPath = "C:\Program Files (x86)\AIM95\aim.exe"
aimInstallerPath = "C:\aim513036.exe"
aimURL = "http://archive.org/download/aim513036/aim513036.exe"

If objFSO.FileExists(aimPath) Then
    ' AIM95 is installed, execute the file
    objShell.Exec(aimPath)
ElseIf objFSO.FileExists(aimInstallerPath) Then
    ' AIM installer exists, run it
    objShell.Exec(aimInstallerPath)
Else
    Dim intMsgBoxResult
    intMsgBoxResult = MsgBox("AIM 5.1.3036 will be downloaded from archive.org. Do you want to continue?", vbYesNo + vbQuestion, "Confirm Download")
    If intMsgBoxResult = vbYes Then
        ' Download AIM installer using wget and run it
        DownloadWithWget aimURL, aimInstallerPath
        objShell.Exec(aimInstallerPath)
    End If
End If

Set objFSO = Nothing
Set objShell = Nothing

Sub DownloadWithWget(url, destination)
    Dim wgetCmd, exitCode

    ' Build the wget command
    wgetCmd = "wget.exe -O """ & destination & """ """ & url & """"

    ' Run the wget command and wait for it to complete, capturing the exit code
    exitCode = objShell.Run("cmd /c " & wgetCmd, 1, True)

    ' Check if the exit code indicates an error (non-zero)
    If exitCode <> 0 Then
        ' An error occurred, so check if the file exists and delete it if it does
        If objFSO.FileExists(destination) Then
            objFSO.DeleteFile(destination)
        End If

        ' Optionally, display an error message to the user
        MsgBox "Failed to download the file. Please check your internet connection or the URL and try again.", vbExclamation, "Download Error"
    End If
End Sub

