; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4616 () Bool)

(assert start!4616)

(declare-fun res!16395 () Bool)

(declare-fun e!12000 () Bool)

(assert (=> start!4616 (=> (not res!16395) (not e!12000))))

(declare-datatypes ((array!1266 0))(
  ( (array!1267 (arr!975 (Array (_ BitVec 32) (_ BitVec 8))) (size!534 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1266)

(declare-fun a1!923 () array!1266)

(declare-fun to!875 () (_ BitVec 64))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> start!4616 (= res!16395 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!534 a1!923) (size!534 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!534 a1!923))))))))

(assert (=> start!4616 e!12000))

(declare-fun array_inv!504 (array!1266) Bool)

(assert (=> start!4616 (array_inv!504 a2!923)))

(assert (=> start!4616 (array_inv!504 a1!923)))

(assert (=> start!4616 true))

(declare-fun b!18678 () Bool)

(declare-fun res!16397 () Bool)

(declare-fun e!12002 () Bool)

(assert (=> b!18678 (=> (not res!16397) (not e!12002))))

(declare-fun arrayBitRangesEq!0 (array!1266 array!1266 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18678 (= res!16397 (arrayBitRangesEq!0 a1!923 a2!923 from!908 to!875))))

(declare-fun b!18679 () Bool)

(declare-fun res!16396 () Bool)

(assert (=> b!18679 (=> (not res!16396) (not e!12002))))

(declare-fun atByte!6 () (_ BitVec 32))

(declare-fun lt!26895 () (_ BitVec 64))

(assert (=> b!18679 (= res!16396 (and (bvsle lt!26895 from!908) (bvsle from!908 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!6)))))))

(declare-fun b!18680 () Bool)

(assert (=> b!18680 (= e!12002 (not (and (bvsge atByte!6 #b00000000000000000000000000000000) (bvslt atByte!6 (size!534 a2!923)))))))

(assert (=> b!18680 (= ((_ sign_extend 24) (select (arr!975 a1!923) atByte!6)) ((_ sign_extend 24) (select (arr!975 a2!923) atByte!6)))))

(declare-datatypes ((Unit!1654 0))(
  ( (Unit!1655) )
))
(declare-fun lt!26896 () Unit!1654)

(declare-fun rec!23 (array!1266 array!1266 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1654)

(assert (=> b!18680 (= lt!26896 (rec!23 a1!923 a2!923 atByte!6 from!908 to!875 from!908))))

(declare-fun b!18677 () Bool)

(assert (=> b!18677 (= e!12000 e!12002)))

(declare-fun res!16394 () Bool)

(assert (=> b!18677 (=> (not res!16394) (not e!12002))))

(assert (=> b!18677 (= res!16394 (and (bvsle lt!26895 ((_ sign_extend 32) atByte!6)) (bvslt ((_ sign_extend 32) atByte!6) (bvsdiv to!875 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!18677 (= lt!26895 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and start!4616 res!16395) b!18677))

(assert (= (and b!18677 res!16394) b!18678))

(assert (= (and b!18678 res!16397) b!18679))

(assert (= (and b!18679 res!16396) b!18680))

(declare-fun m!25087 () Bool)

(assert (=> start!4616 m!25087))

(declare-fun m!25089 () Bool)

(assert (=> start!4616 m!25089))

(declare-fun m!25091 () Bool)

(assert (=> b!18678 m!25091))

(declare-fun m!25093 () Bool)

(assert (=> b!18680 m!25093))

(declare-fun m!25095 () Bool)

(assert (=> b!18680 m!25095))

(declare-fun m!25097 () Bool)

(assert (=> b!18680 m!25097))

(push 1)

(assert (not b!18678))

(assert (not start!4616))

(assert (not b!18680))

(check-sat)

(pop 1)

(push 1)

(check-sat)

