; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63152 () Bool)

(assert start!63152)

(declare-fun b!282669 () Bool)

(declare-fun res!234423 () Bool)

(declare-fun e!201976 () Bool)

(assert (=> b!282669 (=> (not res!234423) (not e!201976))))

(declare-datatypes ((T!50157 0))(
  ( (T!50158 (val!155 Int)) )
))
(declare-datatypes ((array!16345 0))(
  ( (array!16346 (arr!8052 (Array (_ BitVec 32) T!50157)) (size!7056 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16345)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun a2!471 () array!16345)

(declare-fun from!597 () (_ BitVec 32))

(declare-fun arrayRangesEq!1316 (array!16345 array!16345 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282669 (= res!234423 (arrayRangesEq!1316 a1!471 a2!471 from!597 to!564))))

(declare-fun mapIsEmpty!776 () Bool)

(declare-fun mapRes!776 () Bool)

(assert (=> mapIsEmpty!776 mapRes!776))

(declare-fun mapNonEmpty!776 () Bool)

(declare-fun tp!776 () Bool)

(declare-fun tp_is_empty!311 () Bool)

(assert (=> mapNonEmpty!776 (= mapRes!776 (and tp!776 tp_is_empty!311))))

(declare-fun mapRest!777 () (Array (_ BitVec 32) T!50157))

(declare-fun mapKey!777 () (_ BitVec 32))

(declare-fun mapValue!777 () T!50157)

(assert (=> mapNonEmpty!776 (= (arr!8052 a1!471) (store mapRest!777 mapKey!777 mapValue!777))))

(declare-fun b!282671 () Bool)

(declare-fun i!913 () (_ BitVec 32))

(assert (=> b!282671 (= e!201976 (and (bvsle from!597 i!913) (bvsle i!913 to!564) (bvsgt #b00000000000000000000000000000000 i!913)))))

(declare-fun b!282672 () Bool)

(declare-fun e!201974 () Bool)

(assert (=> b!282672 (= e!201974 (and tp_is_empty!311 mapRes!776))))

(declare-fun condMapEmpty!777 () Bool)

(declare-fun mapDefault!776 () T!50157)

