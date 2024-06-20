; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4138 () Bool)

(assert start!4138)

(declare-fun res!15431 () Bool)

(declare-fun e!11156 () Bool)

(assert (=> start!4138 (=> (not res!15431) (not e!11156))))

(declare-datatypes ((T!4427 0))(
  ( (T!4428 (val!50 Int)) )
))
(declare-datatypes ((array!1124 0))(
  ( (array!1125 (arr!909 (Array (_ BitVec 32) T!4427)) (size!480 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1124)

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun src!2 () array!1124)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(assert (=> start!4138 (= res!15431 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!480 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!480 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1)))))

(assert (=> start!4138 e!11156))

(declare-fun e!11157 () Bool)

(declare-fun array_inv!450 (array!1124) Bool)

(assert (=> start!4138 (and (array_inv!450 dst!10) e!11157)))

(assert (=> start!4138 true))

(declare-fun e!11155 () Bool)

(assert (=> start!4138 (and (array_inv!450 src!2) e!11155)))

(declare-fun mapNonEmpty!301 () Bool)

(declare-fun mapRes!301 () Bool)

(declare-fun tp!302 () Bool)

(declare-fun tp_is_empty!101 () Bool)

(assert (=> mapNonEmpty!301 (= mapRes!301 (and tp!302 tp_is_empty!101))))

(declare-fun mapKey!302 () (_ BitVec 32))

(declare-fun mapRest!302 () (Array (_ BitVec 32) T!4427))

(declare-fun mapValue!302 () T!4427)

(assert (=> mapNonEmpty!301 (= (arr!909 src!2) (store mapRest!302 mapKey!302 mapValue!302))))

(declare-fun b!17443 () Bool)

(declare-datatypes ((Unit!1569 0))(
  ( (Unit!1570) )
))
(declare-datatypes ((tuple2!2046 0))(
  ( (tuple2!2047 (_1!1084 Unit!1569) (_2!1084 array!1124)) )
))
(declare-fun arrayCopyOffset!4 (array!1124 array!1124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!2046)

(assert (=> b!17443 (= e!11156 (not (= (size!480 dst!10) (size!480 (_2!1084 (arrayCopyOffset!4 src!2 (array!1125 (store (arr!909 dst!10) fromDst!2 (select (arr!909 src!2) fromSrc!2)) (size!480 dst!10)) (bvadd #b00000000000000000000000000000001 fromSrc!2) toSrc!1 (bvadd #b00000000000000000000000000000001 fromDst!2)))))))))

(declare-fun mapIsEmpty!301 () Bool)

(declare-fun mapRes!302 () Bool)

(assert (=> mapIsEmpty!301 mapRes!302))

(declare-fun b!17444 () Bool)

(assert (=> b!17444 (= e!11155 (and tp_is_empty!101 mapRes!301))))

(declare-fun condMapEmpty!302 () Bool)

(declare-fun mapDefault!302 () T!4427)

