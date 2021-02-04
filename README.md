<h1 align="center">Create CLI</h1>

<h4 align="center">A tiny CLI for creating new software projects using both popular and custom boilerplates.</h4>

<p align="center">
  <a href="#command-usage">Command Usage</a>&nbsp;|&nbsp;<a href="#technology-flags">Technology Flags</a>&nbsp;|&nbsp;<a href="#custom-templates">Custom Templates</a>&nbsp;|&nbsp;<a href="#license">License</a>&nbsp;
</p>

## Command Usage 
```
create <project-name> <technology-flag>
```

## Technology Flags
```
--react         Create a basic React project.
--react-ts      Create a React + TypeScript project.
--svelte        Create a basic Svelte project.
--svelte-ts     Create a Svelte + TypeScript project.
--fast-el       Create a FAST Element + TypeScript project.
--fast-fo       Create a FAST Foundation + TypeScript project.
--fast-ds       Create a FAST Design System + TypeScript project.
--web           Create a basic vanilla website project.
--node          Create a Node + Express project.
--python        Create a Python Poetry project.
--go            Create a basic Golang project.
--rust          Create a basic Rust project.
--electron      Create a basic Electron project.
```

## Setting Up The CLI
In order to use the CLI a couple steps must be taken:

1. Navigate to directory where the `create.sh` script lives
2. Update the `TEMPLATEPATH` variable in `create.sh` to reflect your own local file system
3. Open a terminal and navigate to this directory and run the command `chmod u+x create.sh`
4. Open your shell config file and make sure this project directory is exported to PATH
5. Finally, add an alias to the shell config file: `alias create='sh create.sh'`

## Custom Templates
Custom templates can be defined in the [templates](./templates) directory and downloaded locally.

## License

[MIT](LICENSE)