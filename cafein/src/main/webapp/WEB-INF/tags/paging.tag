<!-- 19/06/27 재홍 tags 폴더 만들고 paging.tag 추가  -->
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="com.cbt.common.Paging" %>
<%@ attribute name="jsFunc" required="false" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty jsFunc}">
   <c:set var="jsFunc" value="go_page"></c:set>
</c:if>
<!-- 19/06/27 재홍 페이징 처리 버튼 생성 	https://getbootstrap.com/docs/4.3/components/pagination/-->
<ul class="pagination">
<li class="page-item"><a class="page-link" href="javascript:${jsFunc}(${paging.startPage>2?paging.startPage-1:1})"> 이전 </a>
<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
   <c:if test="${i != paging.page}">
      <li class="page-item"><a href="javascript:${jsFunc}(${i})" class="page-link">${i}</a>
   </c:if>
   <c:if test="${i == paging.page}">
      <li class="active page-item"><a href="javascript:${jsFunc}(${i})" class="page-link">${i}</a>
   </c:if>
</c:forEach>
<li class="page-item"><a class="page-link" href="javascript:${jsFunc}(${paging.lastPage<paging.endPage?paging.endPage+1:paging.endPage})"> 다음 </a>
</ul>

