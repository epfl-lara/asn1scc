; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68668 () Bool)

(assert start!68668)

(declare-fun mapIsEmpty!2983 () Bool)

(declare-fun mapRes!2983 () Bool)

(assert (=> mapIsEmpty!2983 mapRes!2983))

(declare-fun b!309746 () Bool)

(declare-fun e!222693 () Bool)

(declare-fun tp_is_empty!937 () Bool)

(assert (=> b!309746 (= e!222693 (and tp_is_empty!937 mapRes!2983))))

(declare-fun condMapEmpty!2983 () Bool)

(declare-datatypes ((T!58263 0))(
  ( (T!58264 (val!468 Int)) )
))
(declare-datatypes ((array!18803 0))(
  ( (array!18804 (arr!9238 (Array (_ BitVec 32) T!58263)) (size!8155 (_ BitVec 32))) )
))
(declare-fun a2!555 () array!18803)

(declare-fun mapDefault!2983 () T!58263)

