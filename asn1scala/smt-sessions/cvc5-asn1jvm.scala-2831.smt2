; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68496 () Bool)

(assert start!68496)

(declare-fun e!221679 () Bool)

(declare-fun b!307683 () Bool)

(declare-datatypes ((T!57587 0))(
  ( (T!57588 (val!390 Int)) )
))
(declare-datatypes ((array!18644 0))(
  ( (array!18645 (arr!9160 (Array (_ BitVec 32) T!57587)) (size!8077 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18644)

(declare-fun to!599 () (_ BitVec 32))

(declare-fun a2!506 () array!18644)

(declare-fun arrayRangesEq!1702 (array!18644 array!18644 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307683 (= e!221679 (not (arrayRangesEq!1702 a1!506 a2!506 to!599 to!599)))))

(declare-fun b!307684 () Bool)

(declare-fun e!221678 () Bool)

(declare-fun tp_is_empty!781 () Bool)

(declare-fun mapRes!2503 () Bool)

(assert (=> b!307684 (= e!221678 (and tp_is_empty!781 mapRes!2503))))

(declare-fun condMapEmpty!2504 () Bool)

(declare-fun mapDefault!2503 () T!57587)

