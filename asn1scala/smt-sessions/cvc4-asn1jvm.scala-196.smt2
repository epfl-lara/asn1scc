; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4060 () Bool)

(assert start!4060)

(declare-fun mapIsEmpty!92 () Bool)

(declare-fun mapRes!93 () Bool)

(assert (=> mapIsEmpty!92 mapRes!93))

(declare-fun mapIsEmpty!93 () Bool)

(declare-fun mapRes!92 () Bool)

(assert (=> mapIsEmpty!93 mapRes!92))

(declare-fun b!17229 () Bool)

(declare-fun e!10956 () Bool)

(declare-fun tp_is_empty!35 () Bool)

(assert (=> b!17229 (= e!10956 (and tp_is_empty!35 mapRes!93))))

(declare-fun condMapEmpty!93 () Bool)

(declare-datatypes ((T!4141 0))(
  ( (T!4142 (val!17 Int)) )
))
(declare-datatypes ((array!1053 0))(
  ( (array!1054 (arr!876 (Array (_ BitVec 32) T!4141)) (size!447 (_ BitVec 32))) )
))
(declare-fun src!6 () array!1053)

(declare-fun mapDefault!92 () T!4141)

