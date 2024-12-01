package com.eats.store.service;

import java.time.Duration;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import com.eats.store.model.AnalyzerDTO;
import com.eats.store.model.StoreReportDTO;

import reactor.core.publisher.Mono;

@Service
public class ReviewAnalyzsisService {
    private static final Logger log = LoggerFactory.getLogger(ReviewAnalyzsisService.class);
    private final WebClient webClient;
    private final int responseTimeout;

    public ReviewAnalyzsisService(WebClient.Builder webClientBuilder, 
                                @Value("${webclient.base-url}") String baseUrl,
                                @Value("${webclient.response-timeout}") int responseTimeout) {
        this.webClient = webClientBuilder
            .baseUrl(baseUrl)
            .build();
        this.responseTimeout = responseTimeout;
    }

    public Mono<AnalyzerDTO> analyzeReviews(List<StoreReportDTO> reviews) {
        return webClient.post()
            .uri("/analyze")
            .bodyValue(reviews)
            .retrieve()
            .bodyToMono(AnalyzerDTO.class)
            .map(response -> {
                if (response.getData() == null) {
                    log.warn("Received null data from API, creating empty response");
                    return createEmptyAnalyzerDTO();
                }
                return response;
            })
            .timeout(Duration.ofMillis(responseTimeout))
            .onErrorResume(WebClientResponseException.class, ex -> {
                log.error("API error: {} - Response: {}", 
                    ex.getStatusCode(), 
                    ex.getResponseBodyAsString());
                return Mono.just(createEmptyAnalyzerDTO());
            })
            .onErrorResume(Exception.class, ex -> {
                log.error("Unexpected error: ", ex);
                return Mono.just(createEmptyAnalyzerDTO());
            });
    }

    private AnalyzerDTO createEmptyAnalyzerDTO() {
        AnalyzerDTO dto = new AnalyzerDTO();
        List<AnalyzerDTO.AnalysisResult> resultList = new ArrayList<>();
        
        AnalyzerDTO.AnalysisResult result = new AnalyzerDTO.AnalysisResult();
        
        Map<String, List<String>> sentimentMap = new HashMap<>();
        sentimentMap.put("긍정", new ArrayList<>());
        sentimentMap.put("부정", new ArrayList<>());
        
        result.setAtmosphere(new HashMap<>(sentimentMap));
        result.setService(new HashMap<>(sentimentMap));
        
        result.setMenu(new ArrayList<>());
        
        resultList.add(result);
        dto.setData(resultList);
        
        return dto;
    }
}