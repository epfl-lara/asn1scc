; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57100 () Bool)

(assert start!57100)

(declare-fun res!219191 () Bool)

(declare-fun e!182263 () Bool)

(assert (=> start!57100 (=> (not res!219191) (not e!182263))))

(declare-fun at!213 () (_ BitVec 32))

(declare-datatypes ((T!45221 0))(
  ( (T!45222 (val!87 Int)) )
))
(declare-datatypes ((array!14517 0))(
  ( (array!14518 (arr!7321 (Array (_ BitVec 32) T!45221)) (size!6334 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14517)

(assert (=> start!57100 (= res!219191 (and (bvsle #b00000000000000000000000000000000 at!213) (bvslt at!213 (size!6334 a!411))))))

(assert (=> start!57100 e!182263))

(assert (=> start!57100 true))

(declare-fun e!182262 () Bool)

(declare-fun array_inv!6073 (array!14517) Bool)

(assert (=> start!57100 (and (array_inv!6073 a!411) e!182262)))

(declare-fun tp_is_empty!175 () Bool)

(assert (=> start!57100 tp_is_empty!175))

(declare-fun b!261849 () Bool)

(declare-fun mapRes!505 () Bool)

(assert (=> b!261849 (= e!182262 (and tp_is_empty!175 mapRes!505))))

(declare-fun condMapEmpty!505 () Bool)

(declare-fun mapDefault!505 () T!45221)

