; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4622 () Bool)

(assert start!4622)

(declare-fun b!18713 () Bool)

(declare-fun e!12036 () Bool)

(declare-fun e!12037 () Bool)

(assert (=> b!18713 (= e!12036 e!12037)))

(declare-fun res!16431 () Bool)

(assert (=> b!18713 (=> (not res!16431) (not e!12037))))

(declare-fun lt!26913 () (_ BitVec 64))

(declare-fun to!875 () (_ BitVec 64))

(declare-fun atByte!6 () (_ BitVec 32))

(assert (=> b!18713 (= res!16431 (and (bvsle lt!26913 ((_ sign_extend 32) atByte!6)) (bvslt ((_ sign_extend 32) atByte!6) (bvsdiv to!875 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> b!18713 (= lt!26913 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!18715 () Bool)

(declare-fun res!16432 () Bool)

(assert (=> b!18715 (=> (not res!16432) (not e!12037))))

(assert (=> b!18715 (= res!16432 (and (bvsle lt!26913 from!908) (bvsle from!908 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!6)))))))

(declare-fun b!18714 () Bool)

(declare-fun res!16433 () Bool)

(assert (=> b!18714 (=> (not res!16433) (not e!12037))))

(declare-datatypes ((array!1272 0))(
  ( (array!1273 (arr!978 (Array (_ BitVec 32) (_ BitVec 8))) (size!537 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1272)

(declare-fun a1!923 () array!1272)

(declare-fun arrayBitRangesEq!0 (array!1272 array!1272 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18714 (= res!16433 (arrayBitRangesEq!0 a1!923 a2!923 from!908 to!875))))

(declare-fun res!16430 () Bool)

(assert (=> start!4622 (=> (not res!16430) (not e!12036))))

(assert (=> start!4622 (= res!16430 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!537 a1!923) (size!537 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!537 a1!923))))))))

(assert (=> start!4622 e!12036))

(declare-fun array_inv!507 (array!1272) Bool)

(assert (=> start!4622 (array_inv!507 a2!923)))

(assert (=> start!4622 (array_inv!507 a1!923)))

(assert (=> start!4622 true))

(declare-fun b!18716 () Bool)

(assert (=> b!18716 (= e!12037 (not true))))

(assert (=> b!18716 (= ((_ sign_extend 24) (select (arr!978 a1!923) atByte!6)) ((_ sign_extend 24) (select (arr!978 a2!923) atByte!6)))))

(declare-datatypes ((Unit!1660 0))(
  ( (Unit!1661) )
))
(declare-fun lt!26914 () Unit!1660)

(declare-fun rec!23 (array!1272 array!1272 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1660)

(assert (=> b!18716 (= lt!26914 (rec!23 a1!923 a2!923 atByte!6 from!908 to!875 from!908))))

(assert (= (and start!4622 res!16430) b!18713))

(assert (= (and b!18713 res!16431) b!18714))

(assert (= (and b!18714 res!16433) b!18715))

(assert (= (and b!18715 res!16432) b!18716))

(declare-fun m!25123 () Bool)

(assert (=> b!18714 m!25123))

(declare-fun m!25125 () Bool)

(assert (=> start!4622 m!25125))

(declare-fun m!25127 () Bool)

(assert (=> start!4622 m!25127))

(declare-fun m!25129 () Bool)

(assert (=> b!18716 m!25129))

(declare-fun m!25131 () Bool)

(assert (=> b!18716 m!25131))

(declare-fun m!25133 () Bool)

(assert (=> b!18716 m!25133))

(push 1)

(assert (not b!18714))

(assert (not b!18716))

(assert (not start!4622))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

