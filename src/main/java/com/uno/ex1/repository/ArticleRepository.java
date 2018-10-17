package com.uno.ex1.repository;

import com.uno.ex1.domain.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource
public interface ArticleRepository extends JpaRepository<Article, Long>, QuerydslPredicateExecutor<Article> {

}
