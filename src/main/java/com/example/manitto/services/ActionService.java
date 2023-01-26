package com.example.manitto.services;

import com.example.manitto.common.LoginSessionManager;
import com.example.manitto.dtos.Action;
import com.example.manitto.dtos.Action.CreateDto;
import com.example.manitto.repositories.ActionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * Created by jonghyeon on 2023/01/25,
 * Package : com.example.manitto.services
 */
@Service
@RequiredArgsConstructor
public class ActionService {
    private final ActionRepository actionRepository;
    
    public void createAction(Action.CreateDto dto) {
    		actionRepository.createAction(dto);
    }
    
    
    
}
