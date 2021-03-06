Spree::Admin::NavigationHelper.module_eval do
    def tab(*args)
        options = {:label => args.first.to_s}

        # Return if resource is found and user is not allowed to :admin
        return '' if klass = klass_for(options[:label]) and cannot?(:admin, klass)

        if args.last.is_a?(Hash)
            options = options.merge(args.pop)
        end
        options[:route] ||=  "admin_#{args.first}"

        destination_url = options[:url] || spree.send("#{options[:route]}_path")
        titleized_label = Spree.t(options[:label], :default => options[:label], :scope => [:admin, :tab]).titleize

        css_classes = []

        if options[:icon]
            link = link_to_with_icon(options[:icon], titleized_label, destination_url)
            css_classes << 'tab-with-icon'
        else
            link = link_to(titleized_label, destination_url)
        end

        selected = if options[:match_path]
            if options[:match_path].is_a?(Array)
                starts_with = false

                options[:match_path].each do |path|
                    starts_with ||= request.fullpath.starts_with?("#{admin_path}#{path}")
                end

                starts_with
            else
                request.fullpath.starts_with?("#{admin_path}#{options[:match_path]}")
            end
        else
            args.include?(controller.controller_name.to_sym)
        end
        css_classes << 'selected' if selected

        if options[:css_class]
            css_classes << options[:css_class]
        end
        content_tag('li', link, :class => css_classes.join(' '))
    end
end
