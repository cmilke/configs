echo ENSURE YOU RUN THIS FROM WITHIN THE CONFIG DIRECTORY!
echo EXECUTING IN 5; sleep 1
echo 4; sleep 1;
echo 3; sleep 1;
echo 2; sleep 1;
echo 1; sleep 1;
config_dir=$PWD
cd $HOME
rm -r .vim  .vimrc .tmux.conf &> /dev/null
files_to_link='.allshrc  .tmux.conf  .vim  .vimrc'
for f in $files_to_link; do
    ln -s ${config_dir}/$f .
done
echo CONFIGS LINKED
