package org.vasanth.practise;

import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Time;
import java.util.Date;

/**
 * Created by vasanthreddy on 01/05/17.
 */
public class UserData {
    public String courseId;
    public String title;
    public String instruction;

    public String getPlagiarismUrl() {
        return plagiarismUrl;
    }

    public void setPlagiarismUrl(String plagiarismUrl) {
        this.plagiarismUrl = plagiarismUrl;
    }

    public String plagiarismUrl;

    public Boolean getPlagiarismCheck() {
        return plagiarismCheck;
    }

    public void setPlagiarismCheck(Boolean plagiarismCheck) {
        this.plagiarismCheck = plagiarismCheck;
    }

    public Boolean plagiarismCheck;
  //  @DateTimeFormat(pattern = "dd/MM/yyyy")
    public String due,plgDate;

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getInstruction() {
        return instruction;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public String getDue() {
        return due;
    }

    public void setDue(String due) {
        this.due = due;
    }

    public String getPlgDate() {
        return plgDate;
    }

    public void setPlgDate(String plgDate) {
        this.plgDate = plgDate;
    }

    public String getDue_time() {
        return due_time;
    }

    public void setDue_time(String due_time) {
        this.due_time = due_time;
    }

    public String getPlgTime() {
        return plgTime;
    }

    public void setPlgTime(String plgTime) {
        this.plgTime = plgTime;
    }

    public String due_time,plgTime;

    UserData(){

    }

}
