require('telescope').setup{
    defaults = { 
        file_ignore_patterns = {
            "__pycache__",
            ".venv",
            ".mypy_cache",
            ".git/",
            ".pytest_cache",
        }
    }, 
    pickers = {
        find_files = {
            no_ignore = true
        }
    }
}


