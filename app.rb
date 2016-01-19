require "sinatra"

require_relative "lib/calculator.rb"
require_relative "lib/memory.rb"


get "/" do
  memory = Memory.new("public/memory.txt")
  @number = memory.load
  erb :home
end

post "/calculate" do
  @a = params[:number1].to_f
  @b = params[:number2].to_f
  @op = params[:operation]

  calc = Calculator.new

  if @op == "add"
    @result = calc.add(@a, @b)
  elsif @op == "subtract"
    @result = calc.subtract(@a, @b)
  elsif @op == "multiply"
    @result = calc.multiply(@a, @b)
  elsif @op == "divide"
    @result = calc.divide(@a, @b)
  else
    @result = "ERROR"
  end

  erb :result
end

post "/save" do
  memory = Memory.new("public/memory.txt")

  memory.save(params[:value])
  redirect to("/")
end
