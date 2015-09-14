package com.guql.cy.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * 
 * 〈一句话功能简述〉<br> 
 * 〈获取验证码〉
 *
 * @author guqianglong
 * @see [相关类/方法]（可选）
 * @since [产品/模块版本] （可选）
 */
public class VerificationCode {
    /**
     * 验证码
     */
    public static String verificationCode;
    /**
     * 图片宽度
     */
    private final static int WIDRH = 80;
    /**
     * 图片高度
     */
    private final static int HEIGHT = 25;
    /**
     * 数字集
     */
    private final static String NUMBER = "0123456789";
    /**
     * 小写字母集
     */
    private final static String LOWLETTER = "abcdefghijklmnopqrstuvwxyz";
    /**
     * 大写字母集
     */
    private final static String UPPERLETTER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    /**
     * 颜色集
     */
    private final static Color []COLORS = {Color.BLACK,Color.BLUE,Color.CYAN,Color.GREEN,Color.ORANGE,Color.RED,Color.WHITE,Color.YELLOW};
    /**
     * 
     * 功能描述: <br>
     * 〈获取验证码〉
     *
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    public static BufferedImage getVerificationCode(){
        
        Random random = new Random();
        //创建缓存图片
        BufferedImage image = new BufferedImage(80, 25, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        //换一个方块
        g.setColor(Color.LIGHT_GRAY);
        g.fillRect(0, 0, WIDRH, HEIGHT);
        //给图片添加验证码
        StringBuffer code = new StringBuffer();
        for(int i = 0;i < 4;i++){
            int num = random.nextInt(3);
            if(num == 0){
                code.append(NUMBER.charAt(random.nextInt(NUMBER.length())));
                code.append(" ");
                continue;
            }
            if(num == 1){
                code.append(LOWLETTER.charAt(random.nextInt(LOWLETTER.length())));
                code.append(" ");
                continue;
            }
            if(num == 2){
                code.append(UPPERLETTER.charAt(random.nextInt(UPPERLETTER.length())));
                code.append(" ");
                continue;
            }
        }
        g.setFont(new Font("宋体",Font.BOLD ,18));
        g.setColor(Color.BLACK);
        g.drawString(code.toString(), 5, 20);
        
        verificationCode = code.toString().replace(" ", "");
        
        //绘制干扰线
        int x1 = 0;
        int y1 = 0;
        int x2 = 0;
        int y2 = 0;
        for(int i = 0;i < 6;i++){
            x1 = random.nextInt(80);
            y1 = random.nextInt(25);
            x2 = random.nextInt(80);
            y2 = random.nextInt(25);
            g.setColor(COLORS[random.nextInt(8)]);
            g.drawLine(x1, y1, x2, y2);
        }
        g.dispose();
        
        return image;
    }
}
