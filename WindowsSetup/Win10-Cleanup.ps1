$appstoremove = "Microsoft.BioEnrollment","Microsoft.Windows.Photos","Microsoft.windowscommunicationsapps","Microsoft.Windows.ParentalControls","Microsoft.Windows.PeopleExperienceHost","Microsoft.Windows.PinningConfirmationDialog","Microsoft.Windows.SecHealthUI","Microsoft.Windows.CapturePicker","Microsoft.Windows.NarratorQuickStart","Microsoft.XboxGameCallableUI","Microsoft.Windows.XGpuEjectDialog","Microsoft.Windows.SecureAssessmentBrowser","Microsoft.Windows.CallingShellApp","Microsoft.CredDialogHost","Microsoft.WindowsAlarms","Microsoft.SkypeApp","Microsoft.Wallet","Microsoft.ZuneVideo","Microsoft.ZuneMusic","Microsoft.YourPhone","Microsoft.XboxSpeechToTextOverlay","Microsoft.XboxIdentityProvider","Microsoft.XboxGamingOverlay","Microsoft.XboxGameOverlay","Microsoft.XboxApp","Microsoft.Xbox.TCUI","Microsoft.WindowsSoundRecorder","Microsoft.WindowsFeedbackHub","Microsoft.ScreenSketch","Microsoft.People","Microsoft.MixedReality.Portal","Microsoft.MicrosoftSolitaireCollection","Microsoft.MicrosoftOfficeHub","Microsoft.Microsoft3DViewer","Microsoft.Getstarted","Microsoft.GetHelp","Microsoft.BingWeather"
$appstoremove | foreach-object{Get-AppxPackage $_ | Remove-AppxPackage}