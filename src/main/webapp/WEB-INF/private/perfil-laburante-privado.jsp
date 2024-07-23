<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<main class="bg-perfil bg-cover bg-center">
	<!-- Profile Section -->
	<div class="mx-auto flex min-h-[80vh] max-w-screen-2xl flex-col items-start gap-y-4 p-8 md:flex-row md:gap-x-12">
		<div class="mx-auto w-full rounded-xl p-6 shadow-md bg-white">
			<div class="mb-6 text-center">
				<h2 class="pb-5 text-4xl font-bold">${userInSession.fullName}</h2>
				<p class="m-2 text-gray-700">${userInSession.phoneNumber}</p>
			</div>
			<div class="flex flex-col items-center">
				<a href="/" class="mb-2 w-fit rounded-full bg-orange-500 px-10 py-2 text-white hover:bg-orange-700">Editar Perfil</a>
				<a href="/nueva-publicacion" class="w-fit rounded-full bg-gray-700 px-10 py-2 text-white hover:bg-gray-800">Crear Post</a>
			</div>
		</div>
		<!-- Orders and Publications Section -->
		<div class="mx-auto w-full rounded-xl bg-white p-6 shadow-md">
			<!-- Orders Section -->
			<div class="mb-8">
				<h3 class="mb-4 text-xl font-bold">�rdenes Pendientes:</h3>
				<c:choose>
					<c:when test="${not empty pendingOrders}">
						<c:forEach items="${pendingOrders}" var="po">
							<div class="mb-4 flex gap-x-2 items-center rounded-lg bg-gray-100 p-4 shadow-md">
								<div class="size-16 rounded-full bg-orange-700 p-1 drop-shadow-[0_4px_4px_rgba(0,0,0,0.25)] md:p-2">
									<img src="<c:url value='/images/iconos/${po.category}.png'/>" alt="${po.category}" />
								</div>
								<a class="text-gray-800" href="/">�${po.client.fullName} solicit� tus servicios!</a>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>Por el momento no se hay ordenes pendientes.</p>
					</c:otherwise>
				</c:choose>
				<h3 class="mb-4 text-xl font-bold">�rdenes Concretadas:</h3>
				<c:choose>
					<c:when test="${not empty completedOrders}">
						<c:forEach items="${completedOrders}" var="co">
							<div class="mb-4 flex gap-x-2 items-center rounded-lg bg-gray-100 p-4 shadow-md">
								<div class="size-16 rounded-full bg-orange-700 p-1 drop-shadow-[0_4px_4px_rgba(0,0,0,0.25)] md:p-2">
									<img src="<c:url value='/images/iconos/${co.category}.png'/>" alt="${co.category}" />
								</div>
								<p class="text-gray-800">�Realizaste un trabajo para ${co.client.fullName}!</p>
								<img src="https://placehold.co/20x20" alt="Check Icon" class="ml-auto h-6 w-6" />
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>Por el momento no se concretaron ordenes.</p>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- Publications Section -->
			<div>
				<h3 class="mb-4 text-xl font-bold">Tus Publicaciones:</h3>
				<c:choose>
					<c:when test="${not empty posts}">
						<c:forEach items="${posts}" var="post">
							<div class="mb-4 flex gap-x-2 items-center rounded-lg bg-gray-100 p-4 shadow-md">
								<div class="size-16 rounded-full bg-orange-700 p-1 drop-shadow-[0_4px_4px_rgba(0,0,0,0.25)] md:p-2">
									<img src="<c:url value='/images/iconos/${post.category}.png'/>" alt="${post.category}" />
								</div>
								<p class="text-gray-800">${post.title}</p>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>Todav�a no hay publicaciones creadas.</p>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</main>