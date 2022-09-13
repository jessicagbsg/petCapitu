module Api
	module V1
		class PetsController < ApplicationController   

            def index
                pets = DbpetCapitu.order('created_at DESC')
                render json: {status: 'SUCCESS', message:'Pets loaded', data:pets},status: :ok
            end


            def show
                pet = DbpetCapitu.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded pet', data:pet}, status: :ok
            end


            def create
                pet = DbpetCapitu.new(pet_params)
                if pet.save
                    render json: {status: 'SUCCESS', message: 'Saved pet', data:pet}, status: :ok
                else 
                    render json: {status: 'ERROR', message: 'Pet not saved', data:pet.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                pet = DbpetCapitu.find(params[:id])
                pet.destroy
                render json: {status: 'SUCCESS', message: 'Pet Deleted', data:pet}, status: :ok
            end

            def update
                pet = DbpetCapitu.find(params[:id])
                if pet.update(pet_params)
                    render json: {status: 'SUCCESS', message: 'Pet updated', data:pet}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Pet not updated', data:pet.errors}, status: :unprocessable_entity
                end
            end

            private
            def pet_params
                params.permit(:name, :age, :breed)
            end

		end
	end
end