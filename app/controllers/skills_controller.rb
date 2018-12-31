class SkillsController < ApplicationController
    def new
        @skill = Skill.new
    end
    def create
        @skill = Skill.new(skill_params)
        respond_to do |format|
            if @skill.save
                format.html { redirect_to root_path, notice: 'Skill was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end

    private
    def skill_params
        params.require(:skill).permit(:title, :percent_utilized)
    end
end