# hey-cicd-devops

CI/CD pipeline demonstration using **GitHub Actions**.

## Workflow Overview

The workflow file is located at [`.github/workflows/hey-cicd.yml`](.github/workflows/hey-cicd.yml).

### Triggers
- **Push** to `main` branch
- **Push** to `feature/*` branches

### Pipeline Jobs
1. **`hello`**: Prints basic environment info (message, system date, OS details).
2. **`build`**: Simulates build execution steps.
3. **`secrets-demo`**: Validates that `DEMO_SECRET` is securely configured.
   - If `DEMO_SECRET` is found: outputs `"Secret is available."`
   - If `DEMO_SECRET` is missing: outputs `"Secret is not configured."` and exits with error code `1`.
4. **`artifact`**: Runs [`build.sh`](build.sh) to generate build files into `build/` and uploads them as a downloadable artifact named `session16-build` using `actions/upload-artifact@v4`.

---

## Configuring `DEMO_SECRET` in GitHub

To make the `secrets-demo` job succeed:

1. Open your repository on GitHub: `https://github.com/Durgaprasad-Developer/hey-cicd-devops`
2. Navigate to **Settings** → **Secrets and variables** → **Actions**.
3. Under **Repository secrets**, click **New repository secret**.
4. Set:
   - **Name**: `DEMO_SECRET`
   - **Secret**: Any secret string (e.g. `my-secure-token-123`)
5. Click **Add secret**.

Once set, subsequent pushes or re-runs of the workflow will pass all 3 jobs.

---

## Local Development

Copy the template to create your local `.env`:
```bash
cp .env.example .env
```
*(The `.env` file is excluded from Git tracking via `.gitignore` to prevent secret leaks.)*