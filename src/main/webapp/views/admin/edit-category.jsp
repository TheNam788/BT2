<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa danh mục | HCMUTE Admin</title>
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
                <p class="topbar-caption">Cập nhật dữ liệu danh mục</p>
            </div>
            <div class="topbar-user">
                <span class="user-badge">Xin chào, <strong>Admin</strong></span>
                <a class="logout-button" href="#">Đăng xuất</a>
            </div>
        </header>

        <section class="page form-shell">
            <div class="page-header">
                <div class="page-heading">
                    <div class="breadcrumb">Trang chủ / Danh mục / Chỉnh sửa</div>
                    <h1>Chỉnh sửa danh mục</h1>
                    <p>Cập nhật tên hoặc thay đổi ảnh đại diện của danh mục.</p>
                </div>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/category/list">← Quay lại</a>
            </div>

            <div class="card">
                <div class="card-header">
                    <div>
                        <h2 class="card-title">Thông tin danh mục #${category.id}</h2>
                        <p class="card-subtitle">Chỉ thay đổi những thông tin bạn muốn cập nhật.</p>
                    </div>
                </div>

                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/admin/category/edit"
                          method="post" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${category.id}">

                        <div class="form-grid">
                            <div class="form-section">
                                <h3>Thông tin cơ bản</h3>
                                <p>Kiểm tra kỹ dữ liệu trước khi lưu thay đổi.</p>

                                <div class="form-group">
                                    <label class="form-label" for="name">Tên danh mục <span class="required">*</span></label>
                                    <input class="form-control" type="text" id="name" name="name"
                                           value="${category.name}" maxlength="100" required autofocus>
                                    <p class="form-help">Tên mới sẽ được cập nhật trong danh sách danh mục.</p>
                                </div>

                                <div class="form-group">
                                    <label class="form-label" for="icon">Chọn ảnh mới</label>
                                    <input class="form-control file-control" type="file" id="icon" name="icon"
                                           accept="image/*"
                                           onchange="previewCategoryImage(this, 'previewImage', 'previewPlaceholder')">
                                    <p class="form-help">Để trống nếu bạn muốn giữ nguyên hình ảnh hiện tại.</p>
                                </div>

                                <div class="info-note">
                                    Nếu không chọn ảnh mới, hệ thống sẽ giữ lại ảnh hiện tại của danh mục theo xử lý trong tầng service/DAO.
                                </div>
                            </div>

                            <div class="form-section">
                                <h3>Hình ảnh danh mục</h3>
                                <p>Ảnh hiện tại hoặc ảnh mới được chọn sẽ hiển thị tại đây.</p>
                                <div class="image-preview-box">
                                    <c:choose>
                                        <c:when test="${not empty category.icon}">
                                            <c:url value="/image" var="imgUrl">
                                                <c:param name="fname" value="${category.icon}"/>
                                            </c:url>
                                            <img id="previewImage" src="${imgUrl}" alt="${category.name}">
                                            <div class="preview-placeholder" id="previewPlaceholder" style="display:none;">
                                                <span class="preview-icon">▧</span>Chưa có hình ảnh
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <img id="previewImage" alt="Xem trước ảnh danh mục" style="display:none;">
                                            <div class="preview-placeholder" id="previewPlaceholder">
                                                <span class="preview-icon">▧</span>Chưa có hình ảnh
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>

                        <div class="form-actions">
                            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/category/list">Hủy</a>
                            <button class="btn btn-primary" type="submit">✓ Lưu thay đổi</button>
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
