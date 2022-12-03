=begin module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["LeWapong - digital sports tournament organization"]
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["Le WaPong is a tool that helps you organize tournaments with your friends in a simple and digital way. Le WaPong was developed in a two week project at Le Wagon in Lisbon (Batch 1041)."]
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["logo icon.png"])
    # little twist to make it work equally with an asset or a url
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
end =end
