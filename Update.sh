# 如果没有消息后缀，默认提交信息为 `:pencil: update content`
info=$1
if ["$info" = ""];
then info=":Update md files(C_primer_plus notes)"
fi
git add -A
git commit -m "$info"
git push origin hexo