; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57096 () Bool)

(assert start!57096)

(declare-fun res!219178 () Bool)

(declare-fun e!182245 () Bool)

(assert (=> start!57096 (=> (not res!219178) (not e!182245))))

(declare-fun at!213 () (_ BitVec 32))

(declare-datatypes ((T!45197 0))(
  ( (T!45198 (val!85 Int)) )
))
(declare-datatypes ((array!14513 0))(
  ( (array!14514 (arr!7319 (Array (_ BitVec 32) T!45197)) (size!6332 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14513)

(assert (=> start!57096 (= res!219178 (and (bvsle #b00000000000000000000000000000000 at!213) (bvslt at!213 (size!6332 a!411))))))

(assert (=> start!57096 e!182245))

(assert (=> start!57096 true))

(declare-fun e!182243 () Bool)

(declare-fun array_inv!6072 (array!14513) Bool)

(assert (=> start!57096 (and (array_inv!6072 a!411) e!182243)))

(declare-fun tp_is_empty!171 () Bool)

(assert (=> start!57096 tp_is_empty!171))

(declare-fun mapIsEmpty!499 () Bool)

(declare-fun mapRes!499 () Bool)

(assert (=> mapIsEmpty!499 mapRes!499))

(declare-fun b!261831 () Bool)

(declare-fun e!182244 () Bool)

(assert (=> b!261831 (= e!182244 (not true))))

(declare-fun lt!403892 () array!14513)

(declare-fun arrayRangesEq!956 (array!14513 array!14513 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261831 (arrayRangesEq!956 a!411 lt!403892 #b00000000000000000000000000000000 at!213)))

(declare-fun v!328 () T!45197)

(declare-datatypes ((Unit!18675 0))(
  ( (Unit!18676) )
))
(declare-fun lt!403891 () Unit!18675)

(declare-fun rec!25 (array!14513 (_ BitVec 32) T!45197 (_ BitVec 32)) Unit!18675)

(assert (=> b!261831 (= lt!403891 (rec!25 a!411 at!213 v!328 at!213))))

(declare-fun b!261832 () Bool)

(assert (=> b!261832 (= e!182245 e!182244)))

(declare-fun res!219179 () Bool)

(assert (=> b!261832 (=> (not res!219179) (not e!182244))))

(assert (=> b!261832 (= res!219179 (arrayRangesEq!956 a!411 lt!403892 at!213 at!213))))

(assert (=> b!261832 (= lt!403892 (array!14514 (store (arr!7319 a!411) at!213 v!328) (size!6332 a!411)))))

(declare-fun mapNonEmpty!499 () Bool)

(declare-fun tp!499 () Bool)

(assert (=> mapNonEmpty!499 (= mapRes!499 (and tp!499 tp_is_empty!171))))

(declare-fun mapValue!499 () T!45197)

(declare-fun mapRest!499 () (Array (_ BitVec 32) T!45197))

(declare-fun mapKey!499 () (_ BitVec 32))

(assert (=> mapNonEmpty!499 (= (arr!7319 a!411) (store mapRest!499 mapKey!499 mapValue!499))))

(declare-fun b!261833 () Bool)

(assert (=> b!261833 (= e!182243 (and tp_is_empty!171 mapRes!499))))

(declare-fun condMapEmpty!499 () Bool)

(declare-fun mapDefault!499 () T!45197)

(assert (=> b!261833 (= condMapEmpty!499 (= (arr!7319 a!411) ((as const (Array (_ BitVec 32) T!45197)) mapDefault!499)))))

(assert (= (and start!57096 res!219178) b!261832))

(assert (= (and b!261832 res!219179) b!261831))

(assert (= (and b!261833 condMapEmpty!499) mapIsEmpty!499))

(assert (= (and b!261833 (not condMapEmpty!499)) mapNonEmpty!499))

(assert (= start!57096 b!261833))

(declare-fun m!391867 () Bool)

(assert (=> start!57096 m!391867))

(declare-fun m!391869 () Bool)

(assert (=> b!261831 m!391869))

(declare-fun m!391871 () Bool)

(assert (=> b!261831 m!391871))

(declare-fun m!391873 () Bool)

(assert (=> b!261832 m!391873))

(declare-fun m!391875 () Bool)

(assert (=> b!261832 m!391875))

(declare-fun m!391877 () Bool)

(assert (=> mapNonEmpty!499 m!391877))

(check-sat (not b!261832) (not b!261831) (not start!57096) (not mapNonEmpty!499) tp_is_empty!171)
(check-sat)
