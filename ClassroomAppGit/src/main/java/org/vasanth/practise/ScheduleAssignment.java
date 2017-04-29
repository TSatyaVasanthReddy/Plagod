package org.vasanth.practise;
import com.google.api.services.classroom.model.*;

import com.google.api.services.classroom.model.Date;

import java.io.IOException;
import java.net.URL;
import java.sql.Time;
import java.util.TimerTask;

/**
 * Created by vasanthreddy on 16/04/17.
 */
public class ScheduleAssignment extends TimerTask {
    public static String courseId;
    public static CourseWork work;
    public static com.google.api.services.classroom.Classroom service;


    ScheduleAssignment(com.google.api.services.classroom.Classroom s ,String id, CourseWork wf){

        work = wf;
        courseId =id;
        service = s;
        System.out.println("Created followup scheduler");

    }
    public void run(){
        work.setState("PUBLISHED");
        try {
            System.out.println(" Posting followup");
            CourseWork reponse = service.courses().courseWork().create(courseId, work).execute();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
