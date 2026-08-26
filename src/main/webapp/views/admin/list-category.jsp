<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý danh mục | HCMUTE Admin</title>
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
            <a class="nav-link" href="#">
                <span class="nav-icon">◫</span><span>Quản lý sản phẩm</span>
            </a>
            <a class="nav-link" href="#">
                <span class="nav-icon">◎</span><span>Quản lý tài khoản</span>
            </a>
        </nav>

        <div class="sidebar-spacer"></div>
        <div class="sidebar-footer">Servlet CRUD MVC • Jakarta EE</div>
    </aside>

    <main class="main">
        <header class="topbar">
            <div>
                <h2 class="topbar-title">Quản trị hệ thống</h2>
                <p class="topbar-caption">Theo dõi và quản lý dữ liệu danh mục</p>
            </div>
            <div class="topbar-user">
                <span class="user-badge">Xin chào, <strong>Admin</strong></span>
                <a class="logout-button" href="#">Đăng xuất</a>
            </div>
        </header>

        <section class="page">
            <div class="page-header">
                <div class="page-heading">
                    <div class="breadcrumb">Trang chủ / Danh mục</div>
                    <h1>Quản lý danh mục</h1>
                    <p>Quản lý tên, hình ảnh và các thao tác dành cho từng danh mục.</p>
                </div>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/category/add">
                    <span>＋</span> Thêm danh mục
                </a>
            </div>

            <div class="stats-row">
                <div class="stat-card">
                    <div class="stat-label">Tổng danh mục</div>
                    <div class="stat-value primary">${cateList.size()}</div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Trạng thái hệ thống</div>
                    <div class="stat-value success">Hoạt động</div>
                </div>
                <div class="stat-card">
                    <div class="stat-label">Chức năng</div>
                    <div class="stat-value warning">CRUD</div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <div>
                        <h2 class="card-title">Danh sách danh mục</h2>
                        <p class="card-subtitle">Tìm kiếm nhanh và chỉnh sửa dữ liệu ngay trong danh sách.</p>
                    </div>
                </div>

                <div class="card-body">
                    <div class="toolbar">
                        <div class="toolbar-group">
                            <span>Hiển thị</span>
                            <select class="select-control" id="pageSize" aria-label="Số dòng hiển thị">
                                <option value="10">10</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                                <option value="9999">Tất cả</option>
                            </select>
                            <span>dòng</span>
                        </div>

                        <div class="toolbar-group">
                            <div class="search-box">
                                <span class="search-icon">⌕</span>
                                <input class="input-control" type="search" id="searchInput"
                                       placeholder="Tìm theo tên danh mục..." autocomplete="off">
                            </div>
                        </div>
                    </div>

                    <div class="table-wrap">
                        <table class="data-table" id="categoryTable">
                            <thead>
                            <tr>
                                <th style="width: 75px;">STT</th>
                                <th style="width: 110px;">Hình ảnh</th>
                                <th>Tên danh mục</th>
                                <th style="width: 130px;">Trạng thái</th>
                                <th style="width: 190px;">Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${cateList}" var="cate" varStatus="status">
                                <tr data-category-row="true">
                                    <td class="cell-index">#${status.index + 1}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${not empty cate.icon}">
                                                <c:url value="/image" var="imgUrl">
                                                    <c:param name="fname" value="${cate.icon}"/>
                                                </c:url>
                                                <img class="category-thumb" src="${imgUrl}" alt="${cate.name}">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="no-image" title="Chưa có hình ảnh">▧</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="category-name">${cate.name}</td>
                                    <td>
                                        <span class="status-badge"><span class="status-dot"></span>Đang dùng</span>
                                    </td>
                                    <td>
                                        <div class="action-group">
                                            <a class="btn btn-secondary btn-sm"
                                               href="<c:url value='/admin/category/edit?id=${cate.id}'/>">✎ Sửa</a>
                                            <a class="btn btn-danger-soft btn-sm"
                                               href="<c:url value='/admin/category/delete?id=${cate.id}'/>"
                                               onclick="return confirm('Bạn có chắc muốn xóa danh mục này?')">⌫ Xóa</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            <c:if test="${empty cateList}">
                                <tr>
                                    <td colspan="5">
                                        <div class="empty-state">
                                            <div class="empty-state-icon">▤</div>
                                            <strong>Chưa có danh mục nào</strong>
                                            <div>Hãy thêm danh mục đầu tiên để bắt đầu quản lý.</div>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>

                    <div class="table-footer">
                        <span id="visibleCount">Đang hiển thị danh mục</span>
                        <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/admin/category/add">＋ Thêm mới</a>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
</body>
</html>
