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
@Table(uniqueConstraints = @UniqueConstraint(columnNames = "loginId"))
@EntityListeners(AuditingEntityListener.class)
@Entity
public class User {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) private long id;

    @Column(nullable = false) private String loginId;
    @Column(nullable = false) private String password;
    @ColumnDefault("0") @Column(nullable = false) private int totalLikes;
    @ColumnDefault("0") @Column(nullable = false) private int totalViewCounts;

    private String nickname;
    private String email;

    @CreatedDate        @Column(nullable = false, updatable = false) private LocalDateTime createdAt;
    @CreatedBy          @Column(nullable = false, updatable = false) private String createdBy;
    @LastModifiedDate   @Column(nullable = false) private LocalDateTime updatedAt;
    @LastModifiedBy     @Column(nullable = false) private String updatedBy;

}
