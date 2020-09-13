package com.sda.javagda31.mechanics.model;

import com.sun.xml.bind.v2.model.core.ID;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ServiceOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String content;

    @ManyToOne()
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private Car car;

    @CreationTimestamp
    private LocalDateTime dateTimeAdded;

    private LocalDateTime dateFinished; // domyślnie null
}
