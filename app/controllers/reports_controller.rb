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

  		if @report.save && @report.campus_type == 'HMC'
  			redirect_to '/pages/hmc_resource'
  		elsif @report.save && @report.campus_type == 'CMC'
  			redirect_to '/pages/cmc_resource'
  		elsif @report.save && @report.campus_type == 'Pomona'
  			redirect_to '/pages/pom_resource'
  		elsif @report.save && @report.campus_type == 'Pitzer'
  			redirect_to '/pages/pit_resource'
  		elsif @report.save && @report.campus_type == 'KGI'
  			redirect_to '/pages/kgi_resource'
  		elsif @report.save && @report.campus_type == 'Scripps'
  			redirect_to '/pages/scr_resource'
  		elsif @report.save && @report.campus_type == 'CGU'
  			redirect_to '/pages/cgu_resource'
  		else
  			render 'new'
  		end
  		#render plain: params[:report].inspect
	end

	def update
		@report = Report.find(params[:id])

		if @report.update(report_params)
			redirect_to @report
		else
			render 'edit'
		end
	end

	def destroy
		@report = Report.find(params[:id])
		@report.destroy

		redirect_to reports_path
	end

	private
	  def report_params
	    params.require(:report).permit(:title, :text, :campus_type)
	  end
end
