; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63188 () Bool)

(assert start!63188)

(declare-fun mapNonEmpty!870 () Bool)

(declare-fun mapRes!871 () Bool)

(declare-fun tp!870 () Bool)

(declare-fun tp_is_empty!341 () Bool)

(assert (=> mapNonEmpty!870 (= mapRes!871 (and tp!870 tp_is_empty!341))))

(declare-datatypes ((T!50287 0))(
  ( (T!50288 (val!170 Int)) )
))
(declare-fun mapValue!871 () T!50287)

(declare-fun mapRest!871 () (Array (_ BitVec 32) T!50287))

(declare-datatypes ((array!16376 0))(
  ( (array!16377 (arr!8067 (Array (_ BitVec 32) T!50287)) (size!7071 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16376)

(declare-fun mapKey!870 () (_ BitVec 32))

(assert (=> mapNonEmpty!870 (= (arr!8067 a1!471) (store mapRest!871 mapKey!870 mapValue!871))))

(declare-fun b!282966 () Bool)

(declare-fun res!234628 () Bool)

(declare-fun e!202128 () Bool)

(assert (=> b!282966 (=> (not res!234628) (not e!202128))))

(declare-fun to!564 () (_ BitVec 32))

(declare-fun a2!471 () array!16376)

(declare-fun from!597 () (_ BitVec 32))

(declare-fun arrayRangesEq!1327 (array!16376 array!16376 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282966 (= res!234628 (arrayRangesEq!1327 a1!471 a2!471 from!597 to!564))))

(declare-fun b!282967 () Bool)

(declare-fun e!202130 () Bool)

(assert (=> b!282967 (= e!202130 (and tp_is_empty!341 mapRes!871))))

(declare-fun condMapEmpty!870 () Bool)

(declare-fun mapDefault!871 () T!50287)

