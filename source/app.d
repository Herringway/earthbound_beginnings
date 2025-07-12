import earthboundbeginnings.bank1f;
import earthboundbeginnings.commondefs;
import earthboundbeginnings.external;

import std.conv;
import std.functional;
import std.getopt : defaultGetoptPrinter, getopt;
import std.logger;
import std.meta;
import std.typecons;

alias loadableDataModules = AliasSeq!();

void handleNullableOption(alias var)(string, string value) {
	var = value.to!(typeof(var.get));
}
int main(string[] args) {
	bool verbose;
	bool forceAssetExtraction;
	Nullable!bool noIntro;
	Nullable!ubyte autoLoadFile;
	Nullable!bool debugMenu;
	string logFile;
	auto help = getopt(args,
		"verbose|v", "Print extra information", &verbose,
		"logfile|l", "Log to file", &logFile,
		"forceassetextraction|t", "Force asset extraction", &forceAssetExtraction,
	);
	if (help.helpWanted) {
		defaultGetoptPrinter("Earthbound.", help.options);
		return 2;
	}
	if (logFile) {
		sharedLog = cast(shared)new FileLogger(logFile, LogLevel.info);
	}
	if (verbose) {
		(cast()sharedLog).logLevel = LogLevel.trace;
	}
	nes.entryPoint = &reset;
	nes.interruptHandlerVBlank = &unknownF79F;
	nes.title = "Earthbound Beginnings";
	//nes.matchingInternalID = "EARTH BOUND          ";
	//nes.gameID = "earthbound";
	//nes.gameStateDumper = (&dumpGameState).toDelegate;
	//nes.debugMenuRenderer = (&prepareDebugUI).toDelegate;
	//nes.gameStateMenu = (&renderDebugWindow).toDelegate;
	auto config = nes.loadSettings!GameConfig();
	nes.initialize();
	//nes.initializeAudio(&spc, &audioCallback);
	//nes.handleAssets!loadableDataModules(&extractExtraData, &loadExtraData);
	//loadROMData(nes.assets);
	//uncomment when we have something to save
	//scope(exit) nes.saveSettings(config);
	nes.run();
	return 0;
}
