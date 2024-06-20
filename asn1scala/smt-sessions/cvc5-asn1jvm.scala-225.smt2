; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4612 () Bool)

(assert start!4612)

(declare-fun b!18653 () Bool)

(declare-fun e!11977 () Bool)

(declare-fun e!11979 () Bool)

(assert (=> b!18653 (= e!11977 e!11979)))

(declare-fun res!16373 () Bool)

(assert (=> b!18653 (=> (not res!16373) (not e!11979))))

(declare-fun lt!26883 () (_ BitVec 64))

(declare-fun to!875 () (_ BitVec 64))

(declare-fun atByte!6 () (_ BitVec 32))

(assert (=> b!18653 (= res!16373 (and (bvsle lt!26883 ((_ sign_extend 32) atByte!6)) (bvslt ((_ sign_extend 32) atByte!6) (bvsdiv to!875 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> b!18653 (= lt!26883 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!18656 () Bool)

(declare-datatypes ((array!1262 0))(
  ( (array!1263 (arr!973 (Array (_ BitVec 32) (_ BitVec 8))) (size!532 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1262)

(assert (=> b!18656 (= e!11979 (not (and (bvsge atByte!6 #b00000000000000000000000000000000) (bvslt atByte!6 (size!532 a2!923)))))))

(declare-fun a1!923 () array!1262)

(assert (=> b!18656 (= ((_ sign_extend 24) (select (arr!973 a1!923) atByte!6)) ((_ sign_extend 24) (select (arr!973 a2!923) atByte!6)))))

(declare-datatypes ((Unit!1650 0))(
  ( (Unit!1651) )
))
(declare-fun lt!26884 () Unit!1650)

(declare-fun rec!23 (array!1262 array!1262 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1650)

(assert (=> b!18656 (= lt!26884 (rec!23 a1!923 a2!923 atByte!6 from!908 to!875 from!908))))

(declare-fun b!18655 () Bool)

(declare-fun res!16371 () Bool)

(assert (=> b!18655 (=> (not res!16371) (not e!11979))))

(assert (=> b!18655 (= res!16371 (and (bvsle lt!26883 from!908) (bvsle from!908 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!6)))))))

(declare-fun res!16372 () Bool)

(assert (=> start!4612 (=> (not res!16372) (not e!11977))))

(assert (=> start!4612 (= res!16372 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!532 a1!923) (size!532 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!532 a1!923))))))))

(assert (=> start!4612 e!11977))

(declare-fun array_inv!502 (array!1262) Bool)

(assert (=> start!4612 (array_inv!502 a2!923)))

(assert (=> start!4612 (array_inv!502 a1!923)))

(assert (=> start!4612 true))

(declare-fun b!18654 () Bool)

(declare-fun res!16370 () Bool)

(assert (=> b!18654 (=> (not res!16370) (not e!11979))))

(declare-fun arrayBitRangesEq!0 (array!1262 array!1262 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18654 (= res!16370 (arrayBitRangesEq!0 a1!923 a2!923 from!908 to!875))))

(assert (= (and start!4612 res!16372) b!18653))

(assert (= (and b!18653 res!16373) b!18654))

(assert (= (and b!18654 res!16370) b!18655))

(assert (= (and b!18655 res!16371) b!18656))

(declare-fun m!25063 () Bool)

(assert (=> b!18656 m!25063))

(declare-fun m!25065 () Bool)

(assert (=> b!18656 m!25065))

(declare-fun m!25067 () Bool)

(assert (=> b!18656 m!25067))

(declare-fun m!25069 () Bool)

(assert (=> start!4612 m!25069))

(declare-fun m!25071 () Bool)

(assert (=> start!4612 m!25071))

(declare-fun m!25073 () Bool)

(assert (=> b!18654 m!25073))

(push 1)

(assert (not b!18656))

(assert (not start!4612))

(assert (not b!18654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

