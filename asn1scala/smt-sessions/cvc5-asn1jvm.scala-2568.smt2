; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64194 () Bool)

(assert start!64194)

(declare-fun b!287433 () Bool)

(declare-fun e!204630 () Bool)

(declare-fun tp_is_empty!619 () Bool)

(declare-fun mapRes!2007 () Bool)

(assert (=> b!287433 (= e!204630 (and tp_is_empty!619 mapRes!2007))))

(declare-fun condMapEmpty!2008 () Bool)

(declare-datatypes ((T!52165 0))(
  ( (T!52166 (val!309 Int)) )
))
(declare-datatypes ((array!16900 0))(
  ( (array!16901 (arr!8296 (Array (_ BitVec 32) T!52165)) (size!7300 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16900)

(declare-fun mapDefault!2007 () T!52165)

