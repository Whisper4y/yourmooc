package org.kite3.web;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/identiry")
public class IdentifyCodeController {

	@RequestMapping("/code")
	public void init(HttpServletRequest request, HttpServletResponse response) {

		// 产生四位的随机数
		String random = RandomStringUtils.randomAlphanumeric(4);
		// 产生的随机数存储在session中
		request.getSession().setAttribute("random", random);

		response.setContentType("image/jpeg");
		response.addHeader("pragma", "NO-cache");
		response.addHeader("Cache-Control", "no-cache");
		response.addDateHeader("Expries", 0);
		int width = 110, height = 33;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();

		// 填充背景色
		g.setColor(new Color(225, 225, 225));
		Font DeFont = new Font("SansSerif", Font.PLAIN, 26);
		g.setFont(DeFont);
		g.fillRect(0, 0, width, height);

		// 设置字体色
		g.setColor(Color.BLACK);
		g.drawString(random, 20, 25);
		g.dispose();

		try {
			ServletOutputStream outStream = response.getOutputStream();
			ImageIO.write(image, "JPG", outStream);
			outStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
