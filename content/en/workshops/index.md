---
title: "Workshops"
translationKey: "workshops"
---

<section id="workshops-hero">
  <p>Intensive hands-on courses for your team.</p>
  <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1.5rem; margin: 2rem 0;">
    <img src="/images/workshops/workshop_2025-07-09.jpeg" alt="RAG Workshop in progress" style="width: 100%; height: 250px; object-fit: cover; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
    <img src="/images/workshops/workshop_moscow.jpeg" alt="MCP Workshop in Moscow" style="width: 100%; height: 250px; object-fit: cover; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
  </div>
</section>

<section id="workshop-list">
  <article class="workshop-item">
    <h2>RAG Workshop</h2>
    <p>1–2 days, online/offline. Deep dive into Retrieval-Augmented Generation architecture, building your own prototype with your data.</p>
  </article>

  <article class="workshop-item">
    <h2>MCP Workshop</h2>
    <p>2 days. Hands-on practice of orchestration, monitoring, and rolling updates of AI models.</p>
  </article>

  <article class="workshop-item">
    <h2>Vibe++ Workshop</h2>
    <p>1 day. Development automation and code review with AI agents.</p>
  </article>
</section>

<section id="signup">
  <h2>Leave Your Application</h2>
  <div style="margin-bottom: 1rem;">
    <p style="font-size: 0.9rem; opacity: 0.8;">Fill out the form below or use our <a href="https://docs.google.com/forms/d/e/1FAIpQLSf16BwSw8-RKp-GXVmxtmQUT43CcJZD2UgxodZKQllNipcqUQ/viewform" target="_blank" id="prefill-link">Google Form</a> directly.</p>
  </div>
  <form action="https://docs.google.com/forms/d/e/1FAIpQLSf16BwSw8-RKp-GXVmxtmQUT43CcJZD2UgxodZKQllNipcqUQ/formResponse" method="POST" target="_blank" id="workshop-form" style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem;">
    <div class="form-column">
      <label for="name">Name:</label>
      <input type="text" name="entry.2045258218" id="name" placeholder="John Doe" required>
      <label for="email">Email:</label>
      <input type="email" name="entry.1911566836" id="email" placeholder="john@example.com" required>
      <label for="company">Company:</label>
      <input type="text" name="entry.1876465620" id="company" placeholder="ACME Corp (optional)">
    </div>
    <div class="form-column">
      <label for="workshop">Workshop Interest:</label>
      <select name="entry.74065017" id="workshop" required>
        <option value="">Select a workshop...</option>
        <option value="RAG Workshop">RAG Workshop</option>
        <option value="MCP Workshop">MCP Workshop</option>
        <option value="Vibe++ Workshop">Vibe++ Workshop</option>
        <option value="All workshops">All workshops</option>
      </select>
      <label for="message">Additional Information:</label>
      <textarea name="entry.274557002" id="message" rows="5" placeholder="Tell us about your goals or specific topics you'd like to cover..."></textarea>
    </div>
    <div style="grid-column: 1 / -1; text-align: center;">
      <button type="submit" class="btn">Submit Application</button>
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
