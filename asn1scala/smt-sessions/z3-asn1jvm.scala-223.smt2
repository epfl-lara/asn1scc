; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4602 () Bool)

(assert start!4602)

(declare-fun res!16315 () Bool)

(declare-fun e!11918 () Bool)

(assert (=> start!4602 (=> (not res!16315) (not e!11918))))

(declare-datatypes ((array!1252 0))(
  ( (array!1253 (arr!968 (Array (_ BitVec 32) (_ BitVec 8))) (size!527 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1252)

(declare-fun a1!923 () array!1252)

(declare-fun to!875 () (_ BitVec 64))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> start!4602 (= res!16315 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!527 a1!923) (size!527 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!527 a1!923))))))))

(assert (=> start!4602 e!11918))

(declare-fun array_inv!497 (array!1252) Bool)

(assert (=> start!4602 (array_inv!497 a2!923)))

(assert (=> start!4602 (array_inv!497 a1!923)))

(assert (=> start!4602 true))

(declare-fun b!18597 () Bool)

(declare-fun e!11916 () Bool)

(assert (=> b!18597 (= e!11918 e!11916)))

(declare-fun res!16316 () Bool)

(assert (=> b!18597 (=> (not res!16316) (not e!11916))))

(declare-fun atByte!6 () (_ BitVec 32))

(declare-fun lt!26857 () (_ BitVec 64))

(assert (=> b!18597 (= res!16316 (and (bvsle lt!26857 ((_ sign_extend 32) atByte!6)) (bvslt ((_ sign_extend 32) atByte!6) (bvsdiv to!875 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!18597 (= lt!26857 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!18598 () Bool)

(declare-fun res!16314 () Bool)

(assert (=> b!18598 (=> (not res!16314) (not e!11916))))

(declare-fun arrayBitRangesEq!0 (array!1252 array!1252 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18598 (= res!16314 (arrayBitRangesEq!0 a1!923 a2!923 from!908 to!875))))

(declare-fun b!18599 () Bool)

(assert (=> b!18599 (= e!11916 (or (bvsgt lt!26857 from!908) (bvsgt from!908 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!6)))))))

(assert (= (and start!4602 res!16315) b!18597))

(assert (= (and b!18597 res!16316) b!18598))

(assert (= (and b!18598 res!16314) b!18599))

(declare-fun m!25015 () Bool)

(assert (=> start!4602 m!25015))

(declare-fun m!25017 () Bool)

(assert (=> start!4602 m!25017))

(declare-fun m!25019 () Bool)

(assert (=> b!18598 m!25019))

(check-sat (not start!4602) (not b!18598))
(check-sat)
