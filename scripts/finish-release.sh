#!/usr/bin/env bash
set -euo pipefail

# Finish release setup for n8n-nodes-deepseek-vn
# Run from the repository root after completing GitHub and npm authentication.

export PATH="$HOME/.local/bin:$PATH"

echo "==> 1. Refresh GitHub auth with workflow scope (required for CI workflows)"
echo "    gh auth refresh -h github.com -s workflow"
echo ""

echo "==> 2. Configure git to use gh credentials"
gh auth setup-git
git remote set-url origin https://github.com/bbrandao/n8n-nodes-deepseek-vn.git

echo "==> 3. Push feature branch"
git push -u origin feature/deepseek-thinking-json-output

echo "==> 4. Open and merge PR to master"
gh pr create \
  --base master \
  --head feature/deepseek-thinking-json-output \
  --title "Release v1.0.0: Thinking Mode and JSON Output" \
  --body "Initial public release of n8n-nodes-deepseek-vn with Thinking Mode and JSON Output controls."

gh pr merge --merge --delete-branch

echo "==> 5. Rename default branch to main (optional)"
git checkout master
git branch -m main
git push -u origin main
gh repo edit bbrandao/n8n-nodes-deepseek-vn --default-branch main
git push origin --delete master || true

echo "==> 6. Create and push tag"
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0

echo "==> 7. Create GitHub Release"
gh release create v1.0.0 \
  --title "v1.0.0" \
  --notes-file CHANGELOG.md

echo "==> 8. Publish to npm (requires npm login or NPM_TOKEN secret in GitHub)"
echo "    npm login"
echo "    npm publish"
echo ""
echo "    Or set NPM_TOKEN in GitHub repo secrets and let the tag trigger the publish workflow."

echo "==> 9. Install in n8n"
echo "    Settings -> Community Nodes -> Install -> n8n-nodes-deepseek-vn"

echo "==> 10. Re-enable required status checks on main/master"
echo "     After CI workflow is on the remote, enable 'build-and-lint' in branch protection."
