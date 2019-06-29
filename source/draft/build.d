module draft.build;

import std.process, std.stdio;


enum CommandOk = CommandResult(true, "", );
enum BuildOk = BuildResult(0);

enum ResultFlag
{
	Check,
	Compile,
	Link,
	Deploy,
	Clean,
	Test
}

enum BuildOption
{
	Default,
	CleanExistingDirecory
}

struct CommandResult
{
	bool success;
	string output = "";
	int returnCode;
}



struct BuildResult
{
	bool success;
	int payload = 0;
	/*
	// TODO define bit position
	void flag(ResultFlag)(bool success)
	{
		auto pos = 0;
		payload |= (success >> pos);
	}
	*/
}

struct BuildCommand
{
	string program;
	string[] options;
	string[] args() { return program ~ options;};
	bool function() onStart;
	CommandResult function() onError;
	
}

CommandResult check()
{
	return CommandOk;
}

CommandResult compile()
{

	BuildCommand command = {program: "ls", options:["-al"]};
	auto pid = spawnProcess(command.args);
	auto errorCode = wait(pid);
	return CommandOk;
}

CommandResult link()
{
	return CommandOk;
}

CommandResult deploy()
{
	return CommandOk;
}

CommandResult clean()
{
	return CommandOk;
}

CommandResult test()
{
	return CommandOk;
}

BuildResult build(string directoryPath, BuildOption option = BuildOption.Default)
{
	check();

	compile();
	
	link();

	deploy();

	clean();
	
	return BuildOk;
}
