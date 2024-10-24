document.addEventListener("DOMContentLoaded", function() {
  // Чекаємо ініціалізації Trix
  document.addEventListener("trix-initialize", function(event) {
    const toolbar = event.target.toolbarElement;

    if (toolbar) {
      // Додаємо блоки для заголовків H2, H3, H4 в конфігурацію Trix
      Trix.config.blockAttributes.heading2 = {
        tagName: "h2",
        terminal: true,
        breakOnReturn: true,
        group: false
      };

      Trix.config.blockAttributes.heading3 = {
        tagName: "h3",
        terminal: true,
        breakOnReturn: true,
        group: false
      };

      Trix.config.blockAttributes.heading4 = {
        tagName: "h4",
        terminal: true,
        breakOnReturn: true,
        group: false
      };

      // HTML-код для кнопок H2, H3, H4
      const h2ButtonHTML = '<button type="button" class="trix-button" data-trix-attribute="heading2" title="H2">H2</button>';
      const h3ButtonHTML = '<button type="button" class="trix-button" data-trix-attribute="heading3" title="H3">H3</button>';
      const h4ButtonHTML = '<button type="button" class="trix-button" data-trix-attribute="heading4" title="H4">H4</button>';

      // Знаходимо місце для вставки нових кнопок після кнопки "Increase Nesting Level"
      const nestingButton = toolbar.querySelector(".trix-button--icon-increase-nesting-level");

      if (nestingButton) {
        // Вставляємо кнопки H2, H3, H4 після кнопки "Increase Nesting Level"
        nestingButton.insertAdjacentHTML("afterend", h2ButtonHTML);
        const h2Button = toolbar.querySelector("[data-trix-attribute='heading2']");
        h2Button.insertAdjacentHTML("afterend", h3ButtonHTML);

        const h3Button = toolbar.querySelector("[data-trix-attribute='heading3']");
        h3Button.insertAdjacentHTML("afterend", h4ButtonHTML);
      }
    }
  });
});

