; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24582 () Bool)

(assert start!24582)

(declare-fun b!124724 () Bool)

(declare-fun e!81856 () Bool)

(declare-fun tp_is_empty!155 () Bool)

(declare-fun mapRes!471 () Bool)

(assert (=> b!124724 (= e!81856 (and tp_is_empty!155 mapRes!471))))

(declare-fun condMapEmpty!470 () Bool)

(declare-datatypes ((T!17081 0))(
  ( (T!17082 (val!77 Int)) )
))
(declare-datatypes ((array!5547 0))(
  ( (array!5548 (arr!3104 (Array (_ BitVec 32) T!17081)) (size!2511 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5547)

(declare-fun mapDefault!471 () T!17081)

