package com.bibabo.realtime.task.bean;

import lombok.Getter;
import lombok.Setter;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 19:12
 * @Description
 */
@Getter
@Setter
public class Cell {

    private boolean key;

    private boolean updated;

    private String colName;

    private String colValue;

    private boolean toNull;

    private String currentColName;

}
