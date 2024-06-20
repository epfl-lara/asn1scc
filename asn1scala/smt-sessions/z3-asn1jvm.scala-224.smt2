; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4608 () Bool)

(assert start!4608)

(declare-fun b!18629 () Bool)

(declare-fun e!11954 () Bool)

(declare-fun e!11953 () Bool)

(assert (=> b!18629 (= e!11954 e!11953)))

(declare-fun res!16349 () Bool)

(assert (=> b!18629 (=> (not res!16349) (not e!11953))))

(declare-fun to!875 () (_ BitVec 64))

(declare-fun atByte!6 () (_ BitVec 32))

(declare-fun lt!26871 () (_ BitVec 64))

(assert (=> b!18629 (= res!16349 (and (bvsle lt!26871 ((_ sign_extend 32) atByte!6)) (bvslt ((_ sign_extend 32) atByte!6) (bvsdiv to!875 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> b!18629 (= lt!26871 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!18630 () Bool)

(declare-fun res!16347 () Bool)

(assert (=> b!18630 (=> (not res!16347) (not e!11953))))

(declare-datatypes ((array!1258 0))(
  ( (array!1259 (arr!971 (Array (_ BitVec 32) (_ BitVec 8))) (size!530 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1258)

(declare-fun a1!923 () array!1258)

(declare-fun arrayBitRangesEq!0 (array!1258 array!1258 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18630 (= res!16347 (arrayBitRangesEq!0 a1!923 a2!923 from!908 to!875))))

(declare-fun b!18631 () Bool)

(declare-fun res!16348 () Bool)

(assert (=> b!18631 (=> (not res!16348) (not e!11953))))

(assert (=> b!18631 (= res!16348 (and (bvsle lt!26871 from!908) (bvsle from!908 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!6)))))))

(declare-fun b!18632 () Bool)

(assert (=> b!18632 (= e!11953 (not (and (bvsge atByte!6 #b00000000000000000000000000000000) (bvslt atByte!6 (size!530 a1!923)))))))

(assert (=> b!18632 (= ((_ sign_extend 24) (select (arr!971 a1!923) atByte!6)) ((_ sign_extend 24) (select (arr!971 a2!923) atByte!6)))))

(declare-datatypes ((Unit!1646 0))(
  ( (Unit!1647) )
))
(declare-fun lt!26872 () Unit!1646)

(declare-fun rec!23 (array!1258 array!1258 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1646)

(assert (=> b!18632 (= lt!26872 (rec!23 a1!923 a2!923 atByte!6 from!908 to!875 from!908))))

(declare-fun res!16346 () Bool)

(assert (=> start!4608 (=> (not res!16346) (not e!11954))))

(assert (=> start!4608 (= res!16346 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!530 a1!923) (size!530 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!530 a1!923))))))))

(assert (=> start!4608 e!11954))

(declare-fun array_inv!500 (array!1258) Bool)

(assert (=> start!4608 (array_inv!500 a2!923)))

(assert (=> start!4608 (array_inv!500 a1!923)))

(assert (=> start!4608 true))

(assert (= (and start!4608 res!16346) b!18629))

(assert (= (and b!18629 res!16349) b!18630))

(assert (= (and b!18630 res!16347) b!18631))

(assert (= (and b!18631 res!16348) b!18632))

(declare-fun m!25039 () Bool)

(assert (=> b!18630 m!25039))

(declare-fun m!25041 () Bool)

(assert (=> b!18632 m!25041))

(declare-fun m!25043 () Bool)

(assert (=> b!18632 m!25043))

(declare-fun m!25045 () Bool)

(assert (=> b!18632 m!25045))

(declare-fun m!25047 () Bool)

(assert (=> start!4608 m!25047))

(declare-fun m!25049 () Bool)

(assert (=> start!4608 m!25049))

(check-sat (not start!4608) (not b!18632) (not b!18630))
(check-sat)
