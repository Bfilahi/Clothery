package com.filahi.clothery.dao;

import com.filahi.clothery.entity.City;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource
public interface CityRepository extends JpaRepository<City, Integer> {
    List<City> findByCountryCode(@Param("code") String code);
}
