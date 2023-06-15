# McServerDocker

Donload the preferred `forge-X.XX.X-X.XX.X-installer.jar` (from [Minecraft Forge](https://files.minecraftforge.net/net/minecraftforge/forge/)).
then run 
```bash
docker build . --build-arg="jar_location=./{pathtoyourjarfile}"
```

Additionally you can specify the users UserId with `UID` and GroupId with `GID` as `build-arg` respectively.
