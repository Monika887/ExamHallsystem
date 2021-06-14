package com.exam.course;

public class course {
	private int course_id;
	private String course_name,course_total_semestor,course_description;
	public course() {
		
	}
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public String getCourse_total_semestor() {
		return course_total_semestor;
	}
	public void setCourse_total_semestor(String course_total_semestor) {
		this.course_total_semestor = course_total_semestor;
	}
	public String getCourse_description() {
		return course_description;
	}
	public void setCourse_description(String course_description) {
		this.course_description = course_description;
	}
	
}
