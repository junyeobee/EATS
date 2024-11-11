package com.eats.store.model;

import java.time.Duration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.reactive.ReactorClientHttpConnector;
import org.springframework.web.reactive.function.client.WebClient;

import io.netty.channel.ChannelOption;
import reactor.netty.http.client.HttpClient;

@Configuration
@ConfigurationProperties(prefix = "webclient")
public class StoreReportConfig {
    private String baseUrl;
    private int responseTimeout;
    private int connectionTimeout;
    private int maxInMemorySize;
    public StoreReportConfig() {
		// TODO Auto-generated constructor stub
	}
    
    
    public StoreReportConfig(String baseUrl, int responseTimeout, int connectionTimeout, int maxInMemorySize) {
		super();
		this.baseUrl = baseUrl;
		this.responseTimeout = responseTimeout;
		this.connectionTimeout = connectionTimeout;
		this.maxInMemorySize = maxInMemorySize;
	}


	public String getBaseUrl() {
		return baseUrl;
	}

	public void setBaseUrl(String baseUrl) {
		this.baseUrl = baseUrl;
	}

	public int getResponseTimeout() {
		return responseTimeout;
	}

	public void setResponseTimeout(int responseTimeout) {
		this.responseTimeout = responseTimeout;
	}

	public int getConnectionTimeout() {
		return connectionTimeout;
	}

	public void setConnectionTimeout(int connectionTimeout) {
		this.connectionTimeout = connectionTimeout;
	}

	public int getMaxInMemorySize() {
		return maxInMemorySize;
	}

	public void setMaxInMemorySize(int maxInMemorySize) {
		this.maxInMemorySize = maxInMemorySize;
	}

	@Bean
    public WebClient.Builder webClientBuilder() {
        return WebClient.builder()
            .codecs(configurer -> configurer
                .defaultCodecs()
                .maxInMemorySize(maxInMemorySize))
            .clientConnector(new ReactorClientHttpConnector(HttpClient.create()
                .responseTimeout(Duration.ofMillis(responseTimeout))
                .option(ChannelOption.CONNECT_TIMEOUT_MILLIS, connectionTimeout)
                .option(ChannelOption.SO_KEEPALIVE, true)
                .option(ChannelOption.TCP_NODELAY, true)));
    }
}
