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
--web           Create a basic vanilla website project.
--node          Create a Node + Express project.
--python        Create a Python Poetry project.
--go            Create a basic Golang project.
--rust          Create a basic Cargo project.
--electron      Create a basic Electron project.
```

## Custom Templates
Custom templates can be defined in the [templates](./templates) directory and downloaded locally.

A `TEMPLATEPATH` must also be correctly set within `create.sh` once downloaded locally.

## License

[MIT](LICENSE)