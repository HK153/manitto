package com.example.manitto.controllers.rest;

import com.example.manitto.services.ActionService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by jonghyeon on 2023/01/25,
 * Package : com.example.manitto.controllers.rest
 */
@RestController("/api/action")
@RequiredArgsConstructor
public class ActionApiController {
    private final ActionService actionService;


}