package com.eats.store.model;

import java.util.List;
import java.util.Map;
import com.fasterxml.jackson.annotation.JsonProperty;

public class AnalyzerDTO {
    @JsonProperty("data")
    private List<AnalysisResult> data;
    

    public static class AnalysisResult {
        @JsonProperty("분위기")
        private Map<String, List<String>> atmosphere;  // {"긍정": ["좋음"], "부정": ["좁음"]}

        @JsonProperty("서비스")
        private Map<String, List<String>> service;    // {"긍정": ["친절함"], "부정": ["혼잡"]}

        @JsonProperty("메뉴")
        private List<Map<String, MenuEvaluation>> menu;  // [{"붓카케우동": {"긍정": [], "부정": []}}]

        public Map<String, List<String>> getAtmosphere() {
            return atmosphere;
        }

        public void setAtmosphere(Map<String, List<String>> atmosphere) {
            this.atmosphere = atmosphere;
        }

        public Map<String, List<String>> getService() {
            return service;
        }

        public void setService(Map<String, List<String>> service) {
            this.service = service;
        }

        public List<Map<String, MenuEvaluation>> getMenu() {
            return menu;
        }

        public void setMenu(List<Map<String, MenuEvaluation>> menu) {
            this.menu = menu;
        }
    }

    public static class MenuEvaluation {
        @JsonProperty("긍정")
        private List<String> positive;

        @JsonProperty("부정")
        private List<String> negative;

        public List<String> getPositive() {
            return positive;
        }

        public void setPositive(List<String> positive) {
            this.positive = positive;
        }

        public List<String> getNegative() {
            return negative;
        }

        public void setNegative(List<String> negative) {
            this.negative = negative;
        }
    }

    public List<AnalysisResult> getData() {
        return data;
    }

    public void setData(List<AnalysisResult> data) {
        this.data = data;
    }
}