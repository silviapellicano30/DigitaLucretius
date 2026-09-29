const q = (selector, context = document) => context.querySelector(selector);
const qa = (selector, context = document) => [...context.querySelectorAll(selector)];

const apparatus = q("#apparatus");
const popover = q("#lemma-popover");

function focusId(id) {
  const element = q("#" + CSS.escape(id));
  if (!element) return;

  element.scrollIntoView({
    behavior: "smooth",
    block: "center"
  });

  element.classList.add("active");
  setTimeout(() => {
    element.classList.remove("active");
  }, 1600);
}

function activateParallelPassage(id) {
  qa(".parallel-locus").forEach(element => {
    element.classList.remove("parallel-active");
  });

  // Seleziona TUTTI gli elementi che contengono questo ID nel token data-note
  const targets = qa(`.parallel-locus[data-note~="${id}"]`);
  if (!targets.length) return;

  targets.forEach(target => {
    target.classList.add("parallel-active");
  });

  targets[0].scrollIntoView({
    behavior: "smooth",
    block: "center"
  });

  setTimeout(() => {
    targets.forEach(target => {
      target.classList.remove("parallel-active");
    });
  }, 3200);
}

function activateTestimoniumPassage(id) {
  qa(".testimonium-locus").forEach(element => {
    element.classList.remove("testimonium-active");
  });

  const targets = qa(`.testimonium-locus[data-corresp="${id}"]`);
  if (!targets.length) return;

  targets.forEach(target => {
    target.classList.add("testimonium-active");
  });

  targets[0].scrollIntoView({
    behavior: "smooth",
    block: "center"
  });

  setTimeout(() => {
    targets.forEach(target => {
      target.classList.remove("testimonium-active");
    });
  }, 3200);
}

document.addEventListener("click", event => {
  const button = event.target.closest("button");
  const action = button?.dataset.action;

  if (action === "translation") {
    const translation = q(".translation");
    translation.hidden = !translation.hidden;
    button.setAttribute("aria-pressed", String(!translation.hidden));
  }

  if (action === "lemmas") {
    const enabled = document.body.classList.toggle("lemmas");
    button.setAttribute("aria-pressed", String(enabled));
  }

  if (action === "keywords") {
    const enabled = document.body.classList.toggle("keywords-active");
    button.setAttribute("aria-pressed", String(enabled));
  }

  if (action === "expand-apparatus") {
    const expanded = apparatus.classList.toggle("expanded");
    button.setAttribute("aria-expanded", String(expanded));
  }

  const marker = event.target.closest("[data-app]");
  if (marker) {
    q('[data-tab="critical"]').click();
    focusId(marker.dataset.app);
  }

  // Links inside an entry (e.g. scholars.html) keep working normally
  const realLink = event.target.closest("a[href]:not([href^='#'])");

  const testimoniumEntry = event.target.closest("[data-testimonium-target]");
  if (testimoniumEntry && !realLink) {
    activateTestimoniumPassage(testimoniumEntry.dataset.testimoniumTarget);
  }

  const parallelEntry = event.target.closest("[data-parallel-target]");
  if (parallelEntry && !realLink) {
    activateParallelPassage(parallelEntry.dataset.parallelTarget);
  }

  const backlink = event.target.closest("[data-reading]");
  if (backlink) {
    focusId(backlink.dataset.reading);
  }

  const link = event.target.closest("[data-target]");
  if (link) {
    event.preventDefault();
    focusId(link.dataset.target);
  }
});

qa('[role="tab"]').forEach(tab => {
  tab.addEventListener("click", () => {
    qa('[role="tab"]').forEach(item => {
      item.setAttribute("aria-selected", String(item === tab));
    });

    qa('[role="tabpanel"]').forEach(panel => {
      panel.hidden = panel.id !== tab.dataset.tab;
    });
  });
});

document.addEventListener("pointerover", event => {
  // Popover per i lemmi
  const word = event.target.closest(".lemmas .word");
  if (word) {
    popover.textContent = word.dataset.lemma;
    popover.hidden = false;
    popover.style.left = (event.clientX + 12) + "px";
    popover.style.top = (event.clientY + 12) + "px";
    return;
  }

  // Popover per studiosi e fonti antiche
  const citationTarget = event.target.closest("[data-citation]");
  if (citationTarget) {
    popover.textContent = citationTarget.dataset.citation;
    popover.hidden = false;
    popover.style.left = (event.clientX + 12) + "px";
    popover.style.top = (event.clientY - 35) + "px";
  }
});

document.addEventListener("pointerout", event => {
  if (event.target.closest(".word") || event.target.closest("[data-citation]")) {
    popover.hidden = true;
  }
});