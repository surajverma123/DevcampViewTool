class SkillsController < ApplicationController
    # before_action :get_user, only: [:new]

    def new
        @skill = Skill.new
    end

    def create
        @skill = current_user.skills.create(skill_params)

        respond_to do |format|
            if @skill.save
                format.html { redirect_to root_path, notice: 'Skill was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end

    def edit
         @skill = current_user.skills.find(params[:id])
    end

    def update
        @skill = current_user.skills.find(params[:id])
        respond_to do |format|
          if @skill.update(skill_params)
            format.html { redirect_to about_me_path, notice: 'Skill was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
    end

    private

    def skill_params
        params.require(:skill).permit(:title, :percent_utilized, :user_id)
    end
end