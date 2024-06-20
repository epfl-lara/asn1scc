; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74182 () Bool)

(assert start!74182)

(declare-fun mapNonEmpty!3546 () Bool)

(declare-fun mapRes!3546 () Bool)

(declare-fun tp!3547 () Bool)

(declare-fun tp_is_empty!1181 () Bool)

(assert (=> mapNonEmpty!3546 (= mapRes!3546 (and tp!3547 tp_is_empty!1181))))

(declare-fun mapKey!3547 () (_ BitVec 32))

(declare-datatypes ((T!66987 0))(
  ( (T!66988 (val!590 Int)) )
))
(declare-fun mapValue!3546 () T!66987)

(declare-fun mapRest!3546 () (Array (_ BitVec 32) T!66987))

(declare-datatypes ((array!21405 0))(
  ( (array!21406 (arr!10386 (Array (_ BitVec 32) T!66987)) (size!9294 (_ BitVec 32))) )
))
(declare-fun a2!451 () array!21405)

(assert (=> mapNonEmpty!3546 (= (arr!10386 a2!451) (store mapRest!3546 mapKey!3547 mapValue!3546))))

(declare-fun a1!451 () array!21405)

(declare-fun to!544 () (_ BitVec 32))

(declare-fun from!577 () (_ BitVec 32))

(assert (=> start!74182 (and (bvsle #b00000000000000000000000000000000 from!577) (bvsle from!577 to!544) (bvsle (size!9294 a1!451) (size!9294 a2!451)) (bvsle to!544 (size!9294 a1!451)) (not (= from!577 to!544)) (= (select (arr!10386 a1!451) from!577) (select (arr!10386 a2!451) from!577)) (= (bvand from!577 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand from!577 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!577) #b10000000000000000000000000000000))))))

(assert (=> start!74182 true))

(declare-fun e!236408 () Bool)

(declare-fun array_inv!8827 (array!21405) Bool)

(assert (=> start!74182 (and (array_inv!8827 a1!451) e!236408)))

(declare-fun e!236409 () Bool)

(assert (=> start!74182 (and (array_inv!8827 a2!451) e!236409)))

(declare-fun b!327255 () Bool)

(assert (=> b!327255 (= e!236409 (and tp_is_empty!1181 mapRes!3546))))

(declare-fun condMapEmpty!3547 () Bool)

(declare-fun mapDefault!3547 () T!66987)

