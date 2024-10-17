module CoinsHelper
    def submit_button(form)
        if form.object.persisted?
          "Update currency "
        else
          "Create currency"
        end
    end
end
