#include <iostream>
#include <dlfcn.h>

typedef int (*apfs_delete_func) (const char * dev_name);
extern int container_iouc_internal(int a1, char *a2, int a3, unsigned int *a4);

int apfs_delete_fs(const char * dev_name){
    int ret;
    void *handle = dlopen("/System/Library/PrivateFrameworks/APFS.framework/APFS", RTLD_GLOBAL | RTLD_NOW);
    if (handle == NULL) {
        return -1;
    }
    apfs_delete_func func = (apfs_delete_func)dlsym(handle, "APFSVolumeDelete");
    ret = func ? func(dev_name) : -1;
    dlclose(handle);
    return ret;
}
 

int main() {
    std::string dev;
    std::cout << "Input device's name: ";
    std::cin >> dev;

	std::cout << apfs_delete_fs(dev.c_str()) << "\n";
	return 0;
}