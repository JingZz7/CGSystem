package com.easyknowharddo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName("t_knowledge_point")
public class KnowledgePoint {

    @TableId(value = "pk_knowledge_point_id", type = IdType.ASSIGN_ID)
    private String pkKnowledgePointId;

    @TableField("id")
    private String id;

    @TableField("name")
    private String name;

    @TableField("student_id")
    private String StudentId;

    public KnowledgePoint() {
    }

    @Override
    public String toString() {
        return "KnowledgePoint{"
                + "pkKnowledgePointId='"
                + pkKnowledgePointId
                + '\''
                + ", id='"
                + id
                + '\''
                + ", name='"
                + name
                + '\''
                + ", StudentId='"
                + StudentId
                + '\''
                + '}';
    }

    public String getPkKnowledgePointId() {
        return pkKnowledgePointId;
    }

    public void setPkKnowledgePointId(String pkKnowledgePointId) {
        this.pkKnowledgePointId = pkKnowledgePointId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStudentId() {
        return StudentId;
    }

    public void setStudentId(String studentId) {
        StudentId = studentId;
    }

    public KnowledgePoint(String pkKnowledgePointId, String id, String name, String studentId) {
        this.pkKnowledgePointId = pkKnowledgePointId;
        this.id = id;
        this.name = name;
        StudentId = studentId;
    }
}
