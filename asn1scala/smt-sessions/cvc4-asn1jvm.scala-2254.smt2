; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57174 () Bool)

(assert start!57174)

(declare-fun mapNonEmpty!613 () Bool)

(declare-fun mapRes!613 () Bool)

(declare-fun tp!613 () Bool)

(declare-fun tp_is_empty!245 () Bool)

(assert (=> mapNonEmpty!613 (= mapRes!613 (and tp!613 tp_is_empty!245))))

(declare-fun mapKey!613 () (_ BitVec 32))

(declare-datatypes ((T!45511 0))(
  ( (T!45512 (val!122 Int)) )
))
(declare-datatypes ((array!14588 0))(
  ( (array!14589 (arr!7356 (Array (_ BitVec 32) T!45511)) (size!6369 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14588)

(declare-fun mapRest!613 () (Array (_ BitVec 32) T!45511))

(declare-fun mapValue!613 () T!45511)

(assert (=> mapNonEmpty!613 (= (arr!7356 a!416) (store mapRest!613 mapKey!613 mapValue!613))))

(declare-fun b!262208 () Bool)

(declare-fun res!219443 () Bool)

(declare-fun e!182539 () Bool)

(assert (=> b!262208 (=> (not res!219443) (not e!182539))))

(declare-fun v!333 () T!45511)

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(declare-fun arrayRangesEq!984 (array!14588 array!14588 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262208 (= res!219443 (arrayRangesEq!984 a!416 (array!14589 (store (arr!7356 a!416) at!218 v!333) (size!6369 a!416)) i!922 at!218))))

(declare-fun b!262209 () Bool)

(declare-fun e!182538 () Bool)

(assert (=> b!262209 (= e!182538 (and tp_is_empty!245 mapRes!613))))

(declare-fun condMapEmpty!613 () Bool)

(declare-fun mapDefault!613 () T!45511)

