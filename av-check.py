import psutil

def main():
    status = False
    print("[+] Antivirus check is running .. ")
    
    av_check = [
        "MsMpEng.exe", "AdAwareService.exe", "afwServ.exe", "avguard.exe", "AVGSvc.exe",
        "bdagent.exe", "BullGuardCore.exe", "ekrn.exe", "fshoster32.exe", "GDScan.exe",
        "avp.exe", "K7CrvSvc.exe", "McAPExe.exe", "NortonSecurity.exe", "PavFnSvr.exe",
        "SavService.exe", "EnterpriseService.exe", "WRSA.exe", "ZAPrivacyService.exe"
    ]
    
    for process in psutil.process_iter(['pid', 'name']):
        if process.info['name'] in av_check:
            print("--AV Found: {}".format(process.info['name']))
            status = True
    
    if not status:
        print("--AV software is not found!")

if __name__ == "__main__":
    main()
