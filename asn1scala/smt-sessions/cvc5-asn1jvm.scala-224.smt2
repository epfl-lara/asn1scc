; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4606 () Bool)

(assert start!4606)

(declare-fun b!18617 () Bool)

(declare-fun e!11942 () Bool)

(declare-fun e!11940 () Bool)

(assert (=> b!18617 (= e!11942 e!11940)))

(declare-fun res!16337 () Bool)

(assert (=> b!18617 (=> (not res!16337) (not e!11940))))

(declare-fun to!875 () (_ BitVec 64))

(declare-fun atByte!6 () (_ BitVec 32))

(declare-fun lt!26866 () (_ BitVec 64))

(assert (=> b!18617 (= res!16337 (and (bvsle lt!26866 ((_ sign_extend 32) atByte!6)) (bvslt ((_ sign_extend 32) atByte!6) (bvsdiv to!875 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> b!18617 (= lt!26866 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!18620 () Bool)

(declare-datatypes ((array!1256 0))(
  ( (array!1257 (arr!970 (Array (_ BitVec 32) (_ BitVec 8))) (size!529 (_ BitVec 32))) )
))
(declare-fun a1!923 () array!1256)

(assert (=> b!18620 (= e!11940 (not (and (bvsge atByte!6 #b00000000000000000000000000000000) (bvslt atByte!6 (size!529 a1!923)))))))

(declare-fun a2!923 () array!1256)

(assert (=> b!18620 (= ((_ sign_extend 24) (select (arr!970 a1!923) atByte!6)) ((_ sign_extend 24) (select (arr!970 a2!923) atByte!6)))))

(declare-datatypes ((Unit!1644 0))(
  ( (Unit!1645) )
))
(declare-fun lt!26865 () Unit!1644)

(declare-fun rec!23 (array!1256 array!1256 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1644)

(assert (=> b!18620 (= lt!26865 (rec!23 a1!923 a2!923 atByte!6 from!908 to!875 from!908))))

(declare-fun b!18619 () Bool)

(declare-fun res!16336 () Bool)

(assert (=> b!18619 (=> (not res!16336) (not e!11940))))

(assert (=> b!18619 (= res!16336 (and (bvsle lt!26866 from!908) (bvsle from!908 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!6)))))))

(declare-fun b!18618 () Bool)

(declare-fun res!16335 () Bool)

(assert (=> b!18618 (=> (not res!16335) (not e!11940))))

(declare-fun arrayBitRangesEq!0 (array!1256 array!1256 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18618 (= res!16335 (arrayBitRangesEq!0 a1!923 a2!923 from!908 to!875))))

(declare-fun res!16334 () Bool)

(assert (=> start!4606 (=> (not res!16334) (not e!11942))))

(assert (=> start!4606 (= res!16334 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!529 a1!923) (size!529 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!529 a1!923))))))))

(assert (=> start!4606 e!11942))

(declare-fun array_inv!499 (array!1256) Bool)

(assert (=> start!4606 (array_inv!499 a2!923)))

(assert (=> start!4606 (array_inv!499 a1!923)))

(assert (=> start!4606 true))

(assert (= (and start!4606 res!16334) b!18617))

(assert (= (and b!18617 res!16337) b!18618))

(assert (= (and b!18618 res!16335) b!18619))

(assert (= (and b!18619 res!16336) b!18620))

(declare-fun m!25027 () Bool)

(assert (=> b!18620 m!25027))

(declare-fun m!25029 () Bool)

(assert (=> b!18620 m!25029))

(declare-fun m!25031 () Bool)

(assert (=> b!18620 m!25031))

(declare-fun m!25033 () Bool)

(assert (=> b!18618 m!25033))

(declare-fun m!25035 () Bool)

(assert (=> start!4606 m!25035))

(declare-fun m!25037 () Bool)

(assert (=> start!4606 m!25037))

(push 1)

(assert (not b!18618))

(assert (not b!18620))

(assert (not start!4606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

