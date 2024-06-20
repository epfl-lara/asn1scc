; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4098 () Bool)

(assert start!4098)

(declare-fun mapNonEmpty!185 () Bool)

(declare-fun mapRes!186 () Bool)

(declare-fun tp!185 () Bool)

(declare-fun tp_is_empty!65 () Bool)

(assert (=> mapNonEmpty!185 (= mapRes!186 (and tp!185 tp_is_empty!65))))

(declare-datatypes ((T!4271 0))(
  ( (T!4272 (val!32 Int)) )
))
(declare-datatypes ((array!1086 0))(
  ( (array!1087 (arr!891 (Array (_ BitVec 32) T!4271)) (size!462 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1086)

(declare-fun mapValue!185 () T!4271)

(declare-fun mapRest!185 () (Array (_ BitVec 32) T!4271))

(declare-fun mapKey!185 () (_ BitVec 32))

(assert (=> mapNonEmpty!185 (= (arr!891 dst!10) (store mapRest!185 mapKey!185 mapValue!185))))

(declare-fun mapIsEmpty!185 () Bool)

(declare-fun mapRes!185 () Bool)

(assert (=> mapIsEmpty!185 mapRes!185))

(declare-fun b!17324 () Bool)

(declare-fun e!11040 () Bool)

(assert (=> b!17324 (= e!11040 (and tp_is_empty!65 mapRes!185))))

(declare-fun condMapEmpty!186 () Bool)

(declare-fun src!2 () array!1086)

(declare-fun mapDefault!186 () T!4271)

