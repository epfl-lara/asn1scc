; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4110 () Bool)

(assert start!4110)

(declare-fun mapIsEmpty!221 () Bool)

(declare-fun mapRes!221 () Bool)

(assert (=> mapIsEmpty!221 mapRes!221))

(declare-fun b!17359 () Bool)

(declare-fun e!11075 () Bool)

(declare-fun tp_is_empty!77 () Bool)

(declare-fun mapRes!222 () Bool)

(assert (=> b!17359 (= e!11075 (and tp_is_empty!77 mapRes!222))))

(declare-fun condMapEmpty!222 () Bool)

(declare-datatypes ((T!4323 0))(
  ( (T!4324 (val!38 Int)) )
))
(declare-datatypes ((array!1098 0))(
  ( (array!1099 (arr!897 (Array (_ BitVec 32) T!4323)) (size!468 (_ BitVec 32))) )
))
(declare-fun dst!10 () array!1098)

(declare-fun mapDefault!222 () T!4323)

