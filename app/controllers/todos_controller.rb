class TodosController < ApplicationController
    def index
        @todos = Todo.all
        render json: @todos
      end
    
      def show
        @todo = Todo.find(params[:id])
        render json: @todo
      end
    
      def create
        @todo = Todo.new(title: params[:title], items: params[:items], color: params[:color], category: params[:category])
        if @todo.save
          render json: @todo, status: :accepted
        else
          render json: {errors: @todo.errors.full_messages}, status: :unprocessable_entity
        end
    
      end
    
      def update
        @todo = Todo.find(params[:id])
    
        if @todo.update(todo_params)
          render json: @todo, status: :accepted
        else
          render json: {errors: @todo.errors.full_messages}, status: :unprocessable_entity
        end
    
      end
      
      def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
      end
    
      private
    
      def todo_params
        params.require(:todo).permit(:title, :items, color, category)
      end
end
