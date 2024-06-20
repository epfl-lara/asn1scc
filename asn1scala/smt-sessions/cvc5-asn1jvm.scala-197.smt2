; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4066 () Bool)

(assert start!4066)

(declare-fun mapNonEmpty!102 () Bool)

(declare-fun mapRes!102 () Bool)

(declare-fun tp!102 () Bool)

(declare-fun tp_is_empty!37 () Bool)

(assert (=> mapNonEmpty!102 (= mapRes!102 (and tp!102 tp_is_empty!37))))

(declare-datatypes ((T!4163 0))(
  ( (T!4164 (val!18 Int)) )
))
(declare-datatypes ((array!1056 0))(
  ( (array!1057 (arr!877 (Array (_ BitVec 32) T!4163)) (size!448 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1056)

(declare-fun mapRest!102 () (Array (_ BitVec 32) T!4163))

(declare-fun mapKey!102 () (_ BitVec 32))

(declare-fun mapValue!102 () T!4163)

(assert (=> mapNonEmpty!102 (= (arr!877 dst!10) (store mapRest!102 mapKey!102 mapValue!102))))

(declare-fun mapIsEmpty!102 () Bool)

(declare-fun mapRes!103 () Bool)

(assert (=> mapIsEmpty!102 mapRes!103))

(declare-fun mapIsEmpty!103 () Bool)

(assert (=> mapIsEmpty!103 mapRes!102))

(declare-fun b!17244 () Bool)

(declare-fun e!10964 () Bool)

(assert (=> b!17244 (= e!10964 (and tp_is_empty!37 mapRes!103))))

(declare-fun condMapEmpty!102 () Bool)

(declare-fun src!2 () array!1056)

(declare-fun mapDefault!103 () T!4163)

