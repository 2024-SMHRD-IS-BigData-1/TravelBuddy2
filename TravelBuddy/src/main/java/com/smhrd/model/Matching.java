package com.smhrd.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Matching {
    @NonNull
    private String memId;
    @NonNull
    private String tendencyResult;
}
