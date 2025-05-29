# create-dmg
Docker image for MacOS DMG file creation

# Usage

```bash
docker pull ghcr.io/cardinalby/create-dmg:latest
docker run \
    -v ./example/src:/src \
    -v ./example/out:/out \
    ghcr.io/cardinalby/create-dmg:latest \
    MyVolume \
    /src \
    /out/out.dmg
```

# Options

Set `APPLICATIONS_SYMLINK` environment variable to `true` to add "Applications" symlink to the DMG image.
(MacOS dmg files usually have this symlink so that user can drag-and-drop the app to the Applications folder)

```bash