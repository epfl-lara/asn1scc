; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57144 () Bool)

(assert start!57144)

(declare-fun mapIsEmpty!568 () Bool)

(declare-fun mapRes!568 () Bool)

(assert (=> mapIsEmpty!568 mapRes!568))

(declare-fun mapNonEmpty!568 () Bool)

(declare-fun tp!568 () Bool)

(declare-fun tp_is_empty!215 () Bool)

(assert (=> mapNonEmpty!568 (= mapRes!568 (and tp!568 tp_is_empty!215))))

(declare-datatypes ((T!45381 0))(
  ( (T!45382 (val!107 Int)) )
))
(declare-fun mapValue!568 () T!45381)

(declare-fun mapKey!568 () (_ BitVec 32))

(declare-datatypes ((array!14558 0))(
  ( (array!14559 (arr!7341 (Array (_ BitVec 32) T!45381)) (size!6354 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14558)

(declare-fun mapRest!568 () (Array (_ BitVec 32) T!45381))

(assert (=> mapNonEmpty!568 (= (arr!7341 a!416) (store mapRest!568 mapKey!568 mapValue!568))))

(declare-fun res!219289 () Bool)

(declare-fun e!182412 () Bool)

(assert (=> start!57144 (=> (not res!219289) (not e!182412))))

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(assert (=> start!57144 (= res!219289 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6354 a!416)) (bvsle i!922 at!218)))))

(assert (=> start!57144 e!182412))

(assert (=> start!57144 true))

(declare-fun e!182413 () Bool)

(declare-fun array_inv!6087 (array!14558) Bool)

(assert (=> start!57144 (and (array_inv!6087 a!416) e!182413)))

(assert (=> start!57144 tp_is_empty!215))

(declare-fun b!262010 () Bool)

(assert (=> b!262010 (= e!182412 (and (= i!922 #b00000000000000000000000000000000) (bvsgt at!218 (size!6354 a!416))))))

(declare-fun b!262011 () Bool)

(assert (=> b!262011 (= e!182413 (and tp_is_empty!215 mapRes!568))))

(declare-fun condMapEmpty!568 () Bool)

(declare-fun mapDefault!568 () T!45381)

