<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");


	$json = json_decode(file_get_contents('php://input'), true);
	$tempname = $json['assignmentFile']['filename'];

	$lastIndex = strripos($tempname, ".");
	$format = substr($tempname, $lastIndex);

	$assignmentName2 = $json['assignmentName'].' assignmentNo-'.time().$format;
	$output = array();
	$output["Message"]="";
	$output["Success"]="N";

	 if(file_put_contents("../../../../../tomcat/webapps/AssignmentDistribution/assets/facultyAssignments/".$assignmentName2, base64_decode($json['assignmentFile']['value'])))
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