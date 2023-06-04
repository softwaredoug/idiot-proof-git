#!/bin/bash
# Doug Turnbull's idiot-proof-git aliases
# As Doug Turnbull always says: "Git is hard. Let's go shopping."
# And you know he also says: "Git is hard. Let's go shopping."
# And copilot likes to say: "Git is hard. Let's go shopping."
# But about life he says: "Life is hard. Let's go shopping."
# And tacos: "Tacos are hard. Let's go shopping."
# And shopping: "Shopping is hard. Let's go shopping."

config_file="$HOME/.gitconfig"
in_progress_file="/tmp/.gitconfig"
file_to_append="./.gitconfig"

if grep -q "\[alias\]" "$config_file"; then
    echo "⛔️Warning: Your '.gitconfig' file already contains aliases. Appending may result in conflicts."
fi


if [ ! -f "$file_to_append" ]; then
    echo "File '$file_to_append' does not exist."
    exit 1
fi

if [ ! -f "$config_file" ]; then
    echo "Git config file '$config_file' does not exist. Creating..."
    touch "$config_file"
fi

# echo "Backing up '$config_file' to '$config_file.bak'"
cp "$config_file" "$config_file.bak"

# echo "Removing existing idiot-proof-git aliases from '$config_file'..."
sed '/# IDIOT_PROOF_GIT_BEGIN/,/# IDIOT_PROOF_GIT_END/d' "$config_file" > "$in_progress_file"

cat "$file_to_append" >> "$in_progress_file"

echo ""
echo "If you use Github Enterprise (ie your company's Github)"
echo "then we'll use that host instead of github.com where applicable."
read -p "Enter your GitHub Enterprise host (leave blank if you just use github.com): " gh_host

if [[ ! -z "$gh_host" ]]; then
    sed "s|your.enterprise.host|$gh_host|g" "$in_progress_file" > "$config_file"
    echo "GitHub Enterprise host updated in '$in_progress_file'."
fi

echo ""
echo "🎉🎉🎉🎉🎉🎉🎉🎉🎉🎉"
echo "We've added idiot-proofed aliases to your git experience"
echo ""
echo "Final step: Copying '$in_progress_file' to '$config_file'..."
echo "Please run 'cp $in_progress_file $config_file'"
echo ""
echo "To restore your original git config, run 'cp $config_file.bak $config_file'"
