class Employee
  attr_reader :name, :title, :salary, :boss
  
  def initialize(name, title, salary, boss=nil)
    @name = name 
    @title = title
    @salary = salary
    @boss = boss 
    
    boss.add_sub(self) unless boss.nil?
  end 
  
  def bonus(multiplier)
    @salary * multiplier
  end 
end 

class Manager < Employee 
  attr_reader :subordinates
  
  def initialize(name, title, salary, boss=nil)
    super
    @subordinates = []
  end 
  
  def add_sub(employee)
    @subordinates << employee
  end 
  
  def bonus(multiplier)
    total = 0 
    @subordinates.each do |subordinate|
      if subordinate.is_a?(Manager)
        total += subordinate.salary + subordinate.bonus()
      else 
        total += salary
      end 
      # if subordinate.subordinates.nil?
      #   next
      # else
      #   subordinate.subordinates.each do |sub|
      #     total += sub.salary 
      #   end 
      # end 
    end 
    total * multiplier
  end
   
end