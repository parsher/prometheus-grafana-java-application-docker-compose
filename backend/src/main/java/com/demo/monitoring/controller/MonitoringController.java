package com.demo.monitoring.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Tag(name = "Monitor", description = "Monitor 관련 API 입니다.")
@CrossOrigin
@RestController
@RequestMapping("/monitor")
public class MonitoringController {
    private static List<byte[]> memoryHog = new ArrayList<>();
    private static ExecutorService executorService = Executors.newFixedThreadPool(100);

    @Operation(summary = "Trigger high CPU usage", description = "This endpoint triggers high CPU usage for monitoring purposes")
    @ApiResponse(responseCode = "200", description = "High CPU usage triggered successfully")
    @GetMapping("/high-cpu")
    public String highCPUEndpoint() {
        for (int i = 0; i < 10; i++) {
            executorService.submit(() -> {
                while (true) {
                    Math.pow(Math.random(), Math.random());
                }
            });
        }
        return "Generating high CPU load...";
    }

    @Operation(summary = "Trigger memory leak", description = "This endpoint triggers a memory leak for monitoring purposes")
    @ApiResponse(responseCode = "200", description = "Memory leak triggered successfully")
    @GetMapping("/memory-leak")
    public String memoryLeakEndpoint() {
        for (int i = 0; i < 1000; i++) {
            memoryHog.add(new byte[1024 * 1024]); // Add 1MB each call
        }
        return "Memory leak triggered: " + memoryHog.size() + " MB allocated";
    }

    @Operation(summary = "Increase thread count", description = "This endpoint increases the thread count for monitoring purposes")
    @ApiResponse(responseCode = "200", description = "Thread count increased successfully")
    @GetMapping("/increase-threads")
    public String increaseThreadsEndpoint() {
        for (int i = 0; i < 100; i++) {
            new Thread(() -> {
                try {
                    Thread.sleep(1000000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }).start();
        }
        return "Increased thread count";
    }
}
