; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43632 () Bool)

(assert start!43632)

(declare-fun b!207104 () Bool)

(declare-fun res!173732 () Bool)

(declare-fun e!141579 () Bool)

(assert (=> b!207104 (=> (not res!173732) (not e!141579))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!207104 (= res!173732 (not (= i!590 nBits!348)))))

(declare-fun b!207105 () Bool)

(declare-fun e!141584 () Bool)

(declare-datatypes ((array!10415 0))(
  ( (array!10416 (arr!5509 (Array (_ BitVec 32) (_ BitVec 8))) (size!4579 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8266 0))(
  ( (BitStream!8267 (buf!5084 array!10415) (currentByte!9602 (_ BitVec 32)) (currentBit!9597 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8266)

(declare-datatypes ((Unit!14752 0))(
  ( (Unit!14753) )
))
(declare-datatypes ((tuple2!17738 0))(
  ( (tuple2!17739 (_1!9524 Unit!14752) (_2!9524 BitStream!8266)) )
))
(declare-fun lt!323359 () tuple2!17738)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!207105 (= e!141584 (invariant!0 (currentBit!9597 thiss!1204) (currentByte!9602 thiss!1204) (size!4579 (buf!5084 (_2!9524 lt!323359)))))))

(declare-fun b!207106 () Bool)

(declare-fun res!173736 () Bool)

(declare-fun e!141575 () Bool)

(assert (=> b!207106 (=> res!173736 e!141575)))

(assert (=> b!207106 (= res!173736 (not (invariant!0 (currentBit!9597 (_2!9524 lt!323359)) (currentByte!9602 (_2!9524 lt!323359)) (size!4579 (buf!5084 (_2!9524 lt!323359))))))))

(declare-fun b!207107 () Bool)

(declare-fun res!173730 () Bool)

(declare-fun e!141582 () Bool)

(assert (=> b!207107 (=> (not res!173730) (not e!141582))))

(declare-fun lt!323366 () tuple2!17738)

(declare-fun isPrefixOf!0 (BitStream!8266 BitStream!8266) Bool)

(assert (=> b!207107 (= res!173730 (isPrefixOf!0 thiss!1204 (_2!9524 lt!323366)))))

(declare-fun b!207108 () Bool)

(declare-fun res!173737 () Bool)

(assert (=> b!207108 (=> res!173737 e!141575)))

(assert (=> b!207108 (= res!173737 (not (isPrefixOf!0 thiss!1204 (_2!9524 lt!323366))))))

(declare-fun b!207109 () Bool)

(declare-fun e!141580 () Bool)

(assert (=> b!207109 (= e!141582 e!141580)))

(declare-fun res!173733 () Bool)

(assert (=> b!207109 (=> (not res!173733) (not e!141580))))

(declare-fun lt!323360 () Bool)

(declare-datatypes ((tuple2!17740 0))(
  ( (tuple2!17741 (_1!9525 BitStream!8266) (_2!9525 Bool)) )
))
(declare-fun lt!323369 () tuple2!17740)

(assert (=> b!207109 (= res!173733 (and (= (_2!9525 lt!323369) lt!323360) (= (_1!9525 lt!323369) (_2!9524 lt!323366))))))

(declare-fun readBitPure!0 (BitStream!8266) tuple2!17740)

(declare-fun readerFrom!0 (BitStream!8266 (_ BitVec 32) (_ BitVec 32)) BitStream!8266)

(assert (=> b!207109 (= lt!323369 (readBitPure!0 (readerFrom!0 (_2!9524 lt!323366) (currentBit!9597 thiss!1204) (currentByte!9602 thiss!1204))))))

(declare-fun b!207110 () Bool)

(declare-fun e!141576 () Bool)

(assert (=> b!207110 (= e!141576 e!141579)))

(declare-fun res!173738 () Bool)

(assert (=> b!207110 (=> (not res!173738) (not e!141579))))

(declare-fun lt!323357 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!207110 (= res!173738 (validate_offset_bits!1 ((_ sign_extend 32) (size!4579 (buf!5084 thiss!1204))) ((_ sign_extend 32) (currentByte!9602 thiss!1204)) ((_ sign_extend 32) (currentBit!9597 thiss!1204)) lt!323357))))

(assert (=> b!207110 (= lt!323357 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!207111 () Bool)

(declare-fun e!141577 () Bool)

(declare-fun lt!323367 () tuple2!17740)

(declare-fun lt!323351 () tuple2!17740)

(assert (=> b!207111 (= e!141577 (= (_2!9525 lt!323367) (_2!9525 lt!323351)))))

(declare-fun res!173735 () Bool)

(assert (=> start!43632 (=> (not res!173735) (not e!141576))))

(assert (=> start!43632 (= res!173735 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43632 e!141576))

(assert (=> start!43632 true))

(declare-fun e!141583 () Bool)

(declare-fun inv!12 (BitStream!8266) Bool)

(assert (=> start!43632 (and (inv!12 thiss!1204) e!141583)))

(declare-fun b!207112 () Bool)

(declare-fun res!173723 () Bool)

(assert (=> b!207112 (=> (not res!173723) (not e!141579))))

(assert (=> b!207112 (= res!173723 (invariant!0 (currentBit!9597 thiss!1204) (currentByte!9602 thiss!1204) (size!4579 (buf!5084 thiss!1204))))))

(declare-fun b!207113 () Bool)

(declare-fun lt!323365 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207113 (= e!141580 (= (bitIndex!0 (size!4579 (buf!5084 (_1!9525 lt!323369))) (currentByte!9602 (_1!9525 lt!323369)) (currentBit!9597 (_1!9525 lt!323369))) lt!323365))))

(declare-fun b!207114 () Bool)

(declare-fun res!173734 () Bool)

(assert (=> b!207114 (=> res!173734 e!141575)))

(assert (=> b!207114 (= res!173734 (not (isPrefixOf!0 (_2!9524 lt!323366) (_2!9524 lt!323359))))))

(declare-fun b!207115 () Bool)

(declare-fun res!173725 () Bool)

(assert (=> b!207115 (=> res!173725 e!141575)))

(declare-fun lt!323354 () (_ BitVec 64))

(declare-fun lt!323355 () (_ BitVec 64))

(assert (=> b!207115 (= res!173725 (or (not (= (size!4579 (buf!5084 (_2!9524 lt!323359))) (size!4579 (buf!5084 thiss!1204)))) (not (= lt!323354 (bvsub (bvadd lt!323355 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!207116 () Bool)

(declare-fun array_inv!4320 (array!10415) Bool)

(assert (=> b!207116 (= e!141583 (array_inv!4320 (buf!5084 thiss!1204)))))

(declare-fun b!207117 () Bool)

(declare-fun e!141585 () Bool)

(assert (=> b!207117 (= e!141585 e!141582)))

(declare-fun res!173731 () Bool)

(assert (=> b!207117 (=> (not res!173731) (not e!141582))))

(declare-fun lt!323362 () (_ BitVec 64))

(assert (=> b!207117 (= res!173731 (= lt!323365 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323362)))))

(assert (=> b!207117 (= lt!323365 (bitIndex!0 (size!4579 (buf!5084 (_2!9524 lt!323366))) (currentByte!9602 (_2!9524 lt!323366)) (currentBit!9597 (_2!9524 lt!323366))))))

(assert (=> b!207117 (= lt!323362 (bitIndex!0 (size!4579 (buf!5084 thiss!1204)) (currentByte!9602 thiss!1204) (currentBit!9597 thiss!1204)))))

(declare-fun b!207118 () Bool)

(assert (=> b!207118 (= e!141575 (= (size!4579 (buf!5084 (_2!9524 lt!323366))) (size!4579 (buf!5084 (_2!9524 lt!323359)))))))

(declare-fun v!189 () (_ BitVec 64))

(declare-datatypes ((tuple2!17742 0))(
  ( (tuple2!17743 (_1!9526 BitStream!8266) (_2!9526 (_ BitVec 64))) )
))
(declare-fun lt!323364 () tuple2!17742)

(declare-datatypes ((tuple2!17744 0))(
  ( (tuple2!17745 (_1!9527 BitStream!8266) (_2!9527 BitStream!8266)) )
))
(declare-fun lt!323358 () tuple2!17744)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17742)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!207118 (= lt!323364 (readNBitsLSBFirstsLoopPure!0 (_1!9527 lt!323358) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> b!207118 (validate_offset_bits!1 ((_ sign_extend 32) (size!4579 (buf!5084 (_2!9524 lt!323359)))) ((_ sign_extend 32) (currentByte!9602 thiss!1204)) ((_ sign_extend 32) (currentBit!9597 thiss!1204)) lt!323357)))

(declare-fun lt!323352 () Unit!14752)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8266 array!10415 (_ BitVec 64)) Unit!14752)

(assert (=> b!207118 (= lt!323352 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5084 (_2!9524 lt!323359)) lt!323357))))

(assert (=> b!207118 (= (_2!9525 (readBitPure!0 (_1!9527 lt!323358))) lt!323360)))

(declare-fun lt!323368 () tuple2!17744)

(declare-fun reader!0 (BitStream!8266 BitStream!8266) tuple2!17744)

(assert (=> b!207118 (= lt!323368 (reader!0 (_2!9524 lt!323366) (_2!9524 lt!323359)))))

(assert (=> b!207118 (= lt!323358 (reader!0 thiss!1204 (_2!9524 lt!323359)))))

(assert (=> b!207118 e!141577))

(declare-fun res!173728 () Bool)

(assert (=> b!207118 (=> (not res!173728) (not e!141577))))

(assert (=> b!207118 (= res!173728 (= (bitIndex!0 (size!4579 (buf!5084 (_1!9525 lt!323367))) (currentByte!9602 (_1!9525 lt!323367)) (currentBit!9597 (_1!9525 lt!323367))) (bitIndex!0 (size!4579 (buf!5084 (_1!9525 lt!323351))) (currentByte!9602 (_1!9525 lt!323351)) (currentBit!9597 (_1!9525 lt!323351)))))))

(declare-fun lt!323361 () Unit!14752)

(declare-fun lt!323356 () BitStream!8266)

(declare-fun readBitPrefixLemma!0 (BitStream!8266 BitStream!8266) Unit!14752)

(assert (=> b!207118 (= lt!323361 (readBitPrefixLemma!0 lt!323356 (_2!9524 lt!323359)))))

(assert (=> b!207118 (= lt!323351 (readBitPure!0 (BitStream!8267 (buf!5084 (_2!9524 lt!323359)) (currentByte!9602 thiss!1204) (currentBit!9597 thiss!1204))))))

(assert (=> b!207118 (= lt!323367 (readBitPure!0 lt!323356))))

(assert (=> b!207118 e!141584))

(declare-fun res!173729 () Bool)

(assert (=> b!207118 (=> (not res!173729) (not e!141584))))

(assert (=> b!207118 (= res!173729 (invariant!0 (currentBit!9597 thiss!1204) (currentByte!9602 thiss!1204) (size!4579 (buf!5084 (_2!9524 lt!323366)))))))

(assert (=> b!207118 (= lt!323356 (BitStream!8267 (buf!5084 (_2!9524 lt!323366)) (currentByte!9602 thiss!1204) (currentBit!9597 thiss!1204)))))

(declare-fun b!207119 () Bool)

(declare-fun e!141578 () Bool)

(assert (=> b!207119 (= e!141578 e!141575)))

(declare-fun res!173726 () Bool)

(assert (=> b!207119 (=> res!173726 e!141575)))

(declare-fun lt!323353 () (_ BitVec 64))

(assert (=> b!207119 (= res!173726 (not (= lt!323354 (bvsub (bvsub (bvadd lt!323353 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!207119 (= lt!323354 (bitIndex!0 (size!4579 (buf!5084 (_2!9524 lt!323359))) (currentByte!9602 (_2!9524 lt!323359)) (currentBit!9597 (_2!9524 lt!323359))))))

(assert (=> b!207119 (isPrefixOf!0 thiss!1204 (_2!9524 lt!323359))))

(declare-fun lt!323363 () Unit!14752)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8266 BitStream!8266 BitStream!8266) Unit!14752)

(assert (=> b!207119 (= lt!323363 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9524 lt!323366) (_2!9524 lt!323359)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8266 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17738)

(assert (=> b!207119 (= lt!323359 (appendBitsLSBFirstLoopTR!0 (_2!9524 lt!323366) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!207120 () Bool)

(assert (=> b!207120 (= e!141579 (not e!141578))))

(declare-fun res!173727 () Bool)

(assert (=> b!207120 (=> res!173727 e!141578)))

(assert (=> b!207120 (= res!173727 (not (= lt!323353 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323355))))))

(assert (=> b!207120 (= lt!323353 (bitIndex!0 (size!4579 (buf!5084 (_2!9524 lt!323366))) (currentByte!9602 (_2!9524 lt!323366)) (currentBit!9597 (_2!9524 lt!323366))))))

(assert (=> b!207120 (= lt!323355 (bitIndex!0 (size!4579 (buf!5084 thiss!1204)) (currentByte!9602 thiss!1204) (currentBit!9597 thiss!1204)))))

(assert (=> b!207120 e!141585))

(declare-fun res!173724 () Bool)

(assert (=> b!207120 (=> (not res!173724) (not e!141585))))

(assert (=> b!207120 (= res!173724 (= (size!4579 (buf!5084 thiss!1204)) (size!4579 (buf!5084 (_2!9524 lt!323366)))))))

(declare-fun appendBit!0 (BitStream!8266 Bool) tuple2!17738)

(assert (=> b!207120 (= lt!323366 (appendBit!0 thiss!1204 lt!323360))))

(assert (=> b!207120 (= lt!323360 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!43632 res!173735) b!207110))

(assert (= (and b!207110 res!173738) b!207112))

(assert (= (and b!207112 res!173723) b!207104))

(assert (= (and b!207104 res!173732) b!207120))

(assert (= (and b!207120 res!173724) b!207117))

(assert (= (and b!207117 res!173731) b!207107))

(assert (= (and b!207107 res!173730) b!207109))

(assert (= (and b!207109 res!173733) b!207113))

(assert (= (and b!207120 (not res!173727)) b!207119))

(assert (= (and b!207119 (not res!173726)) b!207106))

(assert (= (and b!207106 (not res!173736)) b!207115))

(assert (= (and b!207115 (not res!173725)) b!207114))

(assert (= (and b!207114 (not res!173734)) b!207108))

(assert (= (and b!207108 (not res!173737)) b!207118))

(assert (= (and b!207118 res!173729) b!207105))

(assert (= (and b!207118 res!173728) b!207111))

(assert (= start!43632 b!207116))

(declare-fun m!318777 () Bool)

(assert (=> b!207119 m!318777))

(declare-fun m!318779 () Bool)

(assert (=> b!207119 m!318779))

(declare-fun m!318781 () Bool)

(assert (=> b!207119 m!318781))

(declare-fun m!318783 () Bool)

(assert (=> b!207119 m!318783))

(declare-fun m!318785 () Bool)

(assert (=> b!207116 m!318785))

(declare-fun m!318787 () Bool)

(assert (=> b!207105 m!318787))

(declare-fun m!318789 () Bool)

(assert (=> b!207117 m!318789))

(declare-fun m!318791 () Bool)

(assert (=> b!207117 m!318791))

(declare-fun m!318793 () Bool)

(assert (=> b!207114 m!318793))

(declare-fun m!318795 () Bool)

(assert (=> b!207118 m!318795))

(declare-fun m!318797 () Bool)

(assert (=> b!207118 m!318797))

(declare-fun m!318799 () Bool)

(assert (=> b!207118 m!318799))

(declare-fun m!318801 () Bool)

(assert (=> b!207118 m!318801))

(declare-fun m!318803 () Bool)

(assert (=> b!207118 m!318803))

(declare-fun m!318805 () Bool)

(assert (=> b!207118 m!318805))

(declare-fun m!318807 () Bool)

(assert (=> b!207118 m!318807))

(declare-fun m!318809 () Bool)

(assert (=> b!207118 m!318809))

(declare-fun m!318811 () Bool)

(assert (=> b!207118 m!318811))

(declare-fun m!318813 () Bool)

(assert (=> b!207118 m!318813))

(declare-fun m!318815 () Bool)

(assert (=> b!207118 m!318815))

(declare-fun m!318817 () Bool)

(assert (=> b!207118 m!318817))

(declare-fun m!318819 () Bool)

(assert (=> b!207118 m!318819))

(declare-fun m!318821 () Bool)

(assert (=> b!207113 m!318821))

(declare-fun m!318823 () Bool)

(assert (=> b!207106 m!318823))

(declare-fun m!318825 () Bool)

(assert (=> start!43632 m!318825))

(declare-fun m!318827 () Bool)

(assert (=> b!207107 m!318827))

(declare-fun m!318829 () Bool)

(assert (=> b!207110 m!318829))

(assert (=> b!207120 m!318789))

(assert (=> b!207120 m!318791))

(declare-fun m!318831 () Bool)

(assert (=> b!207120 m!318831))

(declare-fun m!318833 () Bool)

(assert (=> b!207112 m!318833))

(declare-fun m!318835 () Bool)

(assert (=> b!207109 m!318835))

(assert (=> b!207109 m!318835))

(declare-fun m!318837 () Bool)

(assert (=> b!207109 m!318837))

(assert (=> b!207108 m!318827))

(push 1)

(assert (not b!207109))

(assert (not b!207116))

(assert (not b!207119))

(assert (not b!207108))

(assert (not b!207113))

(assert (not b!207105))

(assert (not b!207112))

(assert (not b!207120))

(assert (not b!207117))

(assert (not b!207110))

(assert (not b!207107))

(assert (not b!207118))

(assert (not b!207106))

(assert (not b!207114))

(assert (not start!43632))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

