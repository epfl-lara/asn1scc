; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63958 () Bool)

(assert start!63958)

(declare-fun b!284328 () Bool)

(declare-fun e!203270 () Bool)

(declare-fun tp_is_empty!403 () Bool)

(declare-fun mapRes!1073 () Bool)

(assert (=> b!284328 (= e!203270 (and tp_is_empty!403 mapRes!1073))))

(declare-fun condMapEmpty!1073 () Bool)

(declare-datatypes ((T!51229 0))(
  ( (T!51230 (val!201 Int)) )
))
(declare-datatypes ((array!16680 0))(
  ( (array!16681 (arr!8188 (Array (_ BitVec 32) T!51229)) (size!7192 (_ BitVec 32))) )
))
(declare-fun a3!63 () array!16680)

(declare-fun mapDefault!1071 () T!51229)

