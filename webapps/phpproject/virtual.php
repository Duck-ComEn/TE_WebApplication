<?php require_once("java/Java.inc");

java_session();

echo "jsp says: ".java_virtual("/jsr223.jsp", true);
echo "<br>Previous output generated by /jsr223.jsp resource";

?>
