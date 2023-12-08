# ODT_batch
ODT_batch is a batch file that further streamlines [Office Deployment Tool][1] (ODT).
The ODT is a ... "*command-line tool that you can use to download and deploy Microsoft 365 Apps to your client computers. The ODT gives you more control over an Office installation: you can define which products and languages are installed, how those products should be updated, and whether or not to display the install experience to your users.*"

ODT_batch is a batch file wrapper for calling the ODT setup and pulling the appropriate configuration file for deploying ***lean*** Microsoft Office.

ODT has room for further customisation to fit individuals. 
For enterprise administrators, Microsoft has an online web-based [Office Customization Tool on its Microsoft 365 Apps admin center][2].   
PS: Individuals (private users) are at liberty to use the web customisation tool to generate their own configuration file.
Bear in mind that the configuration would normally be exported in XML. Once downloaded, 
- copy the configuration file; and
- the ODT_batch batch file (.bat) to the folder with the [ODT][3] setup folder
- customise the ODT_batch file
- run the ODT_batch file in Command Prompt or PowerShell

NB: default setting in the ODT_batch file and configuration file
- down Microsoft Office excluding Groove
- install Microsoft Office in silent mode (without GUI) excluding
    - Access;
    - Excel
    - Grove;
    - Lync;
    - OneNote;
    - Outlook;
    - PowerPoint;
    - Publisher; and
    - MS Teams


[1]: https://learn.microsoft.com/en-gb/deployoffice/overview-office-deployment-tool
[2]: https://config.office.com/deploymentsettings
[3]: https://go.microsoft.com/fwlink/p/?LinkID=626065 
