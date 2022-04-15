package com.bibabo.GOF23.flyweight.test;

import java.util.Objects;

/**
 * @author fukuixiang
 * @date 2021/2/24
 * @time 18:48
 * @description
 */
public class Point {

    /**
     * 经度
     */
    private int longitude;

    /**
     * 纬度
     */
    private int latitude;

    public Point(int longitude, int latitude) {
        this.longitude = longitude;
        this.latitude = latitude;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Point point = (Point) o;
        return longitude == point.longitude &&
                latitude == point.latitude;
    }

    @Override
    public int hashCode() {
        return Objects.hash(longitude, latitude);
    }

    public int getLongitude() {
        return longitude;
    }

    public void setLongitude(int longitude) {
        this.longitude = longitude;
    }

    public int getLatitude() {
        return latitude;
    }

    public void setLatitude(int latitude) {
        this.latitude = latitude;
    }
}
