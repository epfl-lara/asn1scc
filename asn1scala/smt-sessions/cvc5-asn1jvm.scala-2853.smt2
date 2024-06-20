; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68644 () Bool)

(assert start!68644)

(declare-fun b!309458 () Bool)

(declare-fun res!253847 () Bool)

(declare-fun e!222542 () Bool)

(assert (=> b!309458 (=> res!253847 e!222542)))

(declare-fun e!222540 () Bool)

(assert (=> b!309458 (= res!253847 e!222540)))

(declare-fun res!253849 () Bool)

(assert (=> b!309458 (=> (not res!253849) (not e!222540))))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!309458 (= res!253849 (bvsle (bvsub i!932 #b00000000000000000000000000000001) toSlice!46))))

(declare-fun b!309459 () Bool)

(declare-fun res!253852 () Bool)

(declare-fun e!222537 () Bool)

(assert (=> b!309459 (=> (not res!253852) (not e!222537))))

(declare-datatypes ((T!58159 0))(
  ( (T!58160 (val!456 Int)) )
))
(declare-datatypes ((array!18779 0))(
  ( (array!18780 (arr!9226 (Array (_ BitVec 32) T!58159)) (size!8143 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18779)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun a1!524 () array!18779)

(declare-fun arrayRangesEq!1755 (array!18779 array!18779 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309459 (= res!253852 (arrayRangesEq!1755 a1!524 a2!524 from!650 to!617))))

(declare-fun mapIsEmpty!2911 () Bool)

(declare-fun mapRes!2911 () Bool)

(assert (=> mapIsEmpty!2911 mapRes!2911))

(declare-fun mapNonEmpty!2911 () Bool)

(declare-fun mapRes!2912 () Bool)

(declare-fun tp!2912 () Bool)

(declare-fun tp_is_empty!913 () Bool)

(assert (=> mapNonEmpty!2911 (= mapRes!2912 (and tp!2912 tp_is_empty!913))))

(declare-fun mapValue!2911 () T!58159)

(declare-fun mapRest!2911 () (Array (_ BitVec 32) T!58159))

(declare-fun mapKey!2912 () (_ BitVec 32))

(assert (=> mapNonEmpty!2911 (= (arr!9226 a1!524) (store mapRest!2911 mapKey!2912 mapValue!2911))))

(declare-fun b!309460 () Bool)

(assert (=> b!309460 (= e!222540 (not (arrayRangesEq!1755 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) toSlice!46)))))

(declare-fun b!309461 () Bool)

(assert (=> b!309461 (= e!222542 (bvslt (bvsub i!932 #b00000000000000000000000000000001) i!932))))

(declare-fun b!309462 () Bool)

(declare-fun res!253845 () Bool)

(assert (=> b!309462 (=> (not res!253845) (not e!222537))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!309462 (= res!253845 (not (= i!932 fromSlice!46)))))

(declare-fun res!253850 () Bool)

(assert (=> start!68644 (=> (not res!253850) (not e!222537))))

(assert (=> start!68644 (= res!253850 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8143 a1!524) (size!8143 a2!524)) (bvsle to!617 (size!8143 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68644 e!222537))

(assert (=> start!68644 true))

(declare-fun e!222541 () Bool)

(declare-fun array_inv!7721 (array!18779) Bool)

(assert (=> start!68644 (and (array_inv!7721 a2!524) e!222541)))

(declare-fun e!222538 () Bool)

(assert (=> start!68644 (and (array_inv!7721 a1!524) e!222538)))

(declare-fun mapNonEmpty!2912 () Bool)

(declare-fun tp!2911 () Bool)

(assert (=> mapNonEmpty!2912 (= mapRes!2911 (and tp!2911 tp_is_empty!913))))

(declare-fun mapValue!2912 () T!58159)

(declare-fun mapKey!2911 () (_ BitVec 32))

(declare-fun mapRest!2912 () (Array (_ BitVec 32) T!58159))

(assert (=> mapNonEmpty!2912 (= (arr!9226 a2!524) (store mapRest!2912 mapKey!2911 mapValue!2912))))

(declare-fun b!309463 () Bool)

(assert (=> b!309463 (= e!222538 (and tp_is_empty!913 mapRes!2912))))

(declare-fun condMapEmpty!2912 () Bool)

(declare-fun mapDefault!2911 () T!58159)

