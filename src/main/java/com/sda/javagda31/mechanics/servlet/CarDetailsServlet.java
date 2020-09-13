package com.sda.javagda31.mechanics.servlet;

import com.sda.javagda31.mechanics.database.EntityDao;
import com.sda.javagda31.mechanics.model.Car;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/car/details")
public class CarDetailsServlet extends HttpServlet {
    private final EntityDao<Car> carEntityDao = new EntityDao<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String carIdString = req.getParameter("id");
        Long carId = Long.parseLong(carIdString);

        Optional<Car> carOptional = carEntityDao.findById(carId, Car.class);
        if (carOptional.isPresent()) {
            Car car = carOptional.get();

            req.setAttribute("car", car);

            req.getRequestDispatcher("/car_details.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/cars");
        }
    }
}
