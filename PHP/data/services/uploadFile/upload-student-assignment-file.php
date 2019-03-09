<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");


	$json = json_decode(file_get_contents('php://input'), true);
	$tempname = $json['assignmentFile']['filename'];

	$lastIndex = strripos($tempname, ".");
	$format = substr($tempname, $lastIndex);

	$fName = strripos($json['assignmentName'],".");
	$strng = substr($json['assignmentName'], 0,$fName);

	$assignmentName2 = $strng.$format;
	$output = array();
	$output["Message"]="";
	$output["Success"]="N";
	$output["name"] = $assignmentName2;


	 if(file_put_contents("../../../../../tomcat/webapps/AssignmentDistribution/assets/studentAssignments/".$assignmentName2, base64_decode($json['assignmentFile']['value'])))
	 {
	 	$output["Success"]="Y";
	 	$output["Filename"] = $assignmentName2;
	 	$outpur["Message"]="File Uploaded";
	 }
	 else
	 {
	 	$output["Success"]="N";
	 	$outpur["Message"]="File Upload Failed";
	 }
	
	echo json_encode($output);
?>