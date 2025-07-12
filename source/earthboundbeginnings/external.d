module earthboundbeginnings.external;

import replatform64.assets;
import replatform64.backend.common;
import replatform64.nes;

import std.concurrency;

__gshared NES nes;

void loadExtraData(scope const char[] name, const scope ubyte[] data, scope PlatformBackend) {}
void extractExtraData(scope AddFileFunction addFile, scope ProgressUpdateFunction reportProgress, immutable(ubyte)[] rom) {}
