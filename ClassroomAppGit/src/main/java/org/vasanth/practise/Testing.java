package org.vasanth.practise;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by vasanthreddy on 16/04/17.
 */
public class Testing {
    public static void main(String[] args) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
        String dateInString = "31-8-06 10:20:56";
        Date date = sdf.parse(dateInString);
        System.out.println(date);
    }
}
