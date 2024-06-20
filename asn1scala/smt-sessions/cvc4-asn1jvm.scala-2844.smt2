; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68582 () Bool)

(assert start!68582)

(declare-fun mapIsEmpty!2753 () Bool)

(declare-fun mapRes!2754 () Bool)

(assert (=> mapIsEmpty!2753 mapRes!2754))

(declare-fun mapNonEmpty!2753 () Bool)

(declare-fun tp!2754 () Bool)

(declare-fun tp_is_empty!863 () Bool)

(assert (=> mapNonEmpty!2753 (= mapRes!2754 (and tp!2754 tp_is_empty!863))))

(declare-fun mapKey!2754 () (_ BitVec 32))

(declare-datatypes ((T!57929 0))(
  ( (T!57930 (val!431 Int)) )
))
(declare-fun mapRest!2754 () (Array (_ BitVec 32) T!57929))

(declare-fun mapValue!2753 () T!57929)

(declare-datatypes ((array!18727 0))(
  ( (array!18728 (arr!9201 (Array (_ BitVec 32) T!57929)) (size!8118 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18727)

(assert (=> mapNonEmpty!2753 (= (arr!9201 a1!524) (store mapRest!2754 mapKey!2754 mapValue!2753))))

(declare-fun b!308733 () Bool)

(declare-fun e!222191 () Bool)

(declare-fun mapRes!2753 () Bool)

(assert (=> b!308733 (= e!222191 (and tp_is_empty!863 mapRes!2753))))

(declare-fun condMapEmpty!2754 () Bool)

(declare-fun a2!524 () array!18727)

(declare-fun mapDefault!2753 () T!57929)

