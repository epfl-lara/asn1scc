; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47334 () Bool)

(assert start!47334)

(declare-fun b!225818 () Bool)

(declare-fun e!154250 () Bool)

(declare-datatypes ((array!11262 0))(
  ( (array!11263 (arr!5898 (Array (_ BitVec 32) (_ BitVec 8))) (size!4941 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8978 0))(
  ( (BitStream!8979 (buf!5482 array!11262) (currentByte!10278 (_ BitVec 32)) (currentBit!10273 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8978)

(declare-fun array_inv!4682 (array!11262) Bool)

(assert (=> b!225818 (= e!154250 (array_inv!4682 (buf!5482 thiss!1870)))))

(declare-fun res!189496 () Bool)

(declare-fun e!154251 () Bool)

(assert (=> start!47334 (=> (not res!189496) (not e!154251))))

(declare-fun arr!308 () array!11262)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47334 (= res!189496 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4941 arr!308))))))

(assert (=> start!47334 e!154251))

(assert (=> start!47334 true))

(assert (=> start!47334 (array_inv!4682 arr!308)))

(declare-fun inv!12 (BitStream!8978) Bool)

(assert (=> start!47334 (and (inv!12 thiss!1870) e!154250)))

(declare-fun b!225819 () Bool)

(declare-fun res!189499 () Bool)

(assert (=> b!225819 (=> (not res!189499) (not e!154251))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225819 (= res!189499 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4941 (buf!5482 thiss!1870))) ((_ sign_extend 32) (currentByte!10278 thiss!1870)) ((_ sign_extend 32) (currentBit!10273 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225820 () Bool)

(declare-fun res!189497 () Bool)

(assert (=> b!225820 (=> (not res!189497) (not e!154251))))

(assert (=> b!225820 (= res!189497 (bvslt i!761 to!496))))

(declare-fun b!225821 () Bool)

(declare-fun e!154249 () Bool)

(assert (=> b!225821 (= e!154249 false)))

(declare-fun lt!358925 () (_ BitVec 64))

(declare-datatypes ((tuple2!19326 0))(
  ( (tuple2!19327 (_1!10450 (_ BitVec 8)) (_2!10450 BitStream!8978)) )
))
(declare-fun lt!358926 () tuple2!19326)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225821 (= lt!358925 (bitIndex!0 (size!4941 (buf!5482 (_2!10450 lt!358926))) (currentByte!10278 (_2!10450 lt!358926)) (currentBit!10273 (_2!10450 lt!358926))))))

(declare-fun b!225822 () Bool)

(assert (=> b!225822 (= e!154251 e!154249)))

(declare-fun res!189498 () Bool)

(assert (=> b!225822 (=> (not res!189498) (not e!154249))))

(assert (=> b!225822 (= res!189498 (= (size!4941 (buf!5482 thiss!1870)) (size!4941 (buf!5482 (_2!10450 lt!358926)))))))

(declare-fun readByte!0 (BitStream!8978) tuple2!19326)

(assert (=> b!225822 (= lt!358926 (readByte!0 thiss!1870))))

(assert (= (and start!47334 res!189496) b!225819))

(assert (= (and b!225819 res!189499) b!225820))

(assert (= (and b!225820 res!189497) b!225822))

(assert (= (and b!225822 res!189498) b!225821))

(assert (= start!47334 b!225818))

(declare-fun m!346867 () Bool)

(assert (=> b!225821 m!346867))

(declare-fun m!346869 () Bool)

(assert (=> b!225818 m!346869))

(declare-fun m!346871 () Bool)

(assert (=> start!47334 m!346871))

(declare-fun m!346873 () Bool)

(assert (=> start!47334 m!346873))

(declare-fun m!346875 () Bool)

(assert (=> b!225819 m!346875))

(declare-fun m!346877 () Bool)

(assert (=> b!225822 m!346877))

(push 1)

(assert (not start!47334))

(assert (not b!225822))

(assert (not b!225821))

(assert (not b!225818))

(assert (not b!225819))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

