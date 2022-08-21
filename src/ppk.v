import os

fn main() {
	args := os.args[1..]
	println(parse_command(args))
}

fn parse_command(args []string) string {
	command := args[0]
	command_args := args[1..]

	return match command {
		'install' { install(command_args) }

		else {
			'Unknown command: $command'
		}
	}
}

fn install(args []string) string {
	if args.len == 0 {
		return 'Expected package name'
	}

	unsafe { os.mkdir('pobre_modules') }

	package := args[0]
	
	mut file := os.create('pobre_modules/${package}.pbr') or {
		return 'Failed to write file'
	}

	file.writeln('work 10/60/60\n\nstamp PobreLang/Hello\n  scream Hello mom!\n  goback\n') or {
		return 'Failed to write file'
	}

	defer {
		file.close()
	}

	return 'Package installed: $package'
}
