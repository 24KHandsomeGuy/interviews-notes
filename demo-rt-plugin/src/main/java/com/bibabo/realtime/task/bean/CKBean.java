package com.bibabo.realtime.task.bean;

import lombok.Getter;
import lombok.Setter;
import org.apache.avro.generic.GenericRecord;

import java.util.List;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/9/26 19:10
 * @Description canal event
 */
@Getter
@Setter
public class CKBean {

    private String destination;

    private String dbName;

    private String tblName;

    private String opType;

    private long exeTime;

    private long seq;

    private boolean endTran;

    private List<Cell> cells;

    private GenericRecord genericRecord;

    private int schemaId;

    private String originalTopic;

    private int odsBinlogColumnCount = -1;

    private int odsCkbeanColumnCount = -1;

    private String logName;

    private Long startLogPos;

    private Long endLogPos;

    private String uniqueKey;

    private String gtids;

}
