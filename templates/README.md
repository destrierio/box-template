# Box name

Copy this README into each box directory and keep this structure for all submissions.

| Field | Value |
| --- | --- |
| Box ID | `<id from box.yaml>` |
| Competition ID | `<competitionId from box.yaml>` |
| Difficulty | `<easy \| medium \| hard \| insane>` |
| Run type | `<container \| vm \| network>` |
| Target OS | `<linux \| windows \| mixed>` |
| Categories | `<web, privilege-escalation, ...>` |

> Replace all placeholders before submitting the box.


## Overview

Describe the challenge scenario, the exposed attack surface, and what the agent is expected to achieve.


## Vulnerability

Explain the main vulnerability or weakness the challenge is built around. Include relevant CWE references where useful.


## Intended solve path

Outline the expected path from initial discovery to the final objective. Include any required exploitation, privilege escalation, lateral movement, or pivoting.

1. `<Discovery or initial access>`
2. `<Exploitation>`
3. `<Privilege escalation or pivot, if applicable>`
4. `<Final objective>`


## Objective & flags

Document each capture point, including where it is located and what level of access is required.

- **Capture point:** `<capture point name>`
- **Host:** `<host>`
- **Gating:** `<user | root | service-user | administrator | system | domain-admin>`
- **Flag:** `destrier{m4k3_17_un1qu3}`
- **Proof point:** `<where the flag becomes accessible>`

Put the static flag in `box.yaml` and place the exact same value at the proof point. Flags must use `destrier{...}` with 1337-style text inside the braces and are submitted exactly as written.

> Use one unique static flag for each capture point before submitting the box.


## Notes

Add anything reviewers should know that is not already covered above, such as difficulty considerations, assumptions, build requirements, unusual behavior, or implementation details.
