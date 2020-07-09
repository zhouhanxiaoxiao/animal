package com.cibr.animal.demo.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

@Component
public class RedisUtil {
    @Autowired
    private RedisTemplate<String,Object> redisTemplate;

    public void set(String key, Object value) {
        //更改在redis里面查看key编码问题
        ValueOperations<String,Object> vo = redisTemplate.opsForValue();
        vo.set(key, value);
    }

    public Object get(String key) {
        ValueOperations<String,Object> vo = redisTemplate.opsForValue();
        return vo.get(key);
    }

    public Boolean delete(String key) {
        return redisTemplate.delete(key);
    }
}
