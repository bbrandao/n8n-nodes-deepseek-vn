# n8n-nodes-deepseek-vn

[![npm version](https://img.shields.io/npm/v/n8n-nodes-deepseek-vn.svg)](https://www.npmjs.com/package/n8n-nodes-deepseek-vn)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A community node for [n8n](https://n8n.io/) that integrates [DeepSeek AI](https://www.deepseek.com/) into your workflows.

This project is a maintained fork of [rubickecho/n8n-deepseek](https://github.com/rubickecho/n8n-deepseek), extended with **Thinking Mode** and **JSON Output** controls. It is published under the MIT license.

## Features

- **Chat Completion** — Create model responses for chat conversations via `POST /chat/completions`
- **FIM Completion (Beta)** — Fill-In-the-Middle completions via `POST /beta/completions`
- **Thinking Mode** — Toggle chain-of-thought reasoning before the final answer ([docs](https://api-docs.deepseek.com/guides/thinking_mode))
- **JSON Output** — Force structured JSON responses with a simple boolean toggle ([docs](https://api-docs.deepseek.com/guides/json_mode))
- **Simplify Output** — Return a simplified response instead of raw API data

## Installation

### Via n8n UI (recommended)

1. Open your n8n instance
2. Go to **Settings → Community Nodes**
3. Click **Install**
4. Enter the npm package name:

   ```
   n8n-nodes-deepseek-vn
   ```

5. Accept the risk acknowledgment and click **Install**
6. Restart n8n if prompted

### Via npm (self-hosted)

Follow the [n8n community nodes installation guide](https://docs.n8n.io/integrations/community-nodes/installation/).

## Credentials

1. Obtain an API key from the [DeepSeek Platform](https://platform.deepseek.com/api_keys)
2. In n8n, create a new **DeepSeek API** credential
3. Paste your API key and save

The node connects to `https://api.deepseek.com`.

## Usage

Add a **DeepSeek** node to your workflow, select the resource and operation, then configure the parameters.

### Chat Completion

| Parameter | Description |
|---|---|
| **Model** | DeepSeek model to use (loaded dynamically from the API) |
| **Thinking Mode** | When enabled, sends `thinking: { type: "enabled" }` to activate chain-of-thought reasoning |
| **Prompt** | System, user, and assistant messages |
| **Simplify** | Return simplified output instead of raw API response |
| **Options** | Temperature, max tokens, penalties, JSON Output, and more |

### JSON Output

When enabling **JSON Output** in Options:

1. The API receives `response_format: { type: "json_object" }`
2. Your system or user prompt **must** include the word `JSON`
3. Provide an example of the expected JSON format in the prompt
4. Set a reasonable **Maximum Number of Tokens** to avoid truncated JSON

Example system prompt:

```
Parse the input and return JSON with "question" and "answer" fields.

EXAMPLE JSON OUTPUT:
{
  "question": "What is the tallest mountain?",
  "answer": "Mount Everest"
}
```

### Thinking Mode

When **Thinking Mode** is enabled:

- The model outputs `reasoning_content` (chain-of-thought) before the final `content`
- Sampling parameters (`temperature`, `top_p`, penalties) have no effect in thinking mode
- See the [Thinking Mode guide](https://api-docs.deepseek.com/guides/thinking_mode) for multi-turn and tool-call behavior

## Local Development

```bash
git clone https://github.com/bbrandao/n8n-nodes-deepseek-vn.git
cd n8n-nodes-deepseek-vn
npm ci
npm run build
npm link
```

Then, in your n8n installation directory:

```bash
npm link n8n-nodes-deepseek-vn
```

Restart n8n to load the node.

### Validation

```bash
npm run build   # TypeScript compile + copy icons
npm run lint    # ESLint checks
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on reporting issues and submitting pull requests.

## Security

To report a vulnerability, see [SECURITY.md](SECURITY.md). Please do **not** open a public issue for security reports.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for release history.

## License

MIT — see [LICENSE.md](LICENSE.md).

This project is derived from [rubickecho/n8n-deepseek](https://github.com/rubickecho/n8n-deepseek). The original copyright notice is preserved in the license file.

## Resources

- [DeepSeek API Documentation](https://api-docs.deepseek.com/)
- [n8n Community Nodes Documentation](https://docs.n8n.io/integrations/community-nodes/)
- [Original project](https://github.com/rubickecho/n8n-deepseek)
- [npm package](https://www.npmjs.com/package/n8n-nodes-deepseek-vn)
