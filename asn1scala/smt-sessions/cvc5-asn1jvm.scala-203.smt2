; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4106 () Bool)

(assert start!4106)

(declare-fun b!17347 () Bool)

(declare-fun e!11064 () Bool)

(declare-fun tp_is_empty!73 () Bool)

(declare-fun mapRes!209 () Bool)

(assert (=> b!17347 (= e!11064 (and tp_is_empty!73 mapRes!209))))

(declare-fun condMapEmpty!209 () Bool)

(declare-datatypes ((T!4319 0))(
  ( (T!4320 (val!36 Int)) )
))
(declare-datatypes ((array!1094 0))(
  ( (array!1095 (arr!895 (Array (_ BitVec 32) T!4319)) (size!466 (_ BitVec 32))) )
))
(declare-fun src!2 () array!1094)

(declare-fun mapDefault!210 () T!4319)

