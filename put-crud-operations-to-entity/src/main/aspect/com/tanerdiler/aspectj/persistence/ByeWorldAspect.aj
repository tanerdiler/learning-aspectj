package com.tanerdiler.aspectj.persistence;

import com.tanerdiler.aspectj.persistence.Student;
import com.tanerdiler.aspectj.persistence.GenericEntity;

public aspect ByeWorldAspect {
	 
    declare parents: Student extends GenericEntity;
 
    before(GenericEntity byeWorld)
        : execution(* GenericEntity+.*(..))
            && !execution(* GenericEntity.*(..))
            && this(byeWorld) {
    }
 
}