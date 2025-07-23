# FZF Frappe theme
# See helper scripts in ~/.bin/ for other themes

# Latte for darkest theme
export FZF_DEFAULT_OPTS="--color=fg+:#cdd6f4,bg+:#313244,hl+:#f9e2af,fg:#cdd6f4,bg:#1e1e2e,preview-fg:#cdd6f4,preview-bg:#11111b,hl:#a6e3a1,gutter:#1e1e2e,query:#cdd6f4,disabled:#11111b,info:#cba6f7,separator:#11111b,border:#11111b,label:#11111b,prompt:#cba6f7,pointer:#f9e2af,marker:#f5e0dc,spinner:#f5e0dc,header:#f38ba8"

# Frappe for dark theme
# export FZF_DEFAULT_OPTS="--color=fg+:#c6d0f5,bg+:#414559,hl+:#e5c890,fg:#c6d0f5,bg:#303446,preview-fg:#232634,preview-bg:#232634,hl:#a6d189,gutter:#303446,query:#c6d0f5,disabled:#232634,info:#ca9ee6,separator:#232634,border:#232634,label:#232634,prompt:#ca9ee6,pointer:#e5c890,marker:#f2d5cf,spinner:#f2d5cf,header:#e78284"

# Latte for bright theme
# export FZF_DEFAULT_OPTS="--color=fg+:#4c4f69,bg+:#ccd0da,hl+:#df8e1d,fg:#4c4f69,bg:#eff1f5,preview-fg:#dce0e8,preview-bg:#dce0e8,hl:#40a02b,gutter:#eff1f5,query:#4c4f69,disabled:#dce0e8,info:#8839ef,separator:#dce0e8,border:#dce0e8,label:#dce0e8,prompt:#8839ef,pointer:#df8e1d,marker:#dc8a78,spinner:#dc8a78,header:#d20f39"

# Use nvim for manpages
export MANPAGER='/home/max/Downloads/Apps/nvim-extracted/squashfs-root/AppRun +Man!'

export GF_PREFERRED_PAGER="diff-so-fancy | less --tabs=4 -RFX"

export GIT_FUZZY_BRANCH_WORKING_COPY_KEY="Ctrl-T"
export GIT_FUZZY_LOG_WORKING_COPY_KEY="Ctrl-T"
export GIT_FUZZY_REFLOG_WORKING_COPY_KEY="Ctrl-T"

export BAT_THEME="base16"

source ~/.env.local
