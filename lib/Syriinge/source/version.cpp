#include "version.h"
#include <printf.h>
#include <sscanf.h>

namespace Syringe {
    Version::Version(const char* versionStr)
    {
        sscanf(versionStr, "%d.%d.%d", &this->major, &this->minor, &this->revision);
    }
    bool operator<(const Version& lh, const Version& rh)
    {
        if (rh.major > lh.major)
            return true;

        if (rh.minor > lh.minor)
            return true;

        if (rh.revision > lh.revision)
            return true;

        return false;
    }
    bool operator==(const Version& lh, const Version& rh)
    {
        return lh.major == rh.major && lh.minor == rh.minor && lh.revision == rh.revision;
    }
    bool operator!=(const Version& lh, const Version& rh)
    {
        return lh.major != rh.major && lh.minor != rh.minor && lh.revision != rh.revision;
    }

    void versionToString(const Version& version, char* buffer)
    {
        sprintf(buffer, "%d.%d.%d", version.major, version.minor, version.revision);
    }
} // namespace Syringe