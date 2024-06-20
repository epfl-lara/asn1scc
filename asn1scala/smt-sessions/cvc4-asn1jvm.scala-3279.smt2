; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74170 () Bool)

(assert start!74170)

(declare-datatypes ((T!66935 0))(
  ( (T!66936 (val!584 Int)) )
))
(declare-datatypes ((array!21393 0))(
  ( (array!21394 (arr!10380 (Array (_ BitVec 32) T!66935)) (size!9288 (_ BitVec 32))) )
))
(declare-fun a1!451 () array!21393)

(declare-fun to!544 () (_ BitVec 32))

(declare-fun from!577 () (_ BitVec 32))

(declare-fun a2!451 () array!21393)

(assert (=> start!74170 (and (bvsle #b00000000000000000000000000000000 from!577) (bvsle from!577 to!544) (bvsle (size!9288 a1!451) (size!9288 a2!451)) (bvsle to!544 (size!9288 a1!451)) (not (= from!577 to!544)) (bvsge from!577 (size!9288 a1!451)))))

(assert (=> start!74170 true))

(declare-fun e!236372 () Bool)

(declare-fun array_inv!8823 (array!21393) Bool)

(assert (=> start!74170 (and (array_inv!8823 a1!451) e!236372)))

(declare-fun e!236373 () Bool)

(assert (=> start!74170 (and (array_inv!8823 a2!451) e!236373)))

(declare-fun mapIsEmpty!3510 () Bool)

(declare-fun mapRes!3511 () Bool)

(assert (=> mapIsEmpty!3510 mapRes!3511))

(declare-fun b!327219 () Bool)

(declare-fun tp_is_empty!1169 () Bool)

(assert (=> b!327219 (= e!236372 (and tp_is_empty!1169 mapRes!3511))))

(declare-fun condMapEmpty!3511 () Bool)

(declare-fun mapDefault!3510 () T!66935)

