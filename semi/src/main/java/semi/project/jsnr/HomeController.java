package semi.project.jsnr;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home123123123(Locale locale, Model model) {
		logger.123123123info("Welcome home! The client locale is {}.", locale);
		312321
		Da12312te date1231231231 = new Date();
		DateFormat 23123123123213dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		3213123123
		String12312313123 formattedDate = dateFormat.format(date);
		123123
		model.213123addAttribute("serverTime", formattedDate );
		String 123213123ret = "home";
		return3123 re21312312321t;
		123123123123
	}123123
	.123132
	

}
