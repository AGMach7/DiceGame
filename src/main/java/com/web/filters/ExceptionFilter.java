package com.web.filters;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.info.Message;

import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.*;

public class ExceptionFilter extends HttpFilter {
	Logger LOGGER = Logger.getLogger(getClass());
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		LOGGER.debug("Running the ExceptionFilter filter");

		try {
			chain.doFilter(request, response);

		} catch (Exception e) {

			LOGGER.debug("Error handled by the filter. Cause of exception :" + e.getMessage(), e);

			List<Message> list = new ArrayList<>();

			list.add(new Message("An error has occurred please check the log file for more details.", Message.ERROR));

			request.setAttribute("messages", list);

			getServletContext().getRequestDispatcher("/WEB-INF/vues/pages/error.jsp").forward(request, response);
		}
	}
}