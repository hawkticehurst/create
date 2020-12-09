# Create CLI

A tiny CLI for creating boilerplate software projects.

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
