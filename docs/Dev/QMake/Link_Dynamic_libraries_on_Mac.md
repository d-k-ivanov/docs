### Pri file example

```bash
include(Base.pri)

# Loading folder with our libraries and libraries itself:
LIBS += -L"path/to/macosx/lib" -lone.1 -ltwo.2 -lthree.3

# All Mac related stuff should be kept in separate section:
mac {
    # Creating list of libraries to deploy in APPLICATION.App/Contents/Frameworks
    SupaLib.files += path/to/macosx/lib/libone.1.dylib
    SupaLib.files += path/to/macosx/lib/libtwo.2.dylib
    SupaLib.files += path/to/macosx/lib/libthree.3.dylib

    # Destination path for third-party libraries
    SupaLib.path = Contents/Frameworks

    # Add this libraries to final output bundle
    QMAKE_BUNDLE_DATA += SupaLib

    # Need to be sure that application will know about location of libraries
    QMAKE_RPATHDIR += @executable_path/../Frameworks
}
```