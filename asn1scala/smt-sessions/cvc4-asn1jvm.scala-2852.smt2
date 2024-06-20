; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68636 () Bool)

(assert start!68636)

(declare-fun b!309404 () Bool)

(declare-fun res!253800 () Bool)

(declare-fun e!222508 () Bool)

(assert (=> b!309404 (=> res!253800 e!222508)))

(declare-datatypes ((T!58137 0))(
  ( (T!58138 (val!455 Int)) )
))
(declare-datatypes ((array!18776 0))(
  ( (array!18777 (arr!9225 (Array (_ BitVec 32) T!58137)) (size!8142 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18776)

(declare-fun to!617 () (_ BitVec 32))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun a1!524 () array!18776)

(declare-fun arrayRangesEq!1754 (array!18776 array!18776 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309404 (= res!253800 (not (arrayRangesEq!1754 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-fun mapNonEmpty!2901 () Bool)

(declare-fun mapRes!2901 () Bool)

(declare-fun tp!2901 () Bool)

(declare-fun tp_is_empty!911 () Bool)

(assert (=> mapNonEmpty!2901 (= mapRes!2901 (and tp!2901 tp_is_empty!911))))

(declare-fun mapRest!2901 () (Array (_ BitVec 32) T!58137))

(declare-fun mapValue!2901 () T!58137)

(declare-fun mapKey!2902 () (_ BitVec 32))

(assert (=> mapNonEmpty!2901 (= (arr!9225 a2!524) (store mapRest!2901 mapKey!2902 mapValue!2901))))

(declare-fun b!309405 () Bool)

(declare-fun e!222507 () Bool)

(declare-fun mapRes!2902 () Bool)

(assert (=> b!309405 (= e!222507 (and tp_is_empty!911 mapRes!2902))))

(declare-fun condMapEmpty!2901 () Bool)

(declare-fun mapDefault!2901 () T!58137)

