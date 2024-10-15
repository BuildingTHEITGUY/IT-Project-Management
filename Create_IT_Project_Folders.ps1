# Root folder for the project
$rootFolder = "C:\IT_Projects\Project_Lifecycle"

# Array of folders to be created under the root
$folders = @(
    "01_Project_Initiation",
    "02_Project_Planning",
    "03_Project_Execution",
    "04_Risk_Issue_Management",
    "05_Project_Monitoring_Control",
    "06_Project_Closure",
    "07_Project_Documentation",
    "08_Financial_Management",
    "09_Compliance_Legal",
    "10_Communication_Collaboration"
)

# Sub-folders and files under each folder
$subFolders = @{
    "01_Project_Initiation" = @("Project_Charter", "Stakeholder_Register", "Business_Case", "Feasibility_Study", "Approval_Documentation")
    "02_Project_Planning" = @("Project_Plan", "WBS", "Risk_Management_Plan", "Resource_Allocation_Plan", "Communication_Plan", "Quality_Management_Plan", "Budget_Plan")
    "03_Project_Execution" = @("Change_Requests", "Task_Assignments", "Meeting_Minutes", "Progress_Reports", "Vendor_Contracts_SLAs", "Training_Materials")
    "04_Risk_Issue_Management" = @("Risk_Register", "Issue_Log", "Incident_Reports")
    "05_Project_Monitoring_Control" = @("Performance_Reports", "Gantt_Charts", "Change_Log", "Test_Plans", "Audit_Reports")
    "06_Project_Closure" = @("Final_Project_Report", "Lessons_Learned_Document", "Client_Stakeholder_Sign_Off", "Project_Closure_Checklist", "Post_Implementation_Review")
    "07_Project_Documentation" = @("Technical_Documentation", "User_Manuals", "Configuration_Files", "Backup_Recovery_Plan")
    "08_Financial_Management" = @("Budget_Tracking", "Invoices_Receipts", "Cost_Benefit_Analysis")
    "09_Compliance_Legal" = @("Compliance_Checklist", "Licensing_Agreements", "Legal_Approvals")
    "10_Communication_Collaboration" = @("Emails_Correspondence", "Stakeholder_Presentations", "Feedback_Surveys")
}

# Create the root folder if it does not exist
if (-Not (Test-Path -Path $rootFolder)) {
    New-Item -Path $rootFolder -ItemType Directory
}

# Create the main project lifecycle folders and subfolders
foreach ($folder in $folders) {
    $folderPath = Join-Path $rootFolder $folder
    if (-Not (Test-Path -Path $folderPath)) {
        New-Item -Path $folderPath -ItemType Directory
    }
    
    # Create subfolders inside the main folders
    if ($subFolders.ContainsKey($folder)) {
        foreach ($subfolder in $subFolders[$folder]) {
            $subfolderPath = Join-Path $folderPath $subfolder
            if (-Not (Test-Path -Path $subfolderPath)) {
                New-Item -Path $subfolderPath -ItemType Directory
            }
        }
    }
}

Write-Host "Folders have been successfully created at $rootFolder"
