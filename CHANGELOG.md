# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2026-07-08

### Changed

- Renamed internal node identifier to `deepSeekVn` and display name to **DeepSeek VN** to avoid conflicts when `n8n-nodes-deepseek` is already installed
- Renamed credential type to `deepSeekVnApi` (**DeepSeek VN API**)

## [1.0.0] - 2026-07-08

### Added

- Initial public release as `n8n-nodes-deepseek-vn`
- **Thinking Mode** toggle for Chat Completion (`thinking: { type: "enabled" | "disabled" }`)
- **JSON Output** boolean toggle replacing manual Response Format field (`response_format: { type: "json_object" }`)
- Chat Completion and FIM Completion (beta) support
- CI workflow for build and lint on pull requests
- npm publish workflow triggered by version tags

### Changed

- Forked from [rubickecho/n8n-deepseek](https://github.com/rubickecho/n8n-deepseek) with updated package metadata and documentation

[1.0.1]: https://github.com/bbrandao/n8n-nodes-deepseek-vn/releases/tag/v1.0.1
[1.0.0]: https://github.com/bbrandao/n8n-nodes-deepseek-vn/releases/tag/v1.0.0
