import toml
import urllib.request
import os
saveName='Cargo.toml'
localFile='geph4Version'
def delfile():
    if os.path.exists(saveName):
        os.remove(saveName)
# Download Cargo.toml
gephTomlUrl='https://github.com/geph-official/geph4/raw/master/geph4-client/Cargo.toml'
urllib.request.urlretrieve(gephTomlUrl,saveName)
# Get Geph4 Version
readFile=open(saveName,'r')
cargoToml=toml.loads(readFile.read())
geph4Version=cargoToml['package']['version']
print(geph4Version)
readFile.close()
# Check Version
if os.path.exists(localFile):
    localVer=open(localFile)
    if localVer.read() == geph4Version:
        print("Already the latest version")
        localVer.close()
        delfile()
else:
    # Write geph4Version
    f=open(localFile,'w')
    f.write(geph4Version)
    f.close()
    delfile()
    # Git commit
    os.system("git add -A && git commit -am 'update to %s'" %geph4Version)
    os.system("git tag v%s && git push && git push origin --tags" %geph4Version)