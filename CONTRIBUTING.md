# Contributing

Thank you for your interest in contributing to `n8n-nodes-deepseek-vn`!

## Getting Started

1. Fork the repository on GitHub
2. Clone your fork locally
3. Create a feature branch from `main`
4. Make your changes
5. Run validation locally:

```bash
npm ci
npm run build
npm run lint
```

6. Open a Pull Request against `main`

## Pull Request Guidelines

- Keep changes focused and well-described
- Update `README.md` and `CHANGELOG.md` when adding user-facing features
- Ensure `npm run build` and `npm run lint` pass before submitting
- Use clear commit messages in English

## Reporting Issues

- Use the [Bug Report](https://github.com/bbrandao/n8n-nodes-deepseek-vn/issues/new?template=bug_report.yml) template for bugs
- Use the [Feature Request](https://github.com/bbrandao/n8n-nodes-deepseek-vn/issues/new?template=feature_request.yml) template for enhancements
- Do **not** report security vulnerabilities as public issues — see [SECURITY.md](SECURITY.md)

## Code Style

- TypeScript with strict mode
- ESLint rules from `eslint-plugin-n8n-nodes-base`
- Prettier for formatting (`npm run format`)

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
