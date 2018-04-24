class Employee
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  def bonus(multiplier)
    salary * multiplier
  end
  
  def get_salary
    salary
  end
  
  private
  attr_reader :name, :title, :salary, :boss
end

class Manager < Employee
  def initialize(name, title, salary, boss, employees)
    super(name, title, salary, boss)
    @employees = employees
  end
  
  def bonus(multiplier)
    total = 0
    employees.each do |employee|
      total += employee.get_salary
    end
    total * multiplier
  end
  
  private
  attr_reader :employees
  
end

p shawna = Employee.new("Shawna", "TA", 12000, "Darren")
p david = Employee.new("David", "TA", 10000, "Darren")

p darren = Manager.new('Darren', 'TA Manager', 78000, 'boss', [shawna, david])
p ned = Manager.new('ned', 'Founder', 1000000, 'boss', [darren, david, shawna])

p ned.bonus(5)