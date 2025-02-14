import os, sys
if sys.platform == "win32":
    scipyenvdir = os.getenv("VIRTUAL_ENV")
    if scipyenvdir is None:
        sys.exit("You are NOT inside a virtual Python environment")

    scipyen_sdk_dir = scipyenvdir+"_sdk"

    scipyenvbin     = os.path.join(scipyenv_sdk_dir,"bin")
    scipyenvlib     = os.path.join(scipyenv_sdk_dir,"lib")
    scipyenvlib64   = os.path.join(scipyenv_sdk_dir,"lib64")

    if os.path.isdir(scipyenvbin):
        os.add_dll_directory(scipyenvbin)
    else:
        print(f"{scipyenvbin} directory not found; functionality will be limited")
    if os.path.isdir(scipyenvlib):
        os.add_dll_directory(scipyenvlib)
    else:
        print(f"{scipyenvlib} directory not found; functionality will be limited")
    if os.path.isdir(scipyenvlib64):
        os.add_dll_directory(scipyenvlib64)
    else:
        print(f"{scipyenvlib64} directory not found; functionality will be limited")

    del scipyenvbin, scipyenvlib, scipyenvlib64
