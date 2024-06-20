; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57102 () Bool)

(assert start!57102)

(declare-fun mapIsEmpty!508 () Bool)

(declare-fun mapRes!508 () Bool)

(assert (=> mapIsEmpty!508 mapRes!508))

(declare-fun res!219196 () Bool)

(declare-fun e!182271 () Bool)

(assert (=> start!57102 (=> (not res!219196) (not e!182271))))

(declare-fun at!213 () (_ BitVec 32))

(declare-datatypes ((T!45223 0))(
  ( (T!45224 (val!88 Int)) )
))
(declare-datatypes ((array!14519 0))(
  ( (array!14520 (arr!7322 (Array (_ BitVec 32) T!45223)) (size!6335 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14519)

(assert (=> start!57102 (= res!219196 (and (bvsle #b00000000000000000000000000000000 at!213) (bvslt at!213 (size!6335 a!411))))))

(assert (=> start!57102 e!182271))

(assert (=> start!57102 true))

(declare-fun e!182272 () Bool)

(declare-fun array_inv!6074 (array!14519) Bool)

(assert (=> start!57102 (and (array_inv!6074 a!411) e!182272)))

(declare-fun tp_is_empty!177 () Bool)

(assert (=> start!57102 tp_is_empty!177))

(declare-fun b!261858 () Bool)

(declare-fun e!182270 () Bool)

(assert (=> b!261858 (= e!182271 e!182270)))

(declare-fun res!219197 () Bool)

(assert (=> b!261858 (=> (not res!219197) (not e!182270))))

(declare-fun lt!403910 () array!14519)

(declare-fun arrayRangesEq!958 (array!14519 array!14519 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261858 (= res!219197 (arrayRangesEq!958 a!411 lt!403910 at!213 at!213))))

(declare-fun v!328 () T!45223)

(assert (=> b!261858 (= lt!403910 (array!14520 (store (arr!7322 a!411) at!213 v!328) (size!6335 a!411)))))

(declare-fun b!261859 () Bool)

(assert (=> b!261859 (= e!182270 (not true))))

(assert (=> b!261859 (arrayRangesEq!958 a!411 lt!403910 #b00000000000000000000000000000000 at!213)))

(declare-datatypes ((Unit!18679 0))(
  ( (Unit!18680) )
))
(declare-fun lt!403909 () Unit!18679)

(declare-fun rec!27 (array!14519 (_ BitVec 32) T!45223 (_ BitVec 32)) Unit!18679)

(assert (=> b!261859 (= lt!403909 (rec!27 a!411 at!213 v!328 at!213))))

(declare-fun b!261860 () Bool)

(assert (=> b!261860 (= e!182272 (and tp_is_empty!177 mapRes!508))))

(declare-fun condMapEmpty!508 () Bool)

(declare-fun mapDefault!508 () T!45223)

(assert (=> b!261860 (= condMapEmpty!508 (= (arr!7322 a!411) ((as const (Array (_ BitVec 32) T!45223)) mapDefault!508)))))

(declare-fun mapNonEmpty!508 () Bool)

(declare-fun tp!508 () Bool)

(assert (=> mapNonEmpty!508 (= mapRes!508 (and tp!508 tp_is_empty!177))))

(declare-fun mapValue!508 () T!45223)

(declare-fun mapKey!508 () (_ BitVec 32))

(declare-fun mapRest!508 () (Array (_ BitVec 32) T!45223))

(assert (=> mapNonEmpty!508 (= (arr!7322 a!411) (store mapRest!508 mapKey!508 mapValue!508))))

(assert (= (and start!57102 res!219196) b!261858))

(assert (= (and b!261858 res!219197) b!261859))

(assert (= (and b!261860 condMapEmpty!508) mapIsEmpty!508))

(assert (= (and b!261860 (not condMapEmpty!508)) mapNonEmpty!508))

(assert (= start!57102 b!261860))

(declare-fun m!391903 () Bool)

(assert (=> start!57102 m!391903))

(declare-fun m!391905 () Bool)

(assert (=> b!261858 m!391905))

(declare-fun m!391907 () Bool)

(assert (=> b!261858 m!391907))

(declare-fun m!391909 () Bool)

(assert (=> b!261859 m!391909))

(declare-fun m!391911 () Bool)

(assert (=> b!261859 m!391911))

(declare-fun m!391913 () Bool)

(assert (=> mapNonEmpty!508 m!391913))

(check-sat (not mapNonEmpty!508) (not b!261859) (not b!261858) tp_is_empty!177 (not start!57102))
(check-sat)
