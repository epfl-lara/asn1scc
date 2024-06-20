; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68570 () Bool)

(assert start!68570)

(declare-fun b!308498 () Bool)

(declare-fun e!222084 () Bool)

(declare-fun tp_is_empty!851 () Bool)

(declare-fun mapRes!2717 () Bool)

(assert (=> b!308498 (= e!222084 (and tp_is_empty!851 mapRes!2717))))

(declare-fun condMapEmpty!2718 () Bool)

(declare-datatypes ((T!57877 0))(
  ( (T!57878 (val!425 Int)) )
))
(declare-datatypes ((array!18715 0))(
  ( (array!18716 (arr!9195 (Array (_ BitVec 32) T!57877)) (size!8112 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18715)

(declare-fun mapDefault!2717 () T!57877)

