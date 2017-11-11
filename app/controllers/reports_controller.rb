class ReportsController < ApplicationController
	
	def index
		@reports = Report.all
	end

	# Show report
	def show
		@report = Report.find(params[:id])
	end

	# New report
	def new
		@report = Report.new
	end

	# edit an existing report
	def edit
		@report = Report.find(params[:id])
	end

	# Create the report
	def create
  		@report = Report.new(report_params)
 
  		if @report.save
  			redirect_to @report
  		else
  			render 'new'
  		end
	end

	def update
		@report = Report.find(params[:id])

		if @report.update(report_params)
			redirect_to @report
		else
			render 'edit'
		end
	end
 
	private
	  def report_params
	    params.require(:report).permit(:title, :text)
	  end
end
