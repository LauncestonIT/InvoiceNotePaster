::invn::
Gui, Destroy  ; Destroy any existing GUI with the same name to prevent conflicts
; Create a GUI to collect multiple inputs
Gui, Font, S10 Bold
Gui, Add, Text,, Please fill in the invoice details:
Gui, Font
Gui, Add, Text,, Client Name:
Gui, Add, Edit, vClientName w300
Gui, Add, Text,, Labour Description:
Gui, Add, Edit, vLabourDesc w300
Gui, Add, Text,, Parts Information:
Gui, Add, Edit, vParts w300

; Add Submit and Cancel buttons aligned with the input fields
Gui, Add, Button, x10 y+20 w80 h30 gSubmit, Submit
Gui, Add, Button, x+20 w80 h30 gCancel, Cancel  ; Place the Cancel button to the right of the Submit button

Gui, Show,, Invoice Note
Return

Submit:
; Retrieve values from GUI form
Gui, Submit, NoHide

; Check if any mandatory fields are empty
If (ClientName = "" or LabourDesc = "")
{
    MsgBox, Please fill in all mandatory fields (Client Name and Labour Description).
    Return
}

; Close the GUI
Gui, Destroy

; Display a confirmation message before proceeding
MsgBox, 64, Confirmation, Are you sure you want to insert the invoice note?
IfMsgBox, No
    Return

; Get the current date
FormatTime, CurrentDay,, d
FormatTime, CurrentMonth,, MMMM
FormatTime, DayOfWeek,, dddd
FormatTime, CurrentYear,, yyyy

; Determine the ordinal suffix
DaySuffix := SubStr(CurrentDay, -1) = 1 && CurrentDay != 11 ? "st"
          : SubStr(CurrentDay, -1) = 2 && CurrentDay != 12 ? "nd"
          : SubStr(CurrentDay, -1) = 3 && CurrentDay != 13 ? "rd"
          : "th"

FormattedDate := DayOfWeek . " " . CurrentDay . DaySuffix . " of " . CurrentMonth . " " . CurrentYear

; Use SendInput for reliable keystroke sending with better formatting
SendInput, ^b^uINVOICE NOTE^b^u`n  ; Bold and underline "INVOICE NOTE"
SendInput, ^bClient:^b %ClientName%`n
Sleep, 50
SendInput, ^bDate:^b %FormattedDate%`n
Sleep, 50
SendInput, ^bLabour:^b Refer to time entries`n
Sleep, 50
SendInput, ^bLabour Description:^b %LabourDesc%`n
Sleep, 50
SendInput, ^bParts:^b %Parts%
Sleep, 100  ; Ensure all text is properly inserted

; Display the final message
MsgBox, I will faithfully and diligently add my time entries. Thank you!
Return

Cancel:
Gui, Destroy
Return
