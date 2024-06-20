; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68478 () Bool)

(assert start!68478)

(declare-fun b!307509 () Bool)

(declare-fun e!221583 () Bool)

(declare-fun tp_is_empty!763 () Bool)

(declare-fun mapRes!2450 () Bool)

(assert (=> b!307509 (= e!221583 (and tp_is_empty!763 mapRes!2450))))

(declare-fun condMapEmpty!2450 () Bool)

(declare-datatypes ((T!57509 0))(
  ( (T!57510 (val!381 Int)) )
))
(declare-datatypes ((array!18626 0))(
  ( (array!18627 (arr!9151 (Array (_ BitVec 32) T!57509)) (size!8068 (_ BitVec 32))) )
))
(declare-fun a2!506 () array!18626)

(declare-fun mapDefault!2449 () T!57509)

