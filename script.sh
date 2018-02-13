# run via : source script.sh
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

if [ ! -f $parent_path/github_rsa ]
  then ccat $parent_path/github_rsa.cpt > $parent_path/github_rsa
  chmod 0600 $parent_path/github_rsa
fi

eval "$(ssh-agent -s)"
ssh-add $parent_path/github_rsa

rm $parent_path/github_rsa

# add github_rsa.pub to GitHub
