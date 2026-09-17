package myPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.Scanner;
import java.lang.NullPointerException;

import com.google.gson.Gson;
import com.google.gson.*;

import com.google.gson.JsonObject;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// yaha inputdata me humne ek method laya ha jaha html ka userInput call hota ha servlet pe
		String inputdata = request.getParameter("userInput");
		
		// Api, input, url humne set kar dia
		String apiKey ="Enter your Api key";
		String city = inputdata;
		String apiURL = "https://api.openweathermap.org/data/2.5/weather?q="+ city +"&appid="+ apiKey;
		
		System.out.println("Client Connected to the server");
		
	try{
		// ab Api integration hogi
		URL url = new URL (apiURL); 
		
		// ab hoga URL connection http me
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestMethod("GET");
		
		// ab ek object pe connection ki data fetch karenge inputstream method se
		InputStream inputStream = connection.getInputStream();
		// ab read karenge internet se data jaha connection hua ha waha se inputstream se read karenge
		InputStreamReader data = new InputStreamReader(inputStream);
		
		// jo data aya use mutable string me store karenge stringbuilder se
		StringBuilder builder = new StringBuilder ();
		
		// yaha input lene ke liye from the reader stream data
		Scanner sc = new Scanner (data);
		
		// jabtak end line me na pohoch jayenge tabtak input lena hi hoga loop me
		while(sc.hasNext()) {
			builder.append(sc.nextLine());
		}
		
		// scanner input close kr denge kam ho jane ke bad
		sc.close();
		
		// agar woh data json format me print hoga to println karo
		System.out.println(builder);
		
		// ab typecasting karo, ek ek data parsing karo json format me 
		
		// yaha json data ko tree model me convert karnege
		 Gson gson = new Gson();
         JsonObject jsonObject = gson.fromJson(builder.toString(), JsonObject.class);
		
		// yaha sab total sata ko separayte karke show karenge ek ek karke
		
		// last me .getAsDatatype jo suru me datatype h usmehi hoga
		
		int myHumidity = jsonObject.getAsJsonObject("main").get("humidity").getAsInt();
		// yaha dusra chiz hoga... yaha ek array ha jiske index 0 pe dusra getasJO lagega jaha disra get main ayega
		String myWeather = jsonObject.getAsJsonArray("weather").get(0).getAsJsonObject().get("main").getAsString();
		
		long datetime = jsonObject.get("dt").getAsLong()*1000;
		String myDate = new Date(datetime).toString();
		
		double kelvin = jsonObject.getAsJsonObject("main").get("temp").getAsDouble();
		int myTemperature = (int) (kelvin - 273.15);
		
		
		request.setAttribute("date", myDate);
		request.setAttribute("city", city);
		request.setAttribute("weatherCondition", myWeather);
		request.setAttribute("temperature", myTemperature);
		request.setAttribute("humidity", myHumidity);
		request.setAttribute("weatherData", builder.toString());
		
		
		connection.disconnect();
	} catch (IOException e) {
        e.printStackTrace();
    }
	
		
		
		request.getRequestDispatcher("weather.jsp").forward(request, response);
	}

}