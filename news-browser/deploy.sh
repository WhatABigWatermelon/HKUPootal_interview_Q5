# 当发生错误时中止脚本
set -e

#删除旧的构建
del dist

# 构建
npm run build

# cd 到构建输出的目录下 
cd dist

git init
git add -A
git commit -m 'deploy'

# 部署到 https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:WhatABigWatermelon/HKUPootal_interview_Q5.git master:gh-pages

cd -