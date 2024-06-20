; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74062 () Bool)

(assert start!74062)

(declare-datatypes ((Unit!22137 0))(
  ( (Unit!22138) )
))
(declare-fun lt!448640 () Unit!22137)

(declare-datatypes ((T!66543 0))(
  ( (T!66544 (val!538 Int)) )
))
(declare-datatypes ((array!21298 0))(
  ( (array!21299 (arr!10334 (Array (_ BitVec 32) T!66543)) (size!9242 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21298)

(declare-fun rec!115 (array!21298 (_ BitVec 32)) Unit!22137)

(assert (=> start!74062 (= lt!448640 (rec!115 a!404 (size!9242 a!404)))))

(assert (=> start!74062 false))

(declare-fun e!236090 () Bool)

(declare-fun array_inv!8793 (array!21298) Bool)

(assert (=> start!74062 (and (array_inv!8793 a!404) e!236090)))

(declare-fun b!326781 () Bool)

(declare-fun tp_is_empty!1077 () Bool)

(declare-fun mapRes!3337 () Bool)

(assert (=> b!326781 (= e!236090 (and tp_is_empty!1077 mapRes!3337))))

(declare-fun condMapEmpty!3337 () Bool)

(declare-fun mapDefault!3337 () T!66543)

(assert (=> b!326781 (= condMapEmpty!3337 (= (arr!10334 a!404) ((as const (Array (_ BitVec 32) T!66543)) mapDefault!3337)))))

(declare-fun mapIsEmpty!3337 () Bool)

(assert (=> mapIsEmpty!3337 mapRes!3337))

(declare-fun mapNonEmpty!3337 () Bool)

(declare-fun tp!3337 () Bool)

(assert (=> mapNonEmpty!3337 (= mapRes!3337 (and tp!3337 tp_is_empty!1077))))

(declare-fun mapKey!3337 () (_ BitVec 32))

(declare-fun mapValue!3337 () T!66543)

(declare-fun mapRest!3337 () (Array (_ BitVec 32) T!66543))

(assert (=> mapNonEmpty!3337 (= (arr!10334 a!404) (store mapRest!3337 mapKey!3337 mapValue!3337))))

(assert (= (and b!326781 condMapEmpty!3337) mapIsEmpty!3337))

(assert (= (and b!326781 (not condMapEmpty!3337)) mapNonEmpty!3337))

(assert (= start!74062 b!326781))

(declare-fun m!464633 () Bool)

(assert (=> start!74062 m!464633))

(declare-fun m!464635 () Bool)

(assert (=> start!74062 m!464635))

(declare-fun m!464637 () Bool)

(assert (=> mapNonEmpty!3337 m!464637))

(check-sat (not start!74062) (not mapNonEmpty!3337) tp_is_empty!1077)
(check-sat)
