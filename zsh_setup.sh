# Install the zsh shell, xsel and autojump
sudo apt install zsh xsel autojump
# Upgrade the shell to oh-my-zsh
sudo sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# Set ZSH environment variable
export ZSH=$HOME/.oh-my-zsh
# Add auto-suggestions, syntax highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/plugins/zsh-syntax-highlighting
# Add gnome theme
cat << 'EOF' > $ZSH/custom/themes/eterm.zsh-theme
PROMPT="%{$fg_bold[blue]%}%n%{$fg_bold[red]%}:%~# %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
EOF
# Change some configurations in .zshrc file (change theme, change plugins used)
sed -i 's/^ZSH_THEME=".*/ZSH_THEME="eterm"/' $HOME/.zshrc
sed -i "s/^plugins=.*/plugins=(autojump copybuffer copyfile dirhistory git jsontools sudo web-search zsh-autosuggestions zsh-syntax-highlighting)/" $HOME/.zshrc
# Add highlight style for zsh-syntax-highlighting plugin if not already present
 if ! grep -q "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE" $HOME/.zshrc; then echo "\nexport ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=\"fg=#4e4e4e,bold\"" >> $HOME/.zshrc; fi 
# Remove username in shell if not already present
# if ! grep -q "prompt_context() {}" $HOME/.zshrc; then echo "\nprompt_context() {}\n" >> $HOME/.zshrc; fi
echo "Please restart your shell session or source your .zshrc file by running:"
echo "  source ~/.zshrc"
echo "Congratulations, you're now using zsh with Oh My Zsh!" 
