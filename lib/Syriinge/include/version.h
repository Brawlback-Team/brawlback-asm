#pragma once

#define SYRINGE_VERSION "0.5.1"

namespace Syringe {
    class Version {
    public:
        Version(const char* versionStr);
        friend bool operator<(const Version& lh, const Version& rh);
        friend bool operator==(const Version& lh, const Version& rh);
        friend bool operator!=(const Version& lh, const Version& rh);

        int major, minor, revision;
    };

    void versionToString(const Version& version, char* buffer);
}