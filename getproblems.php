<?php
  //Create Connection with MySQL Database
  $con = mysqli_connect('localhost','root','12345');

  //Select Database
  if(!mysqli_select_db($con,'profiles'))
  {
      echo "Database Not Selected";
  }
  //Select Query
  $sql = "SELECT * FROM users";

  //Execute the SQL query
  $records = mysqli_query($con,$sql);

  echo "<table border=1 cellpadding=1 cellspacing=1>
      <tr>
          <th> problemNumber </th>
          <th> question </th>
          <th> courseNumber </th>
      </tr>";
  while($row = mysqli_fetch_array($records)) {
      echo "<tr>";
      echo "<td>" . $row['problemNumber'] . "</td>";
      echo "<td>" . $row['question'] . "</td>";
      echo "<td>" . $row['courseNumber'] . "</td>";
      echo "</tr>";
  }
  echo "</table>";
  mysqli_close($con);
?>
