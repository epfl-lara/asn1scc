; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4090 () Bool)

(assert start!4090)

(declare-fun b!17303 () Bool)

(declare-fun e!11021 () Bool)

(declare-fun tp_is_empty!59 () Bool)

(declare-fun mapRes!163 () Bool)

(assert (=> b!17303 (= e!11021 (and tp_is_empty!59 mapRes!163))))

(declare-fun condMapEmpty!163 () Bool)

(declare-datatypes ((T!4245 0))(
  ( (T!4246 (val!29 Int)) )
))
(declare-datatypes ((array!1079 0))(
  ( (array!1080 (arr!888 (Array (_ BitVec 32) T!4245)) (size!459 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1079)

(declare-fun mapDefault!164 () T!4245)

