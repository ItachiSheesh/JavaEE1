<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.Aldiyar.bitlab.servlets.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <%@include file="head.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container mt-5 pb-5">
  <%
    Task task = (Task) request.getAttribute("zadaniya");
    if(task!=null){
  %>
  <div class="row">
    <div class="col-6 mx-auto">
      <div class="row">
        <div class="col-12">
          <label>Наименование: </label>
        </div>
      </div>
      <div class="row mt-2">
        <div class="col-12">
          <input type="text" class="form-control" readonly value="<%=task.getName()%>">
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-12">
          <label>Описание: </label>
        </div>
      </div>
      <div class="row mt-2">
        <div class="col-12">
          <textarea class="form-control" readonly rows="10"><%=task.getDescription1()%></textarea>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-12">
          <label>Крайний срок: </label>
        </div>
      </div>
      <div class="row mt-2">
        <div class="col-12">
          <input type="date" class="form-control" readonly value="<%=task.getDeadlineDate()%>" >
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-12">
          <label>Выполнено? </label>
        </div>
      </div>
      <div class="row mt-2">
        <div class="col-12">
          <select>
            <option <%=(task.getDescription().equals("Да")?"selected":"")%>>Да</option>
            <option <%=(task.getDescription().equals("Нет")?"selected":"")%>>Нет</option>
          </select>
        </div>
      </div>
      <div class="row mt-3">
        <div class="col-12">
          <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#editTask">
            Изменить
          </button>
          <!-- Button trigger modal -->
          <button type="button" class="btn btn-danger btn-sm ms-2" data-bs-toggle="modal" data-bs-target="#deleteTask">
            Удалить
          </button>
        </div>
      </div>
      <!-- Modal -->
      <div class="modal fade" id="deleteTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <form action="/delete-task" method="post">
              <input type="hidden" name="id" value="<%=task.getId()%>">
              <div class="modal-header">
                <h1 class="modal-title fs-5">Confirm Delete</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <h5 class="text-center">Ты уверен?</h5>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Нет</button>
                <button class="btn btn-danger">Да</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="modal fade" id="editTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form action="/save-task" method="post">
                <input type="hidden" name="task_id" value="<%=task.getId()%>">
                <div class="row">
                  <div class="col-12">
                    <label>Наименование: </label>
                  </div>
                </div>
                <div class="row mt-2">
                  <div class="col-12">
                    <input type="text" class="form-control" name="task_name" value="<%=task.getName()%>">
                  </div>
                </div>
                <div class="row mt-3">
                  <div class="col-12">
                    <label>Описание: </label>
                  </div>
                </div>
                <div class="row mt-2">
                  <div class="col-12">
                    <textarea class="form-control" rows="10" name="task_descr"><%=task.getDescription1()%></textarea>
                  </div>
                </div>
                <div class="row mt-3">
                  <div class="col-12">
                    <label>Крайний срок:</label>
                  </div>
                </div>
                <div class="row mt-2">
                  <div class="col-12">
                    <input type="date" class="form-control" name="task_date" value="<%=task.getDeadlineDate()%>">
                  </div>
                </div>
                <div class="row mt-3">
                  <div class="col-12">
                    <label>Выполнено? </label>
                  </div>
                </div>
                <div class="row mt-2">
                  <div class="col-12">
                    <select class="form-select" name="task_info">
                      <option <%=(task.getDescription().equals("Да")?"selected":"")%>>Да</option>
                      <option <%=(task.getDescription().equals("Нет")?"selected":"")%>>Нет</option>
                    </select>
                  </div>
                </div>
                <div class="row mt-3">
                  <div class="col-12">
                    <button class="btn btn-success">Сохранить</button>
                  </div>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%
  }else{
  %>
  <h3 class="text-center">
    TASK NOT FOUND
  </h3>
  <%
    }
  %>
</div>
</body>
</html>