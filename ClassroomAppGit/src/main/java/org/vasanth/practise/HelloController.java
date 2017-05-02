package org.vasanth.practise;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.services.classroom.model.Date;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.classroom.ClassroomScopes;
import com.google.api.services.classroom.model.*;
import com.google.api.services.classroom.Classroom;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class HelloController {
    /**
     * Application name.
     */
    public static com.google.api.services.classroom.Classroom service;
    private static final String APPLICATION_NAME =
            "PlagoD";
    private static String cid = "";
    /**
     * Directory to store user credentials for this application.
     */
    private static final java.io.File DATA_STORE_DIR = new java.io.File(
            System.getProperty("user.home"), ".credentials/classroom.googleapis.com-java-quickstart");

    /**
     * Global instance of the {@link FileDataStoreFactory}.
     */
    private static FileDataStoreFactory DATA_STORE_FACTORY;

    /**
     * Global instance of the JSON factory.
     */
    private static final JsonFactory JSON_FACTORY =
            JacksonFactory.getDefaultInstance();

    /**
     * Global instance of the HTTP transport.
     */
    private static HttpTransport HTTP_TRANSPORT;

    /**
     * Global instance of the scopes required by this quickstart.
     * <p>
     * If modifying these scopes, delete your previously saved credentials
     * at ~/.credentials/classroom.googleapis.com-java-quickstart
     */
    private static final List<String> SCOPES = new ArrayList<String>(ClassroomScopes.all());

    static {
        try {
            HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
            DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);
        } catch (Throwable t) {
            t.printStackTrace();
            System.exit(1);
        }
    }

    /**
     * Creates an authorized Credential object.
     *
     * @return an authorized Credential object.
     * @throws IOException
     */
    public static Credential authorize() throws IOException {
        // Load client secrets.
        InputStream in =
                Quickstart.class.getResourceAsStream("/client_secret.json");
        GoogleClientSecrets clientSecrets =
                GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

        // Build flow and trigger user authorization request.
        GoogleAuthorizationCodeFlow.Builder flowBuilder =
                new GoogleAuthorizationCodeFlow.Builder(
                        HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
                        .setDataStoreFactory(DATA_STORE_FACTORY).setApprovalPrompt("force")
                        .setAccessType("offline");


        GoogleAuthorizationCodeFlow flow = flowBuilder.build();
        LocalServerReceiver LSR = new LocalServerReceiver.Builder().setPort(6543).build();
        Credential credential = new AuthorizationCodeInstalledApp(
                flow, LSR).authorize("user");
        System.out.println(
                "Credentials saved to " + DATA_STORE_DIR.getAbsolutePath());
        return credential;
    }

    /**
     * Build and return an authorized Classroom client service.
     *
     * @return an authorized Classroom client service
     * @throws IOException
     */
    public static com.google.api.services.classroom.Classroom
    getClassroomService() throws IOException {
        Credential credential = authorize();
        return new com.google.api.services.classroom.Classroom.Builder(
                HTTP_TRANSPORT, JSON_FACTORY, credential)
                .setApplicationName(APPLICATION_NAME)
                .build();
    }

    /**
     * LANDING PAGE that displays the courses in the user's google classroom account
     */
    @RequestMapping("/welcome")
    public String helloworld(Map<String, Object> model) throws IOException {
         service =
                getClassroomService();

        // List the first 10 courses that the user has access to.
        ListCoursesResponse response = service.courses().list()
                .setPageSize(10)
                .execute();
        List<Course> courses = response.getCourses();
       // courses.get(1).

        if (courses == null || courses.size() == 0) {
            System.out.println("No courses found.");
        } else {
            System.out.println("Courses:");
            for (Course course : courses) {
                System.out.printf("%s\n", course.getName());
                cid = course.getId();
                model.put("coursevar",courses);

                break;

            }
        }
        //TODO Need to add courses
       // model.put("coursevar",course);
        model.put("userData", new UserData());
        return "index";
    }
    @RequestMapping("/langing")
    public String landing(Map<String, Object> model){
        return "langing";
    }

    @RequestMapping(value = "/formcheck", method = RequestMethod.POST)
    public String addStudent(@ModelAttribute("UserData")UserData ud,
                             ModelMap model) throws ParseException, IOException {

        try {
            System.out.println("Got the form");
            System.out.println(ud.courseId);
            System.out.println(ud.due);
            System.out.println(ud.due_time);
            System.out.println(stringToDate(ud.due));
            System.out.println(stringToTime(ud.due_time));
            Date asdate = stringToDate(ud.due);
            TimeOfDay astime = stringToTime(ud.due_time);
            CourseWork work = new CourseWork();
            work.setDueDate(stringToDate(ud.due)).setDueTime(stringToTime(ud.due_time));
            work.setTitle(ud.getTitle());
            work.setWorkType("ASSIGNMENT");
            work.setAlternateLink("no link");
            work.setDescription(ud.getInstruction());
            work.setState("PUBLISHED");
            //service.courses().courseWork().create(cid, work).execute();
            service.courses().courseWork().create(ud.getCourseId(), work).execute();
            System.out.println(" Successfully posted");

            SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy HH:mm:ss");
            String dateInString = asdate.getDay() + "-" + asdate.getMonth() + "-" + asdate.getYear() + " " + astime.getHours() + ":" + astime.getMinutes() + ":" + "00";
            java.util.Date date_java = sdf.parse(dateInString);
            CourseWork work_followup = new CourseWork();
            work_followup.setDueDate(stringToDate(ud.getPlgDate())).setDueTime(stringToTime(ud.getPlgTime()));
            work_followup.setTitle("Followup of : " + ud.getTitle());
            work_followup.setWorkType("ASSIGNMENT");
            work_followup.setAlternateLink("");
            work_followup.setDescription("Click the below URL and hurry!!" + ud.getPlagiarismUrl());
            postFollowupOn(cid, work_followup, date_java);

            model.put("hi", "hi vasanth");


            return "success_page";
        }
        catch (Exception e){
            return "failure_page";
        }
    }
public Date stringToDate(String d) throws ParseException {
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date dd = df.parse(d);
    System.out.println(" D " + dd);
    Date dd2 = new Date().setDay(dd.getDate()).setMonth(1+dd.getMonth()).setYear(1900+dd.getYear());
    return dd2;

}
    public TimeOfDay stringToTime(String t) throws ParseException {
        SimpleDateFormat format24 = new SimpleDateFormat("HH:mm");
        java.util.Date dd = format24.parse(t);

        System.out.println(" T "+dd);

        TimeOfDay t2 = new TimeOfDay().setHours(dd.getHours()).setMinutes(dd.getMinutes());
        return t2;
    }


    /**
     * create The assignment by getting information from the form where the user enters required details
     */
    @RequestMapping("/createAssignment")
    public ModelAndView createAction() throws IOException, ParseException {
        String courseId ="";
        int day =29, day_followup =29;
        int month=04, month_followup=04;
        int year=2017, year_followup=2017;
        int hr=21, hr_followup =22; int min=30, min_followup=10 ; int sec=0, sec_followup=0;
        Date date = new Date().setDay(day).setMonth(month).setYear(year);
        TimeOfDay t = new TimeOfDay().setHours(hr).setMinutes(min).setSeconds(sec);

        CourseWork work = new CourseWork();
        work.setDueDate(date).setDueTime(t);
        work.setTitle("Title 2");
        work.setWorkType("ASSIGNMENT");
        work.setAlternateLink("d");
        work.setDescription("Trail 2");
        work.setState("PUBLISHED");
        CourseWork reponse = service.courses().courseWork().create(cid, work).execute();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy HH:mm:ss");
        String dateInString = day+"-"+month+"-"+year+" "+hr+":"+min+":"+sec;
        java.util.Date date_java = sdf.parse(dateInString);
        service.courses().courseWork().create(cid, work).execute();
        System.out.println(" Successfully posted");

        Date date_followup = new Date().setDay(day_followup).setMonth(month_followup).setYear(year_followup);
        TimeOfDay time_followup = new TimeOfDay().setHours(hr_followup).setMinutes(min_followup).setSeconds(sec_followup);

        CourseWork work_followup = new CourseWork();
        work_followup.setDueDate(date_followup).setDueTime(time_followup);
        work_followup.setTitle("Followup Title 2");
        work_followup.setWorkType("ASSIGNMENT");
        work_followup.setAlternateLink("");
        work_followup.setDescription("This is a followup assignment 2. Click the URL to begin. Hurry!");
        postFollowupOn(cid,work_followup,date_java);
        return null;
    }

    public void postFollowupOn(String courseId, CourseWork workf, java.util.Date d2) throws ParseException {
       Timer timer = new Timer();
        System.out.println(" Successfully scheduling");
        System.out.println(" Delay "+d2.getTime());
        System.out.println(" Delay "+System.currentTimeMillis());

        System.out.println(" Delay "+(d2.getTime()-System.currentTimeMillis()));

        timer.schedule(new ScheduleAssignment(service, courseId, workf ),  d2.getTime()-System.currentTimeMillis());

    }
}

