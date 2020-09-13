package com.sda.javagda31.mechanics.servlet;

import com.sda.javagda31.mechanics.database.EntityDao;
import com.sda.javagda31.mechanics.model.Car;
import com.sda.javagda31.mechanics.model.ServiceOrder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@WebServlet("/add/service/order/form")
public class AddServiceOrderServlet extends HttpServlet {
    private final EntityDao<Car> carEntityDao = new EntityDao<>();
    private final EntityDao<ServiceOrder> ServiceOrderEntityDao = new EntityDao<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String carIdString = req.getParameter("carId");
        if (carIdString != null) {
            req.setAttribute("carId", carIdString);
        }

        List<Car> carList = carEntityDao.findAll(Car.class);
        req.setAttribute("all_cars", carList);


        req.getRequestDispatcher("/add_service_order.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long carId = Long.valueOf(req.getParameter("carIdValue"));
        Optional<Car> carOptional = carEntityDao.findById(carId, Car.class);
        if (carOptional.isPresent()) {
            Car car = carOptional.get();

            ServiceOrder serviceOrder = ServiceOrder.builder()
                    .content("contentValue")
                    .dateTimeAdded(LocalDateTime.parse("dateTimeAddedValue"))
                    .dateFinished(LocalDateTime.parse("dateTimeFinishedValue"))
                    .build();

            ServiceOrderEntityDao.saveOrUpdate(serviceOrder);
        }
        resp.sendRedirect(req.getContextPath() + "/car/details?id=" + carId);
    }
}
