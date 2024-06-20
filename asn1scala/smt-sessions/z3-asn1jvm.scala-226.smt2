; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4620 () Bool)

(assert start!4620)

(declare-fun res!16420 () Bool)

(declare-fun e!12027 () Bool)

(assert (=> start!4620 (=> (not res!16420) (not e!12027))))

(declare-datatypes ((array!1270 0))(
  ( (array!1271 (arr!977 (Array (_ BitVec 32) (_ BitVec 8))) (size!536 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1270)

(declare-fun a1!923 () array!1270)

(declare-fun to!875 () (_ BitVec 64))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> start!4620 (= res!16420 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!536 a1!923) (size!536 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!536 a1!923))))))))

(assert (=> start!4620 e!12027))

(declare-fun array_inv!506 (array!1270) Bool)

(assert (=> start!4620 (array_inv!506 a2!923)))

(assert (=> start!4620 (array_inv!506 a1!923)))

(assert (=> start!4620 true))

(declare-fun b!18703 () Bool)

(declare-fun res!16421 () Bool)

(declare-fun e!12026 () Bool)

(assert (=> b!18703 (=> (not res!16421) (not e!12026))))

(declare-fun lt!26907 () (_ BitVec 64))

(declare-fun atByte!6 () (_ BitVec 32))

(assert (=> b!18703 (= res!16421 (and (bvsle lt!26907 from!908) (bvsle from!908 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!6)))))))

(declare-fun b!18701 () Bool)

(assert (=> b!18701 (= e!12027 e!12026)))

(declare-fun res!16418 () Bool)

(assert (=> b!18701 (=> (not res!16418) (not e!12026))))

(assert (=> b!18701 (= res!16418 (and (bvsle lt!26907 ((_ sign_extend 32) atByte!6)) (bvslt ((_ sign_extend 32) atByte!6) (bvsdiv to!875 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!18701 (= lt!26907 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!18704 () Bool)

(assert (=> b!18704 (= e!12026 (not true))))

(assert (=> b!18704 (= ((_ sign_extend 24) (select (arr!977 a1!923) atByte!6)) ((_ sign_extend 24) (select (arr!977 a2!923) atByte!6)))))

(declare-datatypes ((Unit!1658 0))(
  ( (Unit!1659) )
))
(declare-fun lt!26908 () Unit!1658)

(declare-fun rec!23 (array!1270 array!1270 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1658)

(assert (=> b!18704 (= lt!26908 (rec!23 a1!923 a2!923 atByte!6 from!908 to!875 from!908))))

(declare-fun b!18702 () Bool)

(declare-fun res!16419 () Bool)

(assert (=> b!18702 (=> (not res!16419) (not e!12026))))

(declare-fun arrayBitRangesEq!0 (array!1270 array!1270 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18702 (= res!16419 (arrayBitRangesEq!0 a1!923 a2!923 from!908 to!875))))

(assert (= (and start!4620 res!16420) b!18701))

(assert (= (and b!18701 res!16418) b!18702))

(assert (= (and b!18702 res!16419) b!18703))

(assert (= (and b!18703 res!16421) b!18704))

(declare-fun m!25111 () Bool)

(assert (=> start!4620 m!25111))

(declare-fun m!25113 () Bool)

(assert (=> start!4620 m!25113))

(declare-fun m!25115 () Bool)

(assert (=> b!18704 m!25115))

(declare-fun m!25117 () Bool)

(assert (=> b!18704 m!25117))

(declare-fun m!25119 () Bool)

(assert (=> b!18704 m!25119))

(declare-fun m!25121 () Bool)

(assert (=> b!18702 m!25121))

(check-sat (not b!18702) (not b!18704) (not start!4620))
