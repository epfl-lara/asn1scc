; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57108 () Bool)

(assert start!57108)

(declare-fun b!261885 () Bool)

(declare-fun e!182298 () Bool)

(declare-fun tp_is_empty!183 () Bool)

(declare-fun mapRes!517 () Bool)

(assert (=> b!261885 (= e!182298 (and tp_is_empty!183 mapRes!517))))

(declare-fun condMapEmpty!517 () Bool)

(declare-datatypes ((T!45249 0))(
  ( (T!45250 (val!91 Int)) )
))
(declare-datatypes ((array!14525 0))(
  ( (array!14526 (arr!7325 (Array (_ BitVec 32) T!45249)) (size!6338 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14525)

(declare-fun mapDefault!517 () T!45249)

(assert (=> b!261885 (= condMapEmpty!517 (= (arr!7325 a!411) ((as const (Array (_ BitVec 32) T!45249)) mapDefault!517)))))

(declare-fun mapNonEmpty!517 () Bool)

(declare-fun tp!517 () Bool)

(assert (=> mapNonEmpty!517 (= mapRes!517 (and tp!517 tp_is_empty!183))))

(declare-fun mapValue!517 () T!45249)

(declare-fun mapKey!517 () (_ BitVec 32))

(declare-fun mapRest!517 () (Array (_ BitVec 32) T!45249))

(assert (=> mapNonEmpty!517 (= (arr!7325 a!411) (store mapRest!517 mapKey!517 mapValue!517))))

(declare-fun b!261886 () Bool)

(declare-fun e!182299 () Bool)

(declare-fun e!182297 () Bool)

(assert (=> b!261886 (= e!182299 e!182297)))

(declare-fun res!219215 () Bool)

(assert (=> b!261886 (=> (not res!219215) (not e!182297))))

(declare-fun at!213 () (_ BitVec 32))

(declare-fun lt!403928 () array!14525)

(declare-fun arrayRangesEq!961 (array!14525 array!14525 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261886 (= res!219215 (arrayRangesEq!961 a!411 lt!403928 at!213 at!213))))

(declare-fun v!328 () T!45249)

(assert (=> b!261886 (= lt!403928 (array!14526 (store (arr!7325 a!411) at!213 v!328) (size!6338 a!411)))))

(declare-fun res!219214 () Bool)

(assert (=> start!57108 (=> (not res!219214) (not e!182299))))

(assert (=> start!57108 (= res!219214 (and (bvsle #b00000000000000000000000000000000 at!213) (bvslt at!213 (size!6338 a!411))))))

(assert (=> start!57108 e!182299))

(assert (=> start!57108 true))

(declare-fun array_inv!6076 (array!14525) Bool)

(assert (=> start!57108 (and (array_inv!6076 a!411) e!182298)))

(assert (=> start!57108 tp_is_empty!183))

(declare-fun b!261887 () Bool)

(assert (=> b!261887 (= e!182297 (not (bvsle at!213 (size!6338 a!411))))))

(assert (=> b!261887 (arrayRangesEq!961 a!411 lt!403928 #b00000000000000000000000000000000 at!213)))

(declare-datatypes ((Unit!18683 0))(
  ( (Unit!18684) )
))
(declare-fun lt!403927 () Unit!18683)

(declare-fun rec!29 (array!14525 (_ BitVec 32) T!45249 (_ BitVec 32)) Unit!18683)

(assert (=> b!261887 (= lt!403927 (rec!29 a!411 at!213 v!328 at!213))))

(declare-fun mapIsEmpty!517 () Bool)

(assert (=> mapIsEmpty!517 mapRes!517))

(assert (= (and start!57108 res!219214) b!261886))

(assert (= (and b!261886 res!219215) b!261887))

(assert (= (and b!261885 condMapEmpty!517) mapIsEmpty!517))

(assert (= (and b!261885 (not condMapEmpty!517)) mapNonEmpty!517))

(assert (= start!57108 b!261885))

(declare-fun m!391939 () Bool)

(assert (=> mapNonEmpty!517 m!391939))

(declare-fun m!391941 () Bool)

(assert (=> b!261886 m!391941))

(declare-fun m!391943 () Bool)

(assert (=> b!261886 m!391943))

(declare-fun m!391945 () Bool)

(assert (=> start!57108 m!391945))

(declare-fun m!391947 () Bool)

(assert (=> b!261887 m!391947))

(declare-fun m!391949 () Bool)

(assert (=> b!261887 m!391949))

(check-sat (not b!261886) tp_is_empty!183 (not mapNonEmpty!517) (not b!261887) (not start!57108))
(check-sat)
