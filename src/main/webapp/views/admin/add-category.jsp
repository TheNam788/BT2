<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm danh mục | HCMUTE Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
<div class="admin-layout">
    <aside class="sidebar">
        <div class="brand">
            <img class="brand-logo" src="${pageContext.request.contextPath}/images/hcmute-logo.png" alt="HCMUTE">
            <div>
                <p class="brand-title">HCMUTE Admin</p>
                <p class="brand-subtitle">Hệ thống quản trị</p>
            </div>
        </div>

        <div class="admin-profile">
            <img class="admin-avatar" src="${pageContext.request.contextPath}/images/admin.png" alt="Admin">
            <strong>Administrator</strong>
            <span>Quản trị viên hệ thống</span>
        </div>

        <div class="nav-title">Điều hướng</div>
        <nav class="sidebar-nav">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/category/list">
                <span class="nav-icon">▦</span><span>Tổng quan</span>
            </a>
            <a class="nav-link active" href="${pageContext.request.contextPath}/admin/category/list">
                <span class="nav-icon">▤</span><span>Quản lý danh mục</span>
            </a>
            <a class="nav-link" href="#"><span class="nav-icon">◫</span><span>Quản lý sản phẩm</span></a>
            <a class="nav-link" href="#"><span class="nav-icon">◎</span><span>Quản lý tài khoản</span></a>
        </nav>

        <div class="sidebar-spacer"></div>
        <div class="sidebar-footer">Servlet CRUD MVC • Jakarta EE</div>
    </aside>

    <main class="main">
        <header class="topbar">
            <div>
                <h2 class="topbar-title">Quản trị hệ thống</h2>
                <p class="topbar-caption">Tạo mới dữ liệu danh mục</p>
            </div>
            <div class="topbar-user">
                <span class="user-badge">Xin chào, <strong>Admin</strong></span>
                <a class="logout-button" href="#">Đăng xuất</a>
            </div>
        </header>

        <section class="page form-shell">
            <div class="page-header">
                <div class="page-heading">
                    <div class="breadcrumb">Trang chủ / Danh mục / Thêm mới</div>
                    <h1>Thêm danh mục mới</h1>
                    <p>Nhập thông tin bên dưới để tạo một danh mục mới trong hệ thống.</p>
                </div>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/category/list">← Quay lại</a>
            </div>

            <div class="card">
                <div class="card-header">
                    <div>
                        <h2 class="card-title">Thông tin danh mục</h2>
                        <p class="card-subtitle">Các trường có dấu * là bắt buộc.</p>
                    </div>
                </div>

                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/admin/category/add"
                          method="post" enctype="multipart/form-data">
                        <div class="form-grid">
                            <div class="form-section">
                                <h3>Thông tin cơ bản</h3>
                                <p>Đặt tên ngắn gọn và dễ nhận biết cho danh mục.</p>

                                <div class="form-group">
                                    <label class="form-label" for="name">Tên danh mục <span class="required">*</span></label>
                                    <input class="form-control" type="text" id="name" name="name"
                                           placeholder="Ví dụ: Áo nam" maxlength="100" required autofocus>
                                    <p class="form-help">Tên danh mục sẽ được hiển thị trong trang danh sách.</p>
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="icon">Ảnh đại diện</label>
                                    <input class="form-control file-control" type="file" id="icon" name="icon"
                                           accept="image/*"
                                           onchange="previewCategoryImage(this, 'previewImage', 'previewPlaceholder')">
                                    <p class="form-help">Nên chọn ảnh JPG/PNG vuông để hiển thị đẹp nhất.</p>
                                </div>

                                <div class="info-note">
                                    Ảnh là tùy chọn. Nếu không chọn ảnh, danh mục vẫn được tạo bình thường và hệ thống sẽ hiển thị biểu tượng mặc định.
                                </div>
                            </div>

                            <div class="form-section">
                                <h3>Xem trước hình ảnh</h3>
                                <p>Ảnh bạn chọn sẽ được xem trước tại đây.</p>
                                <div class="image-preview-box">
                                    <img id="previewImage" alt="Xem trước ảnh danh mục" style="display:none;">
                                    <div class="preview-placeholder" id="previewPlaceholder">
                                        <span class="preview-icon">▧</span>
                                        Chưa chọn hình ảnh
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-actions">
                            <button class="btn btn-secondary" type="reset" onclick="location.reload()">Đặt lại</button>
                            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/category/list">Hủy</a>
                            <button class="btn btn-primary" type="submit">＋ Thêm danh mục</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </main>
</div>
<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
</body>
</html>
