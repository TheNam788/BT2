function previewCategoryImage(input, imageId, placeholderId) {
    const image = document.getElementById(imageId);
    const placeholder = document.getElementById(placeholderId);

    if (!input.files || !input.files[0]) {
        return;
    }

    const file = input.files[0];
    if (!file.type.startsWith('image/')) {
        input.value = '';
        alert('Vui lòng chọn một tệp hình ảnh.');
        return;
    }

    const reader = new FileReader();
    reader.onload = function (event) {
        image.src = event.target.result;
        image.style.display = 'block';
        if (placeholder) {
            placeholder.style.display = 'none';
        }
    };
    reader.readAsDataURL(file);
}

function initCategoryTable() {
    const table = document.getElementById('categoryTable');
    const searchInput = document.getElementById('searchInput');
    const pageSize = document.getElementById('pageSize');
    const visibleCount = document.getElementById('visibleCount');

    if (!table || !searchInput || !pageSize) {
        return;
    }

    const rows = Array.from(table.querySelectorAll('tbody tr[data-category-row="true"]'));

    function applyFilter() {
        const keyword = searchInput.value.trim().toLowerCase();
        const limit = Number(pageSize.value);
        let matched = 0;
        let visible = 0;

        rows.forEach(function (row) {
            const nameCell = row.querySelector('.category-name');
            const name = nameCell ? nameCell.textContent.trim().toLowerCase() : '';
            const match = name.includes(keyword);

            if (match) {
                matched += 1;
            }

            const shouldShow = match && visible < limit;
            row.style.display = shouldShow ? '' : 'none';

            if (shouldShow) {
                visible += 1;
            }
        });

        if (visibleCount) {
            visibleCount.textContent = 'Đang hiển thị ' + visible + ' / ' + matched + ' danh mục phù hợp';
        }
    }

    searchInput.addEventListener('input', applyFilter);
    pageSize.addEventListener('change', applyFilter);
    applyFilter();
}

document.addEventListener('DOMContentLoaded', initCategoryTable);
