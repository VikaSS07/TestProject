<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.processdata.entity.Transaction"%>
<%@page import="java.util.ArrayList,jakarta.servlet.RequestDispatcher"%>
<!DOCTYPE html>
<div class="container-fluid" style="padding-top: 50px">
	<h2>Welcome</h2>
	<p>To sort data please click on column heading</p>
	<div class="card">
		<table class="table table-hover" id="myTable">
			<thead class="table-dark">
				<tr>
					<th onclick="sortTablenums(0)"><a>TranxId</a></th>
					<th onclick="sortTablenums(1)">OrderId</th>
					<th onclick="sortTablenums(2)">Date</th>
					<th onclick="sortTablenums(3)">Quantity</th>
					<th onclick="sortTablenums(4)">Sales</th>
					<th onclick="sortTable(5)">Ship Mode</th>
					<th onclick="sortTablenums(6)">Profit</th>
					<th onclick="sortTablenums(7)">Unit Price</th>
					<th onclick="sortTable(8)">Customer Name</th>
					<th onclick="sortTable(9)">Customer segment</th>
					<th onclick="sortTable(10)">Product Category</th>
				</tr>
			</thead>
			<%
			ArrayList<Transaction> transactions = (ArrayList<Transaction>) request.getAttribute("transactions");
			if (transactions == null) {
				response.sendRedirect("view-data?offset=0");
			} else {
			%><tbody>
				<%
				for (Transaction tx : transactions) {
				%>
				<tr>
					<td><%=tx.getTransid()%></td>
					<td><%=tx.getOrderId()%></td>
					<td><%=tx.getDate()%></td>
					<td><%=tx.getOrder_quantity()%></td>
					<td><%=tx.getSales()%></td>
					<td><%=tx.getShip_mode()%></td>
					<td><%=tx.getProfit()%></td>
					<td><%=tx.getUnit_price()%></td>
					<td><%=tx.getCust_name()%></td>
					<td><%=tx.getCust_segment()%></td>
					<td><%=tx.getProduct_category()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
			<%
			}
			%>
		</table>
	</div>
</div>
<%
if (transactions != null) {
	int count = 0;
	int pages = 0;
	count = (Integer) request.getAttribute("count");
	pages = count / 100;
%>
<div class="row justify-content" style="padding-top: 5px; padding-left: 12px">
	<div class="col col-lg-2">
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link"
					href="view-data?offset=0">Previous</a></li>
				<%
				if (pages != 0) {
					for (int i = 0; i <= pages; i++) {
				%>
				<li class="page-item"><a class="page-link"
					href="view-data?offset=<%=i * 100%>"><%=i + 1%></a></li>
				<%
				}
				}
				}
				%>

				<li class="page-item"><a class="page-link"
					href="view-data?offset=50">Next</a></li>
			</ul>
		</nav>
	</div>
</div>



<script>
	function sortTablenums(n) {
		var table, rows, switching, i, x, y, shouldSwitch;
		table = document.getElementById("myTable");
		switching = true;
		/*Make a loop that will continue until
		no switching has been done:*/
		while (switching) {
			//start by saying: no switching is done:
			switching = false;
			rows = table.rows;
			/*Loop through all table rows (except the
			first, which contains table headers):*/
			for (i = 1; i < (rows.length - 1); i++) {
				//start by saying there should be no switching:
				shouldSwitch = false;
				/*Get the two elements you want to compare,
				one from current row and one from the next:*/
				x = rows[i].getElementsByTagName("TD")[n];
				y = rows[i + 1].getElementsByTagName("TD")[n];
				//check if the two rows should switch place:
				if (Number(x.innerHTML) > Number(y.innerHTML)) {
					//if so, mark as a switch and break the loop:
					shouldSwitch = true;
					break;
				}
			}
			if (shouldSwitch) {
				/*If a switch has been marked, make the switch
				and mark that a switch has been done:*/
				rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
				switching = true;
			}
		}
	}

	function sortTable(n) {
		var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
		table = document.getElementById("myTable");
		switching = true;
		// Set the sorting direction to ascending:
		dir = "asc";
		/* Make a loop that will continue until
		no switching has been done: */
		while (switching) {
			// Start by saying: no switching is done:
			switching = false;
			rows = table.rows;
			/* Loop through all table rows (except the
			first, which contains table headers): */
			for (i = 1; i < (rows.length - 1); i++) {
				// Start by saying there should be no switching:
				shouldSwitch = false;
				/* Get the two elements you want to compare,
				one from current row and one from the next: */
				x = rows[i].getElementsByTagName("TD")[n];
				y = rows[i + 1].getElementsByTagName("TD")[n];
				/* Check if the two rows should switch place,
				based on the direction, asc or desc: */
				if (dir == "asc") {
					if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
						// If so, mark as a switch and break the loop:
						shouldSwitch = true;
						break;
					}
				} else if (dir == "desc") {
					if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
						// If so, mark as a switch and break the loop:
						shouldSwitch = true;
						break;
					}
				}
			}
			if (shouldSwitch) {
				/* If a switch has been marked, make the switch
				and mark that a switch has been done: */
				rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
				switching = true;
				// Each time a switch is done, increase this count by 1:
				switchcount++;
			} else {
				/* If no switching has been done AND the direction is "asc",
				set the direction to "desc" and run the while loop again. */
				if (switchcount == 0 && dir == "asc") {
					dir = "desc";
					switching = true;
				}
			}
		}
	}

	function myFunction() {
		// Declare variables
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");

		// Loop through all table rows, and hide those who don't match the search query
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[5];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
</script>
