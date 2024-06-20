; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24544 () Bool)

(assert start!24544)

(declare-fun b!124618 () Bool)

(declare-fun e!81755 () Bool)

(declare-fun tp_is_empty!121 () Bool)

(declare-fun mapRes!361 () Bool)

(assert (=> b!124618 (= e!81755 (and tp_is_empty!121 mapRes!361))))

(declare-fun condMapEmpty!360 () Bool)

(declare-datatypes ((T!16947 0))(
  ( (T!16948 (val!60 Int)) )
))
(declare-datatypes ((array!5511 0))(
  ( (array!5512 (arr!3087 (Array (_ BitVec 32) T!16947)) (size!2494 (_ BitVec 32))) )
))
(declare-fun a1!447 () array!5511)

(declare-fun mapDefault!360 () T!16947)

