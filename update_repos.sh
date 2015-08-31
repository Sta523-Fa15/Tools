#!/bin/sh

if [ $# != 3 ]; then
    echo "Usage: update_repos.sh <repo suffix> <file> <message>"
    exit 1
fi

github='git@github.com:Sta523-Fa15/'
teams=('Team1' 'Team2' 'Team3' 'Team4' 'Team5' 'Team6' 'Team7' 'Team8' 'Team9' 'Team10')

suffix=${1}

for team in ${teams[*]}
do
    folder="${team}${suffix}"
    repo="${github}${folder}"

    git clone ${repo}

    cp ${2} ${folder}/

    cd ${folder}
    git add .
    git commit -m ${3}
    cd ..

    rm -rf ${folder}

    break
done