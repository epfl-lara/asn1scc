; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63212 () Bool)

(assert start!63212)

(declare-fun b!283209 () Bool)

(declare-fun res!234802 () Bool)

(declare-fun e!202237 () Bool)

(assert (=> b!283209 (=> (not res!234802) (not e!202237))))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> b!283209 (= res!234802 (= i!913 from!597))))

(declare-fun b!283210 () Bool)

(declare-fun res!234798 () Bool)

(assert (=> b!283210 (=> (not res!234798) (not e!202237))))

(declare-datatypes ((T!50391 0))(
  ( (T!50392 (val!182 Int)) )
))
(declare-datatypes ((array!16400 0))(
  ( (array!16401 (arr!8079 (Array (_ BitVec 32) T!50391)) (size!7083 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16400)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun a2!471 () array!16400)

(declare-fun arrayRangesEq!1335 (array!16400 array!16400 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283210 (= res!234798 (arrayRangesEq!1335 a2!471 a1!471 i!913 to!564))))

(declare-fun b!283211 () Bool)

(declare-fun e!202236 () Bool)

(declare-fun tp_is_empty!365 () Bool)

(declare-fun mapRes!943 () Bool)

(assert (=> b!283211 (= e!202236 (and tp_is_empty!365 mapRes!943))))

(declare-fun condMapEmpty!942 () Bool)

(declare-fun mapDefault!943 () T!50391)

