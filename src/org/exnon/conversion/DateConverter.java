package org.exnon.conversion;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

public class DateConverter extends StrutsTypeConverter {

	private static final DateFormat FORMAT_1 = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm");

	@Override
	public Object convertFromString(Map context, String[] values, Class toType) {
		try {
			if (toType == Date.class && values != null && values.length > 0) {
				return FORMAT_1.parse(values[0]);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String convertToString(Map context, Object obj) {
		return FORMAT_1.format((Date) obj);
	}

}
