package com.bibabo.guavacache;

import lombok.Data;

import java.util.Objects;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2023/10/27 17:32
 * @Description
 */
@Data
public class GuavaObject {

    private Long id;

    private String name;

    /*@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GuavaObject that = (GuavaObject) o;
        return Objects.equals(id, that.id) && Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name);
    }*/
}
