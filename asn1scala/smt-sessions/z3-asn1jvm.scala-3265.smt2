; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74068 () Bool)

(assert start!74068)

(declare-datatypes ((Unit!22143 0))(
  ( (Unit!22144) )
))
(declare-fun lt!448649 () Unit!22143)

(declare-datatypes ((T!66569 0))(
  ( (T!66570 (val!541 Int)) )
))
(declare-datatypes ((array!21304 0))(
  ( (array!21305 (arr!10337 (Array (_ BitVec 32) T!66569)) (size!9245 (_ BitVec 32))) )
))
(declare-fun a!404 () array!21304)

(declare-fun rec!118 (array!21304 (_ BitVec 32)) Unit!22143)

(assert (=> start!74068 (= lt!448649 (rec!118 a!404 (size!9245 a!404)))))

(assert (=> start!74068 false))

(declare-fun e!236099 () Bool)

(declare-fun array_inv!8796 (array!21304) Bool)

(assert (=> start!74068 (and (array_inv!8796 a!404) e!236099)))

(declare-fun b!326790 () Bool)

(declare-fun tp_is_empty!1083 () Bool)

(declare-fun mapRes!3346 () Bool)

(assert (=> b!326790 (= e!236099 (and tp_is_empty!1083 mapRes!3346))))

(declare-fun condMapEmpty!3346 () Bool)

(declare-fun mapDefault!3346 () T!66569)

(assert (=> b!326790 (= condMapEmpty!3346 (= (arr!10337 a!404) ((as const (Array (_ BitVec 32) T!66569)) mapDefault!3346)))))

(declare-fun mapIsEmpty!3346 () Bool)

(assert (=> mapIsEmpty!3346 mapRes!3346))

(declare-fun mapNonEmpty!3346 () Bool)

(declare-fun tp!3346 () Bool)

(assert (=> mapNonEmpty!3346 (= mapRes!3346 (and tp!3346 tp_is_empty!1083))))

(declare-fun mapRest!3346 () (Array (_ BitVec 32) T!66569))

(declare-fun mapKey!3346 () (_ BitVec 32))

(declare-fun mapValue!3346 () T!66569)

(assert (=> mapNonEmpty!3346 (= (arr!10337 a!404) (store mapRest!3346 mapKey!3346 mapValue!3346))))

(assert (= (and b!326790 condMapEmpty!3346) mapIsEmpty!3346))

(assert (= (and b!326790 (not condMapEmpty!3346)) mapNonEmpty!3346))

(assert (= start!74068 b!326790))

(declare-fun m!464651 () Bool)

(assert (=> start!74068 m!464651))

(declare-fun m!464653 () Bool)

(assert (=> start!74068 m!464653))

(declare-fun m!464655 () Bool)

(assert (=> mapNonEmpty!3346 m!464655))

(check-sat (not start!74068) (not mapNonEmpty!3346) tp_is_empty!1083)
(check-sat)
