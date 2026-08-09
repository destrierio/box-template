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
4. Follow the [Destrier contributor guide](https://docs.destrier.io/contributing/box-structure) to configure, build, validate, and submit it.

> Always keep your box and related challenge materials **private, including after submission**. Paid contributors may also be required to sign a **confidentiality agreement**.

Each `box.yaml` declares both `competitionId` and `id`. `competitionId` is the competition slug used for storage and submission routing; `id` is the unique box slug within that competition.

`box.yaml` does not declare cost budgets or evaluation timeouts. Destrier derives those from platform policy, such as the box difficulty and competition settings.


## Validate and submit

CI automatically validates your box whenever you push changes. You can also validate it locally before submitting it.

First, sign in to the Destrier CLI:

```shell
boxr login
```

Then run the following commands, replacing `<path>` with the path to your box:

```shell
boxr box validate <path>
boxr box submit <path>
```

Run any command with `--help` to view its usage and available options:

```shell
boxr box submit --help
```

Container hosts are built using **Docker**, while virtual machine hosts are built using **Packer**. `boxr box submit` validates the box, uploads any outstanding image-backed hosts, and opens the submission.

A virtual machine host may instead ship a prebuilt disk image: point `build.image` at it and `boxr box submit` uploads it with the rest of the box. Domain controllers are the one host that **must** be provided this way, because they are never built from source.


## Documentation

For the full contribution workflow, see the [Destrier contributor documentation](https://docs.destrier.io/contributing/overview).