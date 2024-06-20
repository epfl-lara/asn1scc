; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63134 () Bool)

(assert start!63134)

(declare-fun b!282581 () Bool)

(declare-fun e!201909 () Bool)

(declare-fun tp_is_empty!299 () Bool)

(declare-fun mapRes!736 () Bool)

(assert (=> b!282581 (= e!201909 (and tp_is_empty!299 mapRes!736))))

(declare-fun condMapEmpty!736 () Bool)

(declare-datatypes ((T!50105 0))(
  ( (T!50106 (val!149 Int)) )
))
(declare-datatypes ((array!16332 0))(
  ( (array!16333 (arr!8046 (Array (_ BitVec 32) T!50105)) (size!7050 (_ BitVec 32))) )
))
(declare-fun a1!463 () array!16332)

(declare-fun mapDefault!736 () T!50105)

