
class TodosController < ApplicationController

  #index�A�N�V������Todo�̈ꗗ�y�[�W��Todo�̓��̓y�[�W�����˂Ă���̂ŁA�V����Todo���쐬���邽�߂̃C���X�^���X�ƁA�e�[�u���ɕۑ�����Ă���Todo���擾���܂��B
  def index
    @todo = Todo.new
    @todos = Todo.order('created_at ASC')
  end

#create�A�N�V�������Ă΂��Ɖ��������Todo�����͂���Ă����ꍇ�icontent����łȂ��ꍇ�j�́ATodo��ۑ���Todo�̈ꗗ�y�[�W�Ƀ��_�C���N�g���܂��B���΂�Todo�����͂���Ă��Ȃ��ꍇ�icontent����̏ꍇ�j�́ATodo�̕ۑ��͂����ɁATodo�̈ꗗ�y�[�W���ĕ`�悵�܂��B
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      respond_to do |format|
        format.html { redierct_to :root }
        format.json { render json: @todo}
      end
    else
      render :index, alert: 'Todo����͂��Ă�������'
    end
  end
#respond_to do���g�p���A���N�G�X�g���ꂽformat�ɂ���ď����𕪂���悤�ɂ��܂��B�����html�Ɣ񓯊��ʐM�̂��߂�json�������悤�ɂ��܂����B�t�H�[�}�b�g��json�̎��̐��������܂��B���̌�js�t�@�C�����ō쐬����todo�i@todo�j���g�p���邽�߂�render���\�b�h���g�p���A�쐬����todo��json�`���ŕԂ��悤�ɂ��܂��B

  private
  def todo_params
    params.require(:todo).permit(:content)
  end
end

