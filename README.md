# Destrier Box Template

Template repository for creating and submitting challenge boxes for [Destrier](https://destrier.io).


## What's included

- `schemas/box.schema.json` - schema for `box.yaml`
- `templates/` - starter templates for container, virtual machine, and network boxes
- `examples/` - complete working examples for each box type


## Create your box

1. Select **Use this template** > **Create a new repository**.
2. Set the repository to **Private**.
3. Choose a starter from `templates/` and create your box.
4. Follow the [Destrier contributor guide](https://docs.destrier.io/contributing/box-structure) to configure, lint, build, and submit it.

> Always keep your box and related challenge materials **private, including after submission**. Paid contributors may also be required to sign a **confidentiality agreement**.

Each `box.yaml` declares an `id`, the box's permanent slug. It does not name a competition. A published box is private to the workspace that submitted it; to let a competition use it, grant it to the organiser's workspace from the box's **Sharing** panel on Destrier, and the organiser decides which stage it goes into. See [Competitions and access](https://docs.destrier.io/contributing/box-structure#competitions-and-access).

Do not add `competitionId`. It is deprecated, `boxr box lint` warns about it, and a slug in it that names no competition is silently ignored, so the box joins nothing and nobody is told.

`box.yaml` does not declare cost budgets or evaluation timeouts. Destrier derives those from stage policy, box difficulty, and competition settings.


## Lint and submit

CI automatically validates your box whenever you push changes. You can also lint it locally before submitting it.

First, sign in to the Destrier CLI:

```shell
boxr login
```

Then run the following commands from your box directory, or pass the box directory as `[dir]`:

```shell
boxr box lint [dir]
boxr box build [dir]
boxr box submit [dir]
boxr box status [dir]
```

Run any command with `--help` to view its usage and available options:

```shell
boxr box submit --help
```

Container hosts are built using **Docker**. `boxr box submit` publishes container hosts, uploads virtual machine disk images, and opens the submission.

Virtual machine hosts ship a prebuilt disk image: point `build.image` at it and `boxr box submit` uploads it with the rest of the box. Domain controllers are always provided this way because they are never built from source.


## Documentation

For the full contribution workflow, see the [Destrier contributor documentation](https://docs.destrier.io/contributing/overview).
