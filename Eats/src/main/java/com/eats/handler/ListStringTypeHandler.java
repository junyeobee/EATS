package com.eats.handler;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.*;
import java.util.Arrays;
import java.util.List;

public class ListStringTypeHandler extends BaseTypeHandler<List<String>> {

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, List<String> parameter, JdbcType jdbcType) throws SQLException {
        if (parameter != null && !parameter.isEmpty()) {
            // List<String>을 쉼표로 구분된 문자열로 변환
            String value = String.join(",", parameter);
            ps.setString(i, value);  // PreparedStatement에 설정
        } else {
            ps.setString(i, "");  // 빈 값 처리
        }
    }

    @Override
    public List<String> getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String value = rs.getString(columnName);
        return value != null ? Arrays.asList(value.split(",")) : null;  // 쉼표로 분리하여 List<String>으로 반환
    }

    @Override
    public List<String> getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String value = rs.getString(columnIndex);
        return value != null ? Arrays.asList(value.split(",")) : null;  // 쉼표로 분리하여 List<String>으로 반환
    }

    @Override
    public List<String> getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        String value = cs.getString(columnIndex);
        return value != null ? Arrays.asList(value.split(",")) : null;  // 쉼표로 분리하여 List<String>으로 반환
    }
}
