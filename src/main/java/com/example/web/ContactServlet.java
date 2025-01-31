/*package com.example.web;

import java.io.FileInputStream;
import java.io.IOException;
import java.time.temporal.ValueRange;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.services.sheets.v4.Sheets;
import com.google.api.services.sheets.v4.SheetsScopes;
import com.google.auth.http.HttpCredentialsAdapter;
import com.google.auth.oauth2.GoogleCredentials;

public class ContactServlet extends HttpServlet {
    private static final String SPREADSHEET_ID = "your_spreadsheet_id"; // Replace with your Google Sheet ID
    private static final String RANGE = "Sheet1!A:C"; // Adjust the range as needed

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Save data to Google Sheets
        try {
            saveDataToGoogleSheet(name, email, message);
            response.getWriter().write("Form submitted successfully and saved to Google Sheets.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error saving data to Google Sheets.");
        }
    }

    private void saveDataToGoogleSheet(String name, String email, String message) throws IOException {
        
        FileInputStream serviceAccountStream = new FileInputStream("path/to/your/credentials.json"); // Replace with the path to your JSON file
        GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccountStream)
                .createScoped(Collections.singleton(SheetsScopes.SPREADSHEETS));
        Sheets sheetsService = new Sheets.Builder(new com.google.api.client.http.javanet.NetHttpTransport(),
                com.google.api.client.json.JsonFactory.getDefaultInstance(), new HttpCredentialsAdapter(credentials))
                .setApplicationName("Online Quiz System")
                .build();

        // Prepare the data to be inserted
        List<List<Object>> values = Arrays.asList(
                Arrays.asList(name, email, message)
        );
        ValueRange body = new ValueRange().setValues(values);

        // Append data to the Google Sheet
        sheetsService.spreadsheets().values()
                .append(SPREADSHEET_ID, RANGE, body)
                .setValueInputOption("RAW")
                .execute();
    }
}
*/
