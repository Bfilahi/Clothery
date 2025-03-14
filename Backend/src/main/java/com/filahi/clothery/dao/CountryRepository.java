package com.filahi.clothery.dao;

import com.filahi.clothery.entity.Country;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource
public interface CountryRepository extends JpaRepository<Country, Integer> {
}
