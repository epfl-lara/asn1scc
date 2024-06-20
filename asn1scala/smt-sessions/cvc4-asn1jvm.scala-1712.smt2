; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47340 () Bool)

(assert start!47340)

(declare-fun b!225864 () Bool)

(declare-fun res!189533 () Bool)

(declare-fun e!154294 () Bool)

(assert (=> b!225864 (=> (not res!189533) (not e!154294))))

(declare-datatypes ((array!11268 0))(
  ( (array!11269 (arr!5901 (Array (_ BitVec 32) (_ BitVec 8))) (size!4944 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8984 0))(
  ( (BitStream!8985 (buf!5485 array!11268) (currentByte!10281 (_ BitVec 32)) (currentBit!10276 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8984)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225864 (= res!189533 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4944 (buf!5485 thiss!1870))) ((_ sign_extend 32) (currentByte!10281 thiss!1870)) ((_ sign_extend 32) (currentBit!10276 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225865 () Bool)

(declare-fun e!154295 () Bool)

(assert (=> b!225865 (= e!154294 e!154295)))

(declare-fun res!189532 () Bool)

(assert (=> b!225865 (=> (not res!189532) (not e!154295))))

(declare-datatypes ((tuple2!19332 0))(
  ( (tuple2!19333 (_1!10453 (_ BitVec 8)) (_2!10453 BitStream!8984)) )
))
(declare-fun lt!358943 () tuple2!19332)

(assert (=> b!225865 (= res!189532 (= (size!4944 (buf!5485 thiss!1870)) (size!4944 (buf!5485 (_2!10453 lt!358943)))))))

(declare-fun readByte!0 (BitStream!8984) tuple2!19332)

(assert (=> b!225865 (= lt!358943 (readByte!0 thiss!1870))))

(declare-fun b!225866 () Bool)

(declare-fun e!154293 () Bool)

(declare-fun array_inv!4685 (array!11268) Bool)

(assert (=> b!225866 (= e!154293 (array_inv!4685 (buf!5485 thiss!1870)))))

(declare-fun b!225867 () Bool)

(declare-fun res!189534 () Bool)

(assert (=> b!225867 (=> (not res!189534) (not e!154294))))

(assert (=> b!225867 (= res!189534 (bvslt i!761 to!496))))

(declare-fun b!225863 () Bool)

(assert (=> b!225863 (= e!154295 false)))

(declare-fun lt!358944 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225863 (= lt!358944 (bitIndex!0 (size!4944 (buf!5485 (_2!10453 lt!358943))) (currentByte!10281 (_2!10453 lt!358943)) (currentBit!10276 (_2!10453 lt!358943))))))

(declare-fun res!189535 () Bool)

(assert (=> start!47340 (=> (not res!189535) (not e!154294))))

(declare-fun arr!308 () array!11268)

(assert (=> start!47340 (= res!189535 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4944 arr!308))))))

(assert (=> start!47340 e!154294))

(assert (=> start!47340 true))

(assert (=> start!47340 (array_inv!4685 arr!308)))

(declare-fun inv!12 (BitStream!8984) Bool)

(assert (=> start!47340 (and (inv!12 thiss!1870) e!154293)))

(assert (= (and start!47340 res!189535) b!225864))

(assert (= (and b!225864 res!189533) b!225867))

(assert (= (and b!225867 res!189534) b!225865))

(assert (= (and b!225865 res!189532) b!225863))

(assert (= start!47340 b!225866))

(declare-fun m!346903 () Bool)

(assert (=> b!225865 m!346903))

(declare-fun m!346905 () Bool)

(assert (=> b!225863 m!346905))

(declare-fun m!346907 () Bool)

(assert (=> b!225864 m!346907))

(declare-fun m!346909 () Bool)

(assert (=> start!47340 m!346909))

(declare-fun m!346911 () Bool)

(assert (=> start!47340 m!346911))

(declare-fun m!346913 () Bool)

(assert (=> b!225866 m!346913))

(push 1)

