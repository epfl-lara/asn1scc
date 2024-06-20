; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68534 () Bool)

(assert start!68534)

(declare-fun b!308001 () Bool)

(declare-fun e!221850 () Bool)

(declare-fun tp_is_empty!815 () Bool)

(declare-fun mapRes!2610 () Bool)

(assert (=> b!308001 (= e!221850 (and tp_is_empty!815 mapRes!2610))))

(declare-fun condMapEmpty!2609 () Bool)

(declare-datatypes ((T!57721 0))(
  ( (T!57722 (val!407 Int)) )
))
(declare-datatypes ((array!18679 0))(
  ( (array!18680 (arr!9177 (Array (_ BitVec 32) T!57721)) (size!8094 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18679)

(declare-fun mapDefault!2609 () T!57721)

