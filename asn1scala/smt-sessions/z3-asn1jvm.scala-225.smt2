; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4614 () Bool)

(assert start!4614)

(declare-fun b!18667 () Bool)

(declare-fun res!16382 () Bool)

(declare-fun e!11988 () Bool)

(assert (=> b!18667 (=> (not res!16382) (not e!11988))))

(declare-fun atByte!6 () (_ BitVec 32))

(declare-fun from!908 () (_ BitVec 64))

(declare-fun lt!26889 () (_ BitVec 64))

(assert (=> b!18667 (= res!16382 (and (bvsle lt!26889 from!908) (bvsle from!908 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!6)))))))

(declare-fun b!18666 () Bool)

(declare-fun res!16383 () Bool)

(assert (=> b!18666 (=> (not res!16383) (not e!11988))))

(declare-datatypes ((array!1264 0))(
  ( (array!1265 (arr!974 (Array (_ BitVec 32) (_ BitVec 8))) (size!533 (_ BitVec 32))) )
))
(declare-fun a2!923 () array!1264)

(declare-fun a1!923 () array!1264)

(declare-fun to!875 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!1264 array!1264 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18666 (= res!16383 (arrayBitRangesEq!0 a1!923 a2!923 from!908 to!875))))

(declare-fun b!18665 () Bool)

(declare-fun e!11991 () Bool)

(assert (=> b!18665 (= e!11991 e!11988)))

(declare-fun res!16385 () Bool)

(assert (=> b!18665 (=> (not res!16385) (not e!11988))))

(assert (=> b!18665 (= res!16385 (and (bvsle lt!26889 ((_ sign_extend 32) atByte!6)) (bvslt ((_ sign_extend 32) atByte!6) (bvsdiv to!875 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!18665 (= lt!26889 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun res!16384 () Bool)

(assert (=> start!4614 (=> (not res!16384) (not e!11991))))

(assert (=> start!4614 (= res!16384 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!533 a1!923) (size!533 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!533 a1!923))))))))

(assert (=> start!4614 e!11991))

(declare-fun array_inv!503 (array!1264) Bool)

(assert (=> start!4614 (array_inv!503 a2!923)))

(assert (=> start!4614 (array_inv!503 a1!923)))

(assert (=> start!4614 true))

(declare-fun b!18668 () Bool)

(assert (=> b!18668 (= e!11988 (not (and (bvsge atByte!6 #b00000000000000000000000000000000) (bvslt atByte!6 (size!533 a2!923)))))))

(assert (=> b!18668 (= ((_ sign_extend 24) (select (arr!974 a1!923) atByte!6)) ((_ sign_extend 24) (select (arr!974 a2!923) atByte!6)))))

(declare-datatypes ((Unit!1652 0))(
  ( (Unit!1653) )
))
(declare-fun lt!26890 () Unit!1652)

(declare-fun rec!23 (array!1264 array!1264 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1652)

(assert (=> b!18668 (= lt!26890 (rec!23 a1!923 a2!923 atByte!6 from!908 to!875 from!908))))

(assert (= (and start!4614 res!16384) b!18665))

(assert (= (and b!18665 res!16385) b!18666))

(assert (= (and b!18666 res!16383) b!18667))

(assert (= (and b!18667 res!16382) b!18668))

(declare-fun m!25075 () Bool)

(assert (=> b!18666 m!25075))

(declare-fun m!25077 () Bool)

(assert (=> start!4614 m!25077))

(declare-fun m!25079 () Bool)

(assert (=> start!4614 m!25079))

(declare-fun m!25081 () Bool)

(assert (=> b!18668 m!25081))

(declare-fun m!25083 () Bool)

(assert (=> b!18668 m!25083))

(declare-fun m!25085 () Bool)

(assert (=> b!18668 m!25085))

(check-sat (not start!4614) (not b!18666) (not b!18668))
(check-sat)
