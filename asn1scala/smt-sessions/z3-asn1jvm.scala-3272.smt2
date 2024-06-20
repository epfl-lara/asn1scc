; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74120 () Bool)

(assert start!74120)

(declare-fun res!268455 () Bool)

(declare-fun e!236230 () Bool)

(assert (=> start!74120 (=> (not res!268455) (not e!236230))))

(declare-fun i!907 () (_ BitVec 32))

(declare-datatypes ((T!66751 0))(
  ( (T!66752 (val!562 Int)) )
))
(declare-datatypes ((array!21348 0))(
  ( (array!21349 (arr!10358 (Array (_ BitVec 32) T!66751)) (size!9266 (_ BitVec 32))) )
))
(declare-fun a!407 () array!21348)

(assert (=> start!74120 (= res!268455 (and (bvsle #b00000000000000000000000000000000 i!907) (bvsle i!907 (size!9266 a!407))))))

(assert (=> start!74120 e!236230))

(assert (=> start!74120 true))

(declare-fun e!236229 () Bool)

(declare-fun array_inv!8810 (array!21348) Bool)

(assert (=> start!74120 (and (array_inv!8810 a!407) e!236229)))

(declare-fun mapIsEmpty!3415 () Bool)

(declare-fun mapRes!3415 () Bool)

(assert (=> mapIsEmpty!3415 mapRes!3415))

(declare-fun b!327009 () Bool)

(declare-fun res!268457 () Bool)

(assert (=> b!327009 (=> (not res!268457) (not e!236230))))

(assert (=> b!327009 (= res!268457 (not (= i!907 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!3415 () Bool)

(declare-fun tp!3415 () Bool)

(declare-fun tp_is_empty!1125 () Bool)

(assert (=> mapNonEmpty!3415 (= mapRes!3415 (and tp!3415 tp_is_empty!1125))))

(declare-fun mapKey!3415 () (_ BitVec 32))

(declare-fun mapRest!3415 () (Array (_ BitVec 32) T!66751))

(declare-fun mapValue!3415 () T!66751)

(assert (=> mapNonEmpty!3415 (= (arr!10358 a!407) (store mapRest!3415 mapKey!3415 mapValue!3415))))

(declare-fun b!327010 () Bool)

(assert (=> b!327010 (= e!236229 (and tp_is_empty!1125 mapRes!3415))))

(declare-fun condMapEmpty!3415 () Bool)

(declare-fun mapDefault!3415 () T!66751)

(assert (=> b!327010 (= condMapEmpty!3415 (= (arr!10358 a!407) ((as const (Array (_ BitVec 32) T!66751)) mapDefault!3415)))))

(declare-fun b!327011 () Bool)

(declare-fun res!268456 () Bool)

(assert (=> b!327011 (=> (not res!268456) (not e!236230))))

(declare-fun arrayRangesEq!1874 (array!21348 array!21348 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!327011 (= res!268456 (arrayRangesEq!1874 a!407 a!407 i!907 (size!9266 a!407)))))

(declare-fun b!327012 () Bool)

(assert (=> b!327012 (= e!236230 false)))

(declare-datatypes ((Unit!22164 0))(
  ( (Unit!22165) )
))
(declare-fun lt!448688 () Unit!22164)

(declare-fun rec!128 (array!21348 (_ BitVec 32)) Unit!22164)

(assert (=> b!327012 (= lt!448688 (rec!128 a!407 (bvsub i!907 #b00000000000000000000000000000001)))))

(assert (= (and start!74120 res!268455) b!327011))

(assert (= (and b!327011 res!268456) b!327009))

(assert (= (and b!327009 res!268457) b!327012))

(assert (= (and b!327010 condMapEmpty!3415) mapIsEmpty!3415))

(assert (= (and b!327010 (not condMapEmpty!3415)) mapNonEmpty!3415))

(assert (= start!74120 b!327010))

(declare-fun m!464821 () Bool)

(assert (=> start!74120 m!464821))

(declare-fun m!464823 () Bool)

(assert (=> mapNonEmpty!3415 m!464823))

(declare-fun m!464825 () Bool)

(assert (=> b!327011 m!464825))

(declare-fun m!464827 () Bool)

(assert (=> b!327012 m!464827))

(check-sat (not b!327011) (not mapNonEmpty!3415) tp_is_empty!1125 (not start!74120) (not b!327012))
(check-sat)
