; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24558 () Bool)

(assert start!24558)

(declare-fun b!124656 () Bool)

(declare-fun e!81791 () Bool)

(declare-fun tp_is_empty!133 () Bool)

(declare-fun mapRes!401 () Bool)

(assert (=> b!124656 (= e!81791 (and tp_is_empty!133 mapRes!401))))

(declare-fun condMapEmpty!401 () Bool)

(declare-datatypes ((T!16999 0))(
  ( (T!17000 (val!66 Int)) )
))
(declare-datatypes ((array!5524 0))(
  ( (array!5525 (arr!3093 (Array (_ BitVec 32) T!16999)) (size!2500 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5524)

(declare-fun mapDefault!400 () T!16999)

