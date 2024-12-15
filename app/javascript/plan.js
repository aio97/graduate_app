document.addEventListener("turbo:load", function() {
  const addPlanButton = document.getElementById("add-plan-button");
  const planContainer = document.getElementById("add-container");
 
  let maxId = 0;
  document.querySelectorAll('.plan').forEach(plan => {
    const planId = parseInt(plan.getAttribute('data-id'), 10);
    if (planId > maxId) {
      maxId = planId;
    }
  });

  if (!addPlanButton) { return false; }
  if (!planContainer) { return false; }

  function addPlan() {
    const newPlanId = maxId + 1;

    const planHtml = `
      <div class="plan container pb-3">
        <div class="plan px-2 py-2 border border-primary-subtle">
          <div class="row">
            <div class="col-md-3 mb-3">
              <input type="date" name="book[plans_attributes][${newPlanId}][date]" class="form-control" />
            </div>
            <div class="col-md-9 mb-3">
              <input type="text" name="book[plans_attributes][${newPlanId}][title]" class="form-control" placeholder="タイトル" />
            </div>
          </div>
          <div class="row">
            <div class="col-md-3 mb-3">
              <input type="time" name="book[plans_attributes][${newPlanId}][start_time]" class="form-control" />
            </div>
            <div class="col-md-9 mb-3">
              <input type="text" name="book[plans_attributes][${newPlanId}][location]", id="location",  class="form-control" placeholder="場所" />
            </div>
          </div>
          <div class="row d-flex justify-content-end">
            <div class="col-md-1 mb-3 text-end">
              ～
            </div>
            <div class="col-md-2 mb-3">
              <input type="time" name="book[plans_attributes][${newPlanId}][end_time]" class="form-control" />
            </div>
            <div class="col-md-9 mb-3">
              <textarea name="book[plans_attributes][${newPlanId}][detail]" class="form-control" placeholder="詳細" ></textarea>
            </div>
          </div>
          <div class="row d-flex justify-content-end">
            <div class="col-md-9 mb-3">
              <textarea name="book[plans_attributes][${newPlanId}][memo]" class="form-control" placeholder="メモ（公開されません）" ></textarea>
            </div>
          </div>
        </div>
      </div>
    `;
    planContainer.insertAdjacentHTML('beforeend', planHtml);
    maxId = newPlanId;
  }

  addPlanButton.addEventListener("click", function() {
    addPlan();
  });
});