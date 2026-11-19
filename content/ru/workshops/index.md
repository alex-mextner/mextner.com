---
title: "Воркшопы"
translationKey: "workshops"
---

<section id="workshops-hero">
  <p>Интенсивные практические курсы для вашей команды.</p>
  <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin: 2rem 0;">
    <img src="/images/workshops/workshop_2025-07-09.jpeg" alt="RAG воркшоп в процессе" style="width: 100%; height: 250px; object-fit: cover; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
    <img src="/images/workshops/workshop_moscow.jpeg" alt="MCP воркшоп в Москве" style="width: 100%; height: 250px; object-fit: cover; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
  </div>
</section>

<section id="workshop-list">
  <article class="workshop-item">
    <h2>Воркшоп по RAG</h2>
    <p>1–2 дня, онлайн/офлайн. Разбор архитектуры Retrieval-Augmented Generation, настройка собственного прототипа на ваших данных.</p>
  </article>

  <article class="workshop-item">
    <h2>MCP Workshop</h2>
    <p>2 дня. Практика оркестрации, мониторинга и выпуска обновлений AI-моделей.</p>
  </article>

  <article class="workshop-item">
    <h2>Vibe++ Workshop</h2>
    <p>1 день. Автоматизация разработки и code review с помощью AI-агентов.</p>
  </article>
</section>

<section id="signup">
  <h2>Оставьте заявку</h2>
  <div style="margin-bottom: 1rem;">
    <p style="font-size: 0.9rem; opacity: 0.8;">Заполните форму ниже или используйте нашу <a href="https://docs.google.com/forms/d/e/1FAIpQLSf16BwSw8-RKp-GXVmxtmQUT43CcJZD2UgxodZKQllNipcqUQ/viewform" target="_blank" id="prefill-link">Google Форму</a> напрямую.</p>
  </div>
  <form action="https://docs.google.com/forms/d/e/1FAIpQLSf16BwSw8-RKp-GXVmxtmQUT43CcJZD2UgxodZKQllNipcqUQ/formResponse" method="POST" target="_blank" id="workshop-form" style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
    <div class="form-column">
      <label for="name">Имя:</label>
      <input type="text" name="entry.2045258218" id="name" placeholder="Иван Иванов" required>
      <label for="email">Email:</label>
      <input type="email" name="entry.1911566836" id="email" placeholder="ivan@example.com" required>
      <label for="company">Компания:</label>
      <input type="text" name="entry.1876465620" id="company" placeholder="ООО Компания (необязательно)">
    </div>
    <div class="form-column">
      <label for="workshop">Интересующий воркшоп:</label>
      <select name="entry.74065017" id="workshop" required>
        <option value="">Выберите воркшоп...</option>
        <option value="Воркшоп по RAG">Воркшоп по RAG</option>
        <option value="MCP Workshop">MCP Workshop</option>
        <option value="Vibe++ Workshop">Vibe++ Workshop</option>
        <option value="Все воркшопы">Все воркшопы</option>
      </select>
      <label for="message">Дополнительная информация:</label>
      <textarea name="entry.274557002" id="message" rows="5" placeholder="Расскажите о ваших целях или конкретных темах, которые хотели бы изучить..."></textarea>
    </div>
    <div style="grid-column: 1 / -1; text-align: center;">
      <button type="submit" class="btn">Отправить заявку</button>
    </div>
  </form>
  
  <script>
    // Pre-fill form from URL parameters
    const urlParams = new URLSearchParams(window.location.search);
    const formFields = {
      'name': 'entry.2045258218',
      'email': 'entry.1911566836', 
      'company': 'entry.1876465620',
      'workshop': 'entry.74065017'
    };
    
    // Pre-fill form fields if URL parameters exist
    for (const [field, entryId] of Object.entries(formFields)) {
      const value = urlParams.get(field);
      if (value) {
        const element = document.getElementById(field);
        if (element) element.value = decodeURIComponent(value);
      }
    }
    
    // Update Google Form link with pre-filled values
    function updatePrefillLink() {
      const baseUrl = 'https://docs.google.com/forms/d/e/1FAIpQLSf16BwSw8-RKp-GXVmxtmQUT43CcJZD2UgxodZKQllNipcqUQ/viewform';
      const params = [];
      
      for (const [field, entryId] of Object.entries(formFields)) {
        const element = document.getElementById(field);
        if (element && element.value) {
          params.push(`${entryId}=${encodeURIComponent(element.value)}`);
        }
      }
      
      const prefillLink = document.getElementById('prefill-link');
      if (params.length > 0) {
        prefillLink.href = `${baseUrl}?${params.join('&')}`;
      }
    }
    
    // Update link when form fields change
    document.querySelectorAll('#workshop-form input, #workshop-form select').forEach(element => {
      element.addEventListener('input', updatePrefillLink);
    });
  </script>
</section>
