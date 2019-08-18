module Common
  extend ActiveSupport::Concern

  included do
    # ここにcallback等
  end

  def task_common(val='neutral')
    if val == 'neutral'
      current_user.tasks.all.order(timelimit: 'DESC').where(completed: false, deleted: false).paginate(page: params[:page], per_page: 5)
    elsif val == 'completed' 
      current_user.tasks.all.order(timelimit: 'DESC').where(completed: true).paginate(page: params[:page], per_page: 5)
    elsif val == 'deleted'
      current_user.tasks.all.order(timelimit: 'DESC').where(deleted: true).paginate(page: params[:page], per_page: 5)
    elsif val == 'all'
      current_user.tasks.all.order(timelimit: 'DESC').paginate(page: params[:page], per_page: 5)
    else
      return nil
    end
  end

  private

  # privateメソッド

end