; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24576 () Bool)

(assert start!24576)

(declare-fun b!124706 () Bool)

(declare-fun e!81839 () Bool)

(declare-fun tp_is_empty!149 () Bool)

(declare-fun mapRes!452 () Bool)

(assert (=> b!124706 (= e!81839 (and tp_is_empty!149 mapRes!452))))

(declare-fun condMapEmpty!453 () Bool)

(declare-datatypes ((T!17055 0))(
  ( (T!17056 (val!74 Int)) )
))
(declare-datatypes ((array!5541 0))(
  ( (array!5542 (arr!3101 (Array (_ BitVec 32) T!17055)) (size!2508 (_ BitVec 32))) )
))
(declare-fun a2!447 () array!5541)

(declare-fun mapDefault!452 () T!17055)

