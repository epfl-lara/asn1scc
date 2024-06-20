; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68666 () Bool)

(assert start!68666)

(declare-fun mapIsEmpty!2977 () Bool)

(declare-fun mapRes!2978 () Bool)

(assert (=> mapIsEmpty!2977 mapRes!2978))

(declare-fun b!309734 () Bool)

(declare-fun e!222686 () Bool)

(declare-fun tp_is_empty!935 () Bool)

(assert (=> b!309734 (= e!222686 (and tp_is_empty!935 mapRes!2978))))

(declare-fun condMapEmpty!2977 () Bool)

(declare-datatypes ((T!58241 0))(
  ( (T!58242 (val!467 Int)) )
))
(declare-datatypes ((array!18801 0))(
  ( (array!18802 (arr!9237 (Array (_ BitVec 32) T!58241)) (size!8154 (_ BitVec 32))) )
))
(declare-fun a2!555 () array!18801)

(declare-fun mapDefault!2977 () T!58241)

