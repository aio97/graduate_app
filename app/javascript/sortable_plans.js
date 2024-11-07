import Sortable from 'sortablejs';

document.addEventListener('DOMContentLoaded', () => {
  const planContainer = document.getElementById('add-container');

  if (planContainer) {
    Sortable.create(planContainer, {
      handle: '.sortable-handle', // ドラッグ用のハンドルクラスを指定
      animation: 150,
    });
  }
});