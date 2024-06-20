; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68564 () Bool)

(assert start!68564)

(declare-fun b!308385 () Bool)

(declare-fun e!222027 () Bool)

(declare-fun tp_is_empty!845 () Bool)

(declare-fun mapRes!2700 () Bool)

(assert (=> b!308385 (= e!222027 (and tp_is_empty!845 mapRes!2700))))

(declare-fun condMapEmpty!2700 () Bool)

(declare-datatypes ((T!57851 0))(
  ( (T!57852 (val!422 Int)) )
))
(declare-datatypes ((array!18709 0))(
  ( (array!18710 (arr!9192 (Array (_ BitVec 32) T!57851)) (size!8109 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18709)

(declare-fun mapDefault!2699 () T!57851)

