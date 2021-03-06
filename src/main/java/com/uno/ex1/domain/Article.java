package com.uno.ex1.domain;

import lombok.Data;
import org.hibernate.annotations.ColumnDefault;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;


@Data
@Table(uniqueConstraints = @UniqueConstraint(columnNames = "uniqueId"))
@EntityListeners(AuditingEntityListener.class)
@Entity
public class Article {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) private long id;

    @Column(nullable = false) private String uniqueId;
    @Column(nullable = false) private String title;
    @Column(nullable = false) private String body;
    @ColumnDefault("0") @Column(nullable = false) private int likes;
    @ColumnDefault("0") @Column(nullable = false) private int viewCounts;
    @ManyToOne(fetch = FetchType.LAZY, optional = false) private User user;

    @CreatedDate        @Column(nullable = false, updatable = false) private LocalDateTime createdAt;
    @CreatedBy          @Column(nullable = false, updatable = false) private String createdBy;
    @LastModifiedDate   @Column(nullable = false) private LocalDateTime updatedAt;
    @LastModifiedBy     @Column(nullable = false) private String updatedBy;

}
