
# HelloID-Task-SA-Target-NTFS-FolderCreate

## Prerequisites
- HelloID Directory Agent
- The HelloID Service account requires the following permissions:
  - Write Access on the folder ([NTFS permissions](https://docs.microsoft.com/en-us/iis/web-hosting/configuring-servers-in-the-windows-web-platform/configuring-share-and-ntfs-permissions#:~:text=To%20configure%20permissions%20for%20the%20folder%20structuree), so not Share permissions on the Share).
  - When applicable Write Access on the folder/share itself ([Share permissions](https://docs.microsoft.com/en-us/iis/web-hosting/configuring-servers-in-the-windows-web-platform/configuring-share-and-ntfs-permissions#:~:text=To%20configure%20permissions%20for%20the%20share), not NTFS permissions on the folder(s)).

## Description

This code snippet executes the following tasks:

1. Define a hash table `$formObject`. The keys of the hash table represent the properties for the `New-Item` cmdlet, while the values represent the values entered in the form.

> To view an example of the form output, please refer to the JSON code pasted below.

```json
{
    "DisplayName": "Sales2",
    "Path": "\\\\contoso.local\\Storage\\Projects\\"
}
```
> :exclamation: It is important to note that the names of your form fields might differ. Ensure that the `$formObject` hashtable is appropriately adjusted to match your form fields. More about the cmdlet `New-Item -ItemType Directory` [See the Microsoft Docs page](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/new-item?view=powershell-7.3#-itemtype)

2. Verify if the provided parent folder exists

3. Calls the New-Item cmdlet with the switch -ItemType Directory to create the new NTFS Folder



