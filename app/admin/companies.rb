ActiveAdmin.register Company do
	permit_params :company_name, :director_name, :policy, :detail
end