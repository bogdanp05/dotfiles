Things fixed:
- show .files and .dirs in nvim tree DONE
- set python interpreter DONE
example `pyrightconfig.json` at the root of the project:
```json
{
    "venvPath": "path/to/your/venv",
    "venv": ".venv",
}
```
OR just activate the venv in the terminal before starting nvim
- nvim tree show gitignored files DONE
- nvim tree does not expand .venv DONE 
- telescope stop ignoring .files DONE 
- comment line shortcut DONE
- indent line shortcut DONE


To do:
- [x] expand dir in nvim tree
- [ ] format on save
- [ ] configure linter
- [ ] stop switching tree on the right
- [ ] rebase from terminal
- [ ] display .files shaded
- [ ] fuzzy finder not finding .gitlab-ci.yml
- start terminal with size 20
- case insensitive search 
- case insensitive cmd search
- autoreload nvim config
- expand tree when opening file
- git plugin
- spellchecker 
- purge line from git history
- `.md` previewer
