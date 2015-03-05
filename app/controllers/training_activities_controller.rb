class TrainingActivitiesController < ApplicationController
  def index
    @training_activities = TrainingActivity.all 

    render(:template => "training_activitys/index")
  end

  def show
    @training_activity = TrainingActivity.find(params[:id])
  end

  def new
    @training_activity = TrainingActivity.new

    render(:template => "training_activitys/new")
  end

  def create
    @training_activity = TrainingActivity.new(training_activity_params)

    if @training_activity.save
      redirect_to training_activity_path(@training_activity.id)
    else
      render(:template => "training_activitys/index")
    end
  end

  def edit
    @training_activity = TrainingActivity.find(params[:id])

    render(:templace => "training_activitys/edit")
  end

  def update
    @training_activity = TrainingActivity.find(params[:id])

    if @training_activity.update(training_activity_params)
      redirect_to training_activity_path(@training_activity)
    else
      render(:template => "training_activitys/edit")
    end
  end

  def destroy
    @training_activity = TrainingActivity.find(params[:id])
    @training_activity.destroy!
    redirect_to training_activitys_path
  end

  def training_activity_params
    params.require(:training_activity).permit!
  end
end
