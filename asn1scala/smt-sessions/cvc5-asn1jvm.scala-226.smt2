; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4618 () Bool)

(assert start!4618)

(declare-fun b!18690 () Bool)

(declare-fun res!16407 () Bool)

(declare-fun e!12014 () Bool)

(assert (=> b!18690 (=> (not res!16407) (not e!12014))))

(declare-datatypes ((array!1268 0))(
  ( (array!1269 (arr!976 (Array (_ BitVec 32) (_ BitVec 8))) (size!535 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1268)

(declare-fun a1!923 () array!1268)

(declare-fun to!875 () (_ BitVec 64))

(declare-fun from!908 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!1268 array!1268 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18690 (= res!16407 (arrayBitRangesEq!0 a1!923 a2!923 from!908 to!875))))

(declare-fun b!18689 () Bool)

(declare-fun e!12013 () Bool)

(assert (=> b!18689 (= e!12013 e!12014)))

(declare-fun res!16409 () Bool)

(assert (=> b!18689 (=> (not res!16409) (not e!12014))))

(declare-fun lt!26901 () (_ BitVec 64))

(declare-fun atByte!6 () (_ BitVec 32))

(assert (=> b!18689 (= res!16409 (and (bvsle lt!26901 ((_ sign_extend 32) atByte!6)) (bvslt ((_ sign_extend 32) atByte!6) (bvsdiv to!875 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!18689 (= lt!26901 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!18692 () Bool)

(assert (=> b!18692 (= e!12014 (not true))))

(assert (=> b!18692 (= ((_ sign_extend 24) (select (arr!976 a1!923) atByte!6)) ((_ sign_extend 24) (select (arr!976 a2!923) atByte!6)))))

(declare-datatypes ((Unit!1656 0))(
  ( (Unit!1657) )
))
(declare-fun lt!26902 () Unit!1656)

(declare-fun rec!23 (array!1268 array!1268 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1656)

(assert (=> b!18692 (= lt!26902 (rec!23 a1!923 a2!923 atByte!6 from!908 to!875 from!908))))

(declare-fun res!16406 () Bool)

(assert (=> start!4618 (=> (not res!16406) (not e!12013))))

(assert (=> start!4618 (= res!16406 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!535 a1!923) (size!535 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!535 a1!923))))))))

(assert (=> start!4618 e!12013))

(declare-fun array_inv!505 (array!1268) Bool)

(assert (=> start!4618 (array_inv!505 a2!923)))

(assert (=> start!4618 (array_inv!505 a1!923)))

(assert (=> start!4618 true))

(declare-fun b!18691 () Bool)

(declare-fun res!16408 () Bool)

(assert (=> b!18691 (=> (not res!16408) (not e!12014))))

(assert (=> b!18691 (= res!16408 (and (bvsle lt!26901 from!908) (bvsle from!908 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!6)))))))

(assert (= (and start!4618 res!16406) b!18689))

(assert (= (and b!18689 res!16409) b!18690))

(assert (= (and b!18690 res!16407) b!18691))

(assert (= (and b!18691 res!16408) b!18692))

(declare-fun m!25099 () Bool)

(assert (=> b!18690 m!25099))

(declare-fun m!25101 () Bool)

(assert (=> b!18692 m!25101))

(declare-fun m!25103 () Bool)

(assert (=> b!18692 m!25103))

(declare-fun m!25105 () Bool)

(assert (=> b!18692 m!25105))

(declare-fun m!25107 () Bool)

(assert (=> start!4618 m!25107))

(declare-fun m!25109 () Bool)

(assert (=> start!4618 m!25109))

(push 1)

(assert (not b!18690))

(assert (not start!4618))

(assert (not b!18692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

