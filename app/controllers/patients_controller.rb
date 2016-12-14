class PatientsController < ApplicationController
	def new
		# binding.pry
		@patient=Patient.new
		@patients=Patient.all
		render :json => @patients

	end

	def create
		# binding.pry
		@patient = Patient.new(patient_params)
		@patient.save
	end

	def show
		# binding.pry
		@patients=Patient.find_by_id(params[:patient_id])
		render :json => @patients
	end

	private
	def patient_params
   	 params.require(:patient).permit(:firstname,:lastname,:username,:phone,:docter)
	end
end
