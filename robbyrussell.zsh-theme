PROMPT="%(?:%F{15}%1{➜%}:%F{15}%1{➜%} ) %F{15}%~%f
%F{15}λ%f"

PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{15}git:(%F{15}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{15} "

ZSH_THEME_GIT_PROMPT_DIRTY="%F{15}) %F{red}%1{✗%}%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{15})%f"
