# run via : source script.sh
if [ ! -f github_rsa ]
  then ccat github_rsa.cpt > github_rsa
  chmod 0600 github_rsa
fi

eval "$(ssh-agent -s)"
ssh-add github_rsa

rm github_rsa

# add github_rsa.pub to GitHub
