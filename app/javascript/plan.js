document.addEventListener("turbo:load", function() {
  const addPlanButton = document.getElementById("add-plan-button");
  const planContainer = document.getElementById("add-container");
  let planIndex = document.querySelectorAll('.plan').length;

  if (!addPlanButton) { return false; }
  if (!planContainer) { return false; }

  function addPlan() {
    const planHtml = `
      <div class="plan container pb-3">
        <div class="plan px-2 py-2 border border-primary-subtle">
          <div class="row">
            <div class="col-md-3 mb-3">
              <input type="date" name="book[plans_attributes][${planIndex}][date]" class="form-control" />
            </div>
            <div class="col-md-9 mb-3">
              <input type="text" name="book[plans_attributes][${planIndex}][title]" class="form-control" placeholder="タイトル" />
            </div>
          </div>
          <div class="row">
            <div class="col-md-3 mb-3">
              <input type="time" name="book[plans_attributes][${planIndex}][start_time]" class="form-control" />
            </div>
            <div class="col-md-9 mb-3">
              <textarea name="book[plans_attributes][${planIndex}][detail]" class="form-control" placeholder="詳細" ></textarea>
            </div>
          </div>
        </div>
      </div>
    `;
    planContainer.insertAdjacentHTML('beforeend', planHtml);
    planIndex++;
  }

  addPlanButton.addEventListener("click", function() {
    addPlan();
  });
});