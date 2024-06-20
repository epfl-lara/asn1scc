; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74172 () Bool)

(assert start!74172)

(declare-fun mapNonEmpty!3516 () Bool)

(declare-fun mapRes!3517 () Bool)

(declare-fun tp!3517 () Bool)

(declare-fun tp_is_empty!1171 () Bool)

(assert (=> mapNonEmpty!3516 (= mapRes!3517 (and tp!3517 tp_is_empty!1171))))

(declare-datatypes ((T!66957 0))(
  ( (T!66958 (val!585 Int)) )
))
(declare-datatypes ((array!21395 0))(
  ( (array!21396 (arr!10381 (Array (_ BitVec 32) T!66957)) (size!9289 (_ BitVec 32))) )
))
(declare-fun a1!451 () array!21395)

(declare-fun mapRest!3517 () (Array (_ BitVec 32) T!66957))

(declare-fun mapValue!3516 () T!66957)

(declare-fun mapKey!3516 () (_ BitVec 32))

(assert (=> mapNonEmpty!3516 (= (arr!10381 a1!451) (store mapRest!3517 mapKey!3516 mapValue!3516))))

(declare-fun to!544 () (_ BitVec 32))

(declare-fun from!577 () (_ BitVec 32))

(declare-fun a2!451 () array!21395)

(assert (=> start!74172 (and (bvsle #b00000000000000000000000000000000 from!577) (bvsle from!577 to!544) (bvsle (size!9289 a1!451) (size!9289 a2!451)) (bvsle to!544 (size!9289 a1!451)) (not (= from!577 to!544)) (bvsge from!577 (size!9289 a2!451)))))

(assert (=> start!74172 true))

(declare-fun e!236379 () Bool)

(declare-fun array_inv!8824 (array!21395) Bool)

(assert (=> start!74172 (and (array_inv!8824 a1!451) e!236379)))

(declare-fun e!236378 () Bool)

(assert (=> start!74172 (and (array_inv!8824 a2!451) e!236378)))

(declare-fun mapIsEmpty!3516 () Bool)

(declare-fun mapRes!3516 () Bool)

(assert (=> mapIsEmpty!3516 mapRes!3516))

(declare-fun b!327225 () Bool)

(assert (=> b!327225 (= e!236378 (and tp_is_empty!1171 mapRes!3516))))

(declare-fun condMapEmpty!3517 () Bool)

(declare-fun mapDefault!3517 () T!66957)

