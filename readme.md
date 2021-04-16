
> git init

> git status
�C���f�b�N�X�ɓo�^����Ă��Ȃ��t�@�C����Untracked files�Ƃ��ĕ\�������B

> git add xxxxx.rb
�C���f�b�N�X�Ƀt�@�C����o�^���܂��B

> git config --global user.email "tamada@across-net.co.jp"
> git config --global user.name "acr002"
�o�^�H

> git commit -m "add new file"
���[�J�����|�W�g���ɃR�~�b�g���܂��B

> git remote add origin https://github.com/acr002/ruby-test.git
�����[�g���|�W�g���ɏ���ǉ����܂��B

> git push origin master
���[�J���̕ύX�������[�g�ɔ��f�����܂��B

## git remote
�����[�g���|�W�g���ɑ΂���w��
���[�J�����|�W�g���������[�g�̕��ɒǉ�������A�����[�g���|�W�g�����폜�����肵�܂��B

git remote add ���O URL
  ���́u���O�v�̓����[�g���|�W�g���ɕt������̂Ȃ̂ŁA�ʏ��origin���g�p���܂��B

git remote remove ���O
  ���݂̃��|�W�g�����烊���[�g���|�W�g�����폜���܂��B

git remote set-url ���O URL
  �����[�g��URL��ύX���܂��B

git remote get-url ���O
  �����[�g��URL��\�����܂��B

git remote set-head ���O
  �����[�g�̃f�t�H���g�u�����`��ݒ肵�܂��B

git remote set-branches ���O �u�����`
  �����[�g�ŒǐՂ���u�����`��ύX���܂��B
  �u�����`�͕����w��\�B

git remote
  �����[�g���|�W�g���̖��O��Ԃ��܂��B

git remote -v
  �����[�g���|�W�g���̖��O�Əꏊ��Ԃ��܂��B

git remote show ���O
  �w�肵�������[�g���|�W�g���̏ڂ�������Ԃ��܂��B




# 2021.04.16(��)
https://github.com/acr002/ruby_test.git
git@github.com:acr002/ruby_test.git

�t�@�C���X�V�܂ł̊�{�菇
- �t�@�C����ǉ�
- �t�@�C�����R�~�b�g
- �t�@�C�����X�V
  git add [�t�@�C����] //�ǉ�
  git commit -a -m "�C�ӂ̃R�����g"  //�R�~�b�g (-a�I�v�V�����͕ύX���������o���Ă����)
  git push origin master  //master���X�V

git add�̎g�p��
  git add . //���ׂẴt�@�C���E�f�B���N�g��
  git add *.css //���ׂĂ�CSS�t�@�C��
  git add -n //�ǉ������t�@�C���𒲂ׂ�
  git add -u //�ύX���ꂽ�t�@�C����ǉ�����
  git rm --cached //add���Ă��܂����t�@�C�������O

git commit�̎g�p��
  git commit -a //�ύX�̂������t�@�C�����ׂ�
  git commit --amend //���O�̃R�~�b�g��������
  git commit -v //�ύX�_��\�����ăR�~�b�g

�R�~�b�g�̎�����
  git reset --soft HEAD~2 // �ŐV�̃R�~�b�g����2���������[�N�f�B���N�g���̓��e��ێ���������
  git reset --hard HEAD~2 // �ŐV�̃R�~�b�g����2�����̃��[�N�f�B���N�g���̓��e�ƃR�~�b�g��������


# ���Ԃ񂱂���g���ł��낤����B
git add .
git commit -a -m "comments"
git push origin master



# comment
Add         �ǉ�
Fix         �C��
Update
Use         �ؑւ�
Improve     ����
Avoid       ������
Emit        ���e�E�������m�F���₷������
Remove      ����
Move        �ړ�
Rename      ���̕ύX
Change
Allow
Implement
Handle

Fix         �o�O�C��
Fix typos   �^�C�|�̏C��
Add tests
Add comment
Add docs
Update README.md
clean       ����

Change A to B(Use B instead of A)


# branch
<��Ƃ̕���>/#<Issue�ԍ�><��Ɠ��e>

��Ƃ̕���
feature   �V�@�\�J����
hotfix    ���J���̂��̂̃o�O�C���p
review    ���r���[�p

��) git branch feature/#19implement_login_func


# ���[�J����master�u�����`���ŐV�ɂ���
git checkout master
git pull
(git fetch + git merge origin/master)





