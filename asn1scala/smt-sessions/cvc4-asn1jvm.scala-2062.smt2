; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52434 () Bool)

(assert start!52434)

(declare-fun b!241387 () Bool)

(declare-fun e!167312 () Bool)

(declare-datatypes ((array!13245 0))(
  ( (array!13246 (arr!6789 (Array (_ BitVec 32) (_ BitVec 8))) (size!5802 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10526 0))(
  ( (BitStream!10527 (buf!6268 array!13245) (currentByte!11631 (_ BitVec 32)) (currentBit!11626 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20588 0))(
  ( (tuple2!20589 (_1!11216 BitStream!10526) (_2!11216 Bool)) )
))
(declare-fun lt!376940 () tuple2!20588)

(declare-fun lt!376944 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241387 (= e!167312 (= (bitIndex!0 (size!5802 (buf!6268 (_1!11216 lt!376940))) (currentByte!11631 (_1!11216 lt!376940)) (currentBit!11626 (_1!11216 lt!376940))) lt!376944))))

(declare-fun b!241388 () Bool)

(declare-fun res!201507 () Bool)

(declare-fun e!167309 () Bool)

(assert (=> b!241388 (=> (not res!201507) (not e!167309))))

(declare-fun thiss!1005 () BitStream!10526)

(declare-datatypes ((Unit!17687 0))(
  ( (Unit!17688) )
))
(declare-datatypes ((tuple2!20590 0))(
  ( (tuple2!20591 (_1!11217 Unit!17687) (_2!11217 BitStream!10526)) )
))
(declare-fun lt!376941 () tuple2!20590)

(declare-fun isPrefixOf!0 (BitStream!10526 BitStream!10526) Bool)

(assert (=> b!241388 (= res!201507 (isPrefixOf!0 thiss!1005 (_2!11217 lt!376941)))))

(declare-fun res!201504 () Bool)

(declare-fun e!167310 () Bool)

(assert (=> start!52434 (=> (not res!201504) (not e!167310))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!52434 (= res!201504 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52434 e!167310))

(assert (=> start!52434 true))

(declare-fun e!167307 () Bool)

(declare-fun inv!12 (BitStream!10526) Bool)

(assert (=> start!52434 (and (inv!12 thiss!1005) e!167307)))

(declare-fun b!241389 () Bool)

(declare-fun e!167308 () Bool)

(assert (=> b!241389 (= e!167308 e!167309)))

(declare-fun res!201503 () Bool)

(assert (=> b!241389 (=> (not res!201503) (not e!167309))))

(declare-fun lt!376939 () (_ BitVec 64))

(assert (=> b!241389 (= res!201503 (= lt!376944 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!376939)))))

(assert (=> b!241389 (= lt!376944 (bitIndex!0 (size!5802 (buf!6268 (_2!11217 lt!376941))) (currentByte!11631 (_2!11217 lt!376941)) (currentBit!11626 (_2!11217 lt!376941))))))

(assert (=> b!241389 (= lt!376939 (bitIndex!0 (size!5802 (buf!6268 thiss!1005)) (currentByte!11631 thiss!1005) (currentBit!11626 thiss!1005)))))

(declare-fun b!241390 () Bool)

(declare-fun array_inv!5543 (array!13245) Bool)

(assert (=> b!241390 (= e!167307 (array_inv!5543 (buf!6268 thiss!1005)))))

(declare-fun b!241391 () Bool)

(assert (=> b!241391 (= e!167309 e!167312)))

(declare-fun res!201502 () Bool)

(assert (=> b!241391 (=> (not res!201502) (not e!167312))))

(declare-fun bit!26 () Bool)

(assert (=> b!241391 (= res!201502 (and (= (_2!11216 lt!376940) bit!26) (= (_1!11216 lt!376940) (_2!11217 lt!376941))))))

(declare-fun readBitPure!0 (BitStream!10526) tuple2!20588)

(declare-fun readerFrom!0 (BitStream!10526 (_ BitVec 32) (_ BitVec 32)) BitStream!10526)

(assert (=> b!241391 (= lt!376940 (readBitPure!0 (readerFrom!0 (_2!11217 lt!376941) (currentBit!11626 thiss!1005) (currentByte!11631 thiss!1005))))))

(declare-fun b!241392 () Bool)

(declare-fun res!201505 () Bool)

(assert (=> b!241392 (=> (not res!201505) (not e!167310))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241392 (= res!201505 (validate_offset_bits!1 ((_ sign_extend 32) (size!5802 (buf!6268 thiss!1005))) ((_ sign_extend 32) (currentByte!11631 thiss!1005)) ((_ sign_extend 32) (currentBit!11626 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241393 () Bool)

(assert (=> b!241393 (= e!167310 (not true))))

(declare-fun lt!376942 () (_ BitVec 64))

(assert (=> b!241393 (= lt!376942 (bitIndex!0 (size!5802 (buf!6268 (_2!11217 lt!376941))) (currentByte!11631 (_2!11217 lt!376941)) (currentBit!11626 (_2!11217 lt!376941))))))

(declare-fun lt!376943 () (_ BitVec 64))

(assert (=> b!241393 (= lt!376943 (bitIndex!0 (size!5802 (buf!6268 thiss!1005)) (currentByte!11631 thiss!1005) (currentBit!11626 thiss!1005)))))

(assert (=> b!241393 e!167308))

(declare-fun res!201501 () Bool)

(assert (=> b!241393 (=> (not res!201501) (not e!167308))))

(assert (=> b!241393 (= res!201501 (= (size!5802 (buf!6268 thiss!1005)) (size!5802 (buf!6268 (_2!11217 lt!376941)))))))

(declare-fun appendBit!0 (BitStream!10526 Bool) tuple2!20590)

(assert (=> b!241393 (= lt!376941 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241394 () Bool)

(declare-fun res!201506 () Bool)

(assert (=> b!241394 (=> (not res!201506) (not e!167310))))

(assert (=> b!241394 (= res!201506 (bvslt from!289 nBits!297))))

(assert (= (and start!52434 res!201504) b!241392))

(assert (= (and b!241392 res!201505) b!241394))

(assert (= (and b!241394 res!201506) b!241393))

(assert (= (and b!241393 res!201501) b!241389))

(assert (= (and b!241389 res!201503) b!241388))

(assert (= (and b!241388 res!201507) b!241391))

(assert (= (and b!241391 res!201502) b!241387))

(assert (= start!52434 b!241390))

(declare-fun m!364071 () Bool)

(assert (=> b!241391 m!364071))

(assert (=> b!241391 m!364071))

(declare-fun m!364073 () Bool)

(assert (=> b!241391 m!364073))

(declare-fun m!364075 () Bool)

(assert (=> b!241393 m!364075))

(declare-fun m!364077 () Bool)

(assert (=> b!241393 m!364077))

(declare-fun m!364079 () Bool)

(assert (=> b!241393 m!364079))

(declare-fun m!364081 () Bool)

(assert (=> b!241392 m!364081))

(declare-fun m!364083 () Bool)

(assert (=> start!52434 m!364083))

(assert (=> b!241389 m!364075))

(assert (=> b!241389 m!364077))

(declare-fun m!364085 () Bool)

(assert (=> b!241388 m!364085))

(declare-fun m!364087 () Bool)

(assert (=> b!241387 m!364087))

(declare-fun m!364089 () Bool)

(assert (=> b!241390 m!364089))

(push 1)

(assert (not b!241387))

(assert (not b!241389))

(assert (not start!52434))

