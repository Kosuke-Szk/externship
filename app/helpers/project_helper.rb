module ProjectHelper

  def sum_of_apply(project)
    Apply.where(project_id: project.id).where(status: 'apply').sum(:amount_of_money)
  end

  def sum_of_success(project)
    Apply.where(project_id: project.id).where(status: 'success').sum(:amount_of_money)
  end

  def sum_of_support_company(project)
    project.applies.count
  end
end
