; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74138 () Bool)

(assert start!74138)

(declare-fun res!268523 () Bool)

(declare-fun e!236283 () Bool)

(assert (=> start!74138 (=> (not res!268523) (not e!236283))))

(declare-fun i!907 () (_ BitVec 32))

(declare-datatypes ((T!66829 0))(
  ( (T!66830 (val!571 Int)) )
))
(declare-datatypes ((array!21366 0))(
  ( (array!21367 (arr!10367 (Array (_ BitVec 32) T!66829)) (size!9275 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21366)

(assert (=> start!74138 (= res!268523 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9275 a!407))))))

(assert (=> start!74138 e!236283))

(assert (=> start!74138 true))

(declare-fun e!236284 () Bool)

(declare-fun array_inv!8816 (array!21366) Bool)

(assert (=> start!74138 (and (array_inv!8816 a!407) e!236284)))

(declare-fun b!327103 () Bool)

(declare-fun tp_is_empty!1143 () Bool)

(declare-fun mapRes!3442 () Bool)

(assert (=> b!327103 (= e!236284 (and tp_is_empty!1143 mapRes!3442))))

(declare-fun condMapEmpty!3442 () Bool)

(declare-fun mapDefault!3442 () T!66829)

(assert (=> b!327103 (= condMapEmpty!3442 (= (arr!10367 a!407) ((as const (Array (_ BitVec 32) T!66829)) mapDefault!3442)))))

(declare-fun b!327104 () Bool)

(declare-fun res!268522 () Bool)

(assert (=> b!327104 (=> (not res!268522) (not e!236283))))

(declare-fun arrayRangesEq!1880 (array!21366 array!21366 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!327104 (= res!268522 (arrayRangesEq!1880 a!407 a!407 i!907 (size!9275 a!407)))))

(declare-fun mapIsEmpty!3442 () Bool)

(assert (=> mapIsEmpty!3442 mapRes!3442))

(declare-fun mapNonEmpty!3442 () Bool)

(declare-fun tp!3442 () Bool)

(assert (=> mapNonEmpty!3442 (= mapRes!3442 (and tp!3442 tp_is_empty!1143))))

(declare-fun mapValue!3442 () T!66829)

(declare-fun mapRest!3442 () (Array (_ BitVec 32) T!66829))

(declare-fun mapKey!3442 () (_ BitVec 32))

(assert (=> mapNonEmpty!3442 (= (arr!10367 a!407) (store mapRest!3442 mapKey!3442 mapValue!3442))))

(declare-fun b!327105 () Bool)

(assert (=> b!327105 (= e!236283 (and (not (= i!907 #b00000000000000000000000000000000)) (bvsge (bvsub i!907 #b00000000000000000000000000000001) i!907)))))

(assert (= (and start!74138 res!268523) b!327104))

(assert (= (and b!327104 res!268522) b!327105))

(assert (= (and b!327103 condMapEmpty!3442) mapIsEmpty!3442))

(assert (= (and b!327103 (not condMapEmpty!3442)) mapNonEmpty!3442))

(assert (= start!74138 b!327103))

(declare-fun m!464885 () Bool)

(assert (=> start!74138 m!464885))

(declare-fun m!464887 () Bool)

(assert (=> b!327104 m!464887))

(declare-fun m!464889 () Bool)

(assert (=> mapNonEmpty!3442 m!464889))

(check-sat (not b!327104) (not start!74138) (not mapNonEmpty!3442) tp_is_empty!1143)
(check-sat)
