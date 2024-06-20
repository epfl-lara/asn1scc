; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57130 () Bool)

(assert start!57130)

(declare-fun b!261965 () Bool)

(declare-fun e!182377 () Bool)

(assert (=> b!261965 (= e!182377 (not true))))

(declare-datatypes ((T!45327 0))(
  ( (T!45328 (val!100 Int)) )
))
(declare-datatypes ((array!14544 0))(
  ( (array!14545 (arr!7334 (Array (_ BitVec 32) T!45327)) (size!6347 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14544)

(declare-fun lt!403963 () array!14544)

(declare-fun at!213 () (_ BitVec 32))

(declare-fun arrayRangesEq!968 (array!14544 array!14544 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261965 (arrayRangesEq!968 a!411 lt!403963 #b00000000000000000000000000000000 at!213)))

(declare-fun v!328 () T!45327)

(declare-datatypes ((Unit!18689 0))(
  ( (Unit!18690) )
))
(declare-fun lt!403964 () Unit!18689)

(declare-fun rec!32 (array!14544 (_ BitVec 32) T!45327 (_ BitVec 32)) Unit!18689)

(assert (=> b!261965 (= lt!403964 (rec!32 a!411 at!213 v!328 at!213))))

(declare-fun res!219265 () Bool)

(declare-fun e!182376 () Bool)

(assert (=> start!57130 (=> (not res!219265) (not e!182376))))

(assert (=> start!57130 (= res!219265 (and (bvsle #b00000000000000000000000000000000 at!213) (bvslt at!213 (size!6347 a!411))))))

(assert (=> start!57130 e!182376))

(assert (=> start!57130 true))

(declare-fun e!182375 () Bool)

(declare-fun array_inv!6081 (array!14544) Bool)

(assert (=> start!57130 (and (array_inv!6081 a!411) e!182375)))

(declare-fun tp_is_empty!201 () Bool)

(assert (=> start!57130 tp_is_empty!201))

(declare-fun b!261966 () Bool)

(declare-fun mapRes!547 () Bool)

(assert (=> b!261966 (= e!182375 (and tp_is_empty!201 mapRes!547))))

(declare-fun condMapEmpty!547 () Bool)

(declare-fun mapDefault!547 () T!45327)

(assert (=> b!261966 (= condMapEmpty!547 (= (arr!7334 a!411) ((as const (Array (_ BitVec 32) T!45327)) mapDefault!547)))))

(declare-fun b!261967 () Bool)

(assert (=> b!261967 (= e!182376 e!182377)))

(declare-fun res!219266 () Bool)

(assert (=> b!261967 (=> (not res!219266) (not e!182377))))

(assert (=> b!261967 (= res!219266 (arrayRangesEq!968 a!411 lt!403963 at!213 at!213))))

(assert (=> b!261967 (= lt!403963 (array!14545 (store (arr!7334 a!411) at!213 v!328) (size!6347 a!411)))))

(declare-fun mapIsEmpty!547 () Bool)

(assert (=> mapIsEmpty!547 mapRes!547))

(declare-fun mapNonEmpty!547 () Bool)

(declare-fun tp!547 () Bool)

(assert (=> mapNonEmpty!547 (= mapRes!547 (and tp!547 tp_is_empty!201))))

(declare-fun mapRest!547 () (Array (_ BitVec 32) T!45327))

(declare-fun mapKey!547 () (_ BitVec 32))

(declare-fun mapValue!547 () T!45327)

(assert (=> mapNonEmpty!547 (= (arr!7334 a!411) (store mapRest!547 mapKey!547 mapValue!547))))

(assert (= (and start!57130 res!219265) b!261967))

(assert (= (and b!261967 res!219266) b!261965))

(assert (= (and b!261966 condMapEmpty!547) mapIsEmpty!547))

(assert (= (and b!261966 (not condMapEmpty!547)) mapNonEmpty!547))

(assert (= start!57130 b!261966))

(declare-fun m!392043 () Bool)

(assert (=> b!261965 m!392043))

(declare-fun m!392045 () Bool)

(assert (=> b!261965 m!392045))

(declare-fun m!392047 () Bool)

(assert (=> start!57130 m!392047))

(declare-fun m!392049 () Bool)

(assert (=> b!261967 m!392049))

(declare-fun m!392051 () Bool)

(assert (=> b!261967 m!392051))

(declare-fun m!392053 () Bool)

(assert (=> mapNonEmpty!547 m!392053))

(check-sat (not b!261965) (not start!57130) (not b!261967) (not mapNonEmpty!547) tp_is_empty!201)
(check-sat)
