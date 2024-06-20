; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4134 () Bool)

(assert start!4134)

(declare-datatypes ((T!4423 0))(
  ( (T!4424 (val!48 Int)) )
))
(declare-datatypes ((array!1120 0))(
  ( (array!1121 (arr!907 (Array (_ BitVec 32) T!4423)) (size!478 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1120)

(declare-fun toSrc!1 () (_ BitVec 32))

(declare-fun e!11138 () Bool)

(declare-fun b!17425 () Bool)

(declare-fun src!2 () array!1120)

(declare-fun fromSrc!2 () (_ BitVec 32))

(declare-fun fromDst!2 () (_ BitVec 32))

(declare-datatypes ((Unit!1565 0))(
  ( (Unit!1566) )
))
(declare-datatypes ((tuple2!2042 0))(
  ( (tuple2!2043 (_1!1082 Unit!1565) (_2!1082 array!1120)) )
))
(declare-fun arrayCopyOffset!2 (array!1120 array!1120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) tuple2!2042)

(assert (=> b!17425 (= e!11138 (not (= (size!478 dst!10) (size!478 (_2!1082 (arrayCopyOffset!2 src!2 (array!1121 (store (arr!907 dst!10) fromDst!2 (select (arr!907 src!2) fromSrc!2)) (size!478 dst!10)) (bvadd #b00000000000000000000000000000001 fromSrc!2) toSrc!1 (bvadd #b00000000000000000000000000000001 fromDst!2)))))))))

(declare-fun mapIsEmpty!289 () Bool)

(declare-fun mapRes!289 () Bool)

(assert (=> mapIsEmpty!289 mapRes!289))

(declare-fun res!15425 () Bool)

(assert (=> start!4134 (=> (not res!15425) (not e!11138))))

(assert (=> start!4134 (= res!15425 (and (bvsle #b00000000000000000000000000000000 fromSrc!2) (bvsle fromSrc!2 toSrc!1) (bvsle toSrc!1 (size!478 src!2)) (bvsle #b00000000000000000000000000000000 fromDst!2) (bvsle fromDst!2 (bvsub (size!478 dst!10) (bvsub toSrc!1 fromSrc!2))) (bvslt fromSrc!2 toSrc!1)))))

(assert (=> start!4134 e!11138))

(declare-fun e!11137 () Bool)

(declare-fun array_inv!448 (array!1120) Bool)

(assert (=> start!4134 (and (array_inv!448 dst!10) e!11137)))

(assert (=> start!4134 true))

(declare-fun e!11139 () Bool)

(assert (=> start!4134 (and (array_inv!448 src!2) e!11139)))

(declare-fun mapIsEmpty!290 () Bool)

(declare-fun mapRes!290 () Bool)

(assert (=> mapIsEmpty!290 mapRes!290))

(declare-fun b!17426 () Bool)

(declare-fun tp_is_empty!97 () Bool)

(assert (=> b!17426 (= e!11139 (and tp_is_empty!97 mapRes!290))))

(declare-fun condMapEmpty!289 () Bool)

(declare-fun mapDefault!289 () T!4423)

