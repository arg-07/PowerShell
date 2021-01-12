#Script de agendamento de jobs

Clear-Host

Get-Command -Module PSScheduledJob | Sort-Object Noum

$diario = New-JobTrigger -Daily -At 3am
$umavez = New-JobTrigger -Once -At (Get-Date).AddHours(1)
$semanal = New-JobTrigger -Weekly -DaysOfWeek Monday -At 6pm

Register-ScheduledJob -Name Backup -Trigger $diario -ScriptBlock 
{
Copy-Item C:\Users\*.* C:\concurso -Recurse -Force
}

Get-ScheduledJob Backup