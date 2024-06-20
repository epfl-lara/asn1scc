; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24590 () Bool)

(assert start!24590)

(declare-fun mapIsEmpty!492 () Bool)

(declare-fun mapRes!492 () Bool)

(assert (=> mapIsEmpty!492 mapRes!492))

(declare-fun b!124744 () Bool)

(declare-fun e!81875 () Bool)

(declare-fun tp_is_empty!161 () Bool)

(declare-fun mapRes!493 () Bool)

(assert (=> b!124744 (= e!81875 (and tp_is_empty!161 mapRes!493))))

(declare-fun condMapEmpty!492 () Bool)

(declare-datatypes ((T!17107 0))(
  ( (T!17108 (val!80 Int)) )
))
(declare-datatypes ((array!5554 0))(
  ( (array!5555 (arr!3107 (Array (_ BitVec 32) T!17107)) (size!2514 (_ BitVec 32))) )
))
(declare-fun a1!447 () array!5554)

(declare-fun mapDefault!493 () T!17107)

