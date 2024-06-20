; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63232 () Bool)

(assert start!63232)

(declare-fun mapNonEmpty!1002 () Bool)

(declare-fun mapRes!1002 () Bool)

(declare-fun tp!1003 () Bool)

(declare-fun tp_is_empty!385 () Bool)

(assert (=> mapNonEmpty!1002 (= mapRes!1002 (and tp!1003 tp_is_empty!385))))

(declare-datatypes ((T!50491 0))(
  ( (T!50492 (val!192 Int)) )
))
(declare-fun mapValue!1002 () T!50491)

(declare-fun mapRest!1002 () (Array (_ BitVec 32) T!50491))

(declare-datatypes ((array!16420 0))(
  ( (array!16421 (arr!8089 (Array (_ BitVec 32) T!50491)) (size!7093 (_ BitVec 32))) )
))
(declare-fun a2!471 () array!16420)

(declare-fun mapKey!1002 () (_ BitVec 32))

(assert (=> mapNonEmpty!1002 (= (arr!8089 a2!471) (store mapRest!1002 mapKey!1002 mapValue!1002))))

(declare-fun b!283401 () Bool)

(declare-fun res!234934 () Bool)

(declare-fun e!202327 () Bool)

(assert (=> b!283401 (=> (not res!234934) (not e!202327))))

(declare-fun to!564 () (_ BitVec 32))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> b!283401 (= res!234934 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun b!283402 () Bool)

(declare-fun res!234930 () Bool)

(assert (=> b!283402 (=> (not res!234930) (not e!202327))))

(assert (=> b!283402 (= res!234930 (not (= i!913 from!597)))))

(declare-fun b!283403 () Bool)

(declare-fun e!202326 () Bool)

(assert (=> b!283403 (= e!202326 (and tp_is_empty!385 mapRes!1002))))

(declare-fun condMapEmpty!1003 () Bool)

(declare-fun mapDefault!1003 () T!50491)

