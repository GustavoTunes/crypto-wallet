module CoinsHelper
    def submit_button(form)
        if form.object.persisted?
          t("buttons.update_currency")
        else
          t("buttons.create_currency")
        end
    end
end
