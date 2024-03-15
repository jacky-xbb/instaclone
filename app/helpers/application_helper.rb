module ApplicationHelper
  def flash_classname(type)
    case type
    when 'notice'
      'py-2 px-3 bg-blue-50 mb-5 text-blue-500 font-medium rounded-lg inline-block'
    when 'success'
      'py-2 px-3 bg-green-50 mb-5 text-green-500 font-medium rounded-lg inline-block'
    when 'error'
      'py-2 px-3 bg-red-50 mb-5 text-red-500 font-medium rounded-lg inline-block'
    when 'alert'
      'py-2 px-3 bg-yellow-50 mb-5 text-yellow-500 font-medium rounded-lg inline-block'
    else
      'py-2 px-3 bg-blue-50 mb-5 text-blue-500 font-medium rounded-lg inline-block'
    end
  end
end
