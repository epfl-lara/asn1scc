; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53118 () Bool)

(assert start!53118)

(declare-fun b!246508 () Bool)

(declare-fun e!170784 () Bool)

(declare-datatypes ((array!13446 0))(
  ( (array!13447 (arr!6882 (Array (_ BitVec 32) (_ BitVec 8))) (size!5895 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10712 0))(
  ( (BitStream!10713 (buf!6376 array!13446) (currentByte!11772 (_ BitVec 32)) (currentBit!11767 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10712)

(declare-fun array_inv!5636 (array!13446) Bool)

(assert (=> b!246508 (= e!170784 (array_inv!5636 (buf!6376 thiss!1005)))))

(declare-fun b!246509 () Bool)

(declare-fun res!206232 () Bool)

(declare-fun e!170789 () Bool)

(assert (=> b!246509 (=> (not res!206232) (not e!170789))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!246509 (= res!206232 (bvslt from!289 nBits!297))))

(declare-fun b!246510 () Bool)

(declare-fun e!170778 () Bool)

(declare-datatypes ((tuple2!21150 0))(
  ( (tuple2!21151 (_1!11497 BitStream!10712) (_2!11497 Bool)) )
))
(declare-fun lt!384557 () tuple2!21150)

(declare-fun lt!384537 () tuple2!21150)

(assert (=> b!246510 (= e!170778 (= (_2!11497 lt!384557) (_2!11497 lt!384537)))))

(declare-fun b!246511 () Bool)

(declare-fun res!206222 () Bool)

(declare-fun e!170786 () Bool)

(assert (=> b!246511 (=> (not res!206222) (not e!170786))))

(declare-datatypes ((Unit!17902 0))(
  ( (Unit!17903) )
))
(declare-datatypes ((tuple2!21152 0))(
  ( (tuple2!21153 (_1!11498 Unit!17902) (_2!11498 BitStream!10712)) )
))
(declare-fun lt!384555 () tuple2!21152)

(declare-fun isPrefixOf!0 (BitStream!10712 BitStream!10712) Bool)

(assert (=> b!246511 (= res!206222 (isPrefixOf!0 thiss!1005 (_2!11498 lt!384555)))))

(declare-fun b!246513 () Bool)

(declare-fun e!170788 () Bool)

(declare-fun e!170781 () Bool)

(assert (=> b!246513 (= e!170788 e!170781)))

(declare-fun res!206228 () Bool)

(assert (=> b!246513 (=> res!206228 e!170781)))

(declare-fun lt!384541 () tuple2!21152)

(assert (=> b!246513 (= res!206228 (not (= (size!5895 (buf!6376 thiss!1005)) (size!5895 (buf!6376 (_2!11498 lt!384541))))))))

(declare-fun lt!384535 () tuple2!21150)

(declare-fun lt!384540 () tuple2!21150)

(declare-datatypes ((tuple2!21154 0))(
  ( (tuple2!21155 (_1!11499 BitStream!10712) (_2!11499 BitStream!10712)) )
))
(declare-fun lt!384545 () tuple2!21154)

(assert (=> b!246513 (and (= (_2!11497 lt!384535) (_2!11497 lt!384540)) (= (_1!11497 lt!384535) (_2!11499 lt!384545)))))

(declare-fun b!246514 () Bool)

(declare-fun e!170782 () Bool)

(assert (=> b!246514 (= e!170786 e!170782)))

(declare-fun res!206225 () Bool)

(assert (=> b!246514 (=> (not res!206225) (not e!170782))))

(declare-fun lt!384550 () tuple2!21150)

(declare-fun bit!26 () Bool)

(assert (=> b!246514 (= res!206225 (and (= (_2!11497 lt!384550) bit!26) (= (_1!11497 lt!384550) (_2!11498 lt!384555))))))

(declare-fun readBitPure!0 (BitStream!10712) tuple2!21150)

(declare-fun readerFrom!0 (BitStream!10712 (_ BitVec 32) (_ BitVec 32)) BitStream!10712)

(assert (=> b!246514 (= lt!384550 (readBitPure!0 (readerFrom!0 (_2!11498 lt!384555) (currentBit!11767 thiss!1005) (currentByte!11772 thiss!1005))))))

(declare-fun b!246515 () Bool)

(declare-fun res!206233 () Bool)

(assert (=> b!246515 (=> (not res!206233) (not e!170789))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246515 (= res!206233 (validate_offset_bits!1 ((_ sign_extend 32) (size!5895 (buf!6376 thiss!1005))) ((_ sign_extend 32) (currentByte!11772 thiss!1005)) ((_ sign_extend 32) (currentBit!11767 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!246516 () Bool)

(declare-fun lt!384558 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246516 (= e!170782 (= (bitIndex!0 (size!5895 (buf!6376 (_1!11497 lt!384550))) (currentByte!11772 (_1!11497 lt!384550)) (currentBit!11767 (_1!11497 lt!384550))) lt!384558))))

(declare-fun b!246517 () Bool)

(declare-fun e!170785 () Bool)

(assert (=> b!246517 (= e!170785 e!170786)))

(declare-fun res!206223 () Bool)

(assert (=> b!246517 (=> (not res!206223) (not e!170786))))

(declare-fun lt!384547 () (_ BitVec 64))

(assert (=> b!246517 (= res!206223 (= lt!384558 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!384547)))))

(assert (=> b!246517 (= lt!384558 (bitIndex!0 (size!5895 (buf!6376 (_2!11498 lt!384555))) (currentByte!11772 (_2!11498 lt!384555)) (currentBit!11767 (_2!11498 lt!384555))))))

(assert (=> b!246517 (= lt!384547 (bitIndex!0 (size!5895 (buf!6376 thiss!1005)) (currentByte!11772 thiss!1005) (currentBit!11767 thiss!1005)))))

(declare-fun b!246518 () Bool)

(declare-fun res!206221 () Bool)

(declare-fun e!170780 () Bool)

(assert (=> b!246518 (=> (not res!206221) (not e!170780))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246518 (= res!206221 (invariant!0 (currentBit!11767 thiss!1005) (currentByte!11772 thiss!1005) (size!5895 (buf!6376 (_2!11498 lt!384555)))))))

(declare-fun b!246519 () Bool)

(declare-fun e!170783 () Bool)

(declare-fun e!170779 () Bool)

(assert (=> b!246519 (= e!170783 e!170779)))

(declare-fun res!206235 () Bool)

(assert (=> b!246519 (=> (not res!206235) (not e!170779))))

(declare-fun lt!384551 () (_ BitVec 64))

(assert (=> b!246519 (= res!206235 (= (bitIndex!0 (size!5895 (buf!6376 (_2!11498 lt!384541))) (currentByte!11772 (_2!11498 lt!384541)) (currentBit!11767 (_2!11498 lt!384541))) (bvadd (bitIndex!0 (size!5895 (buf!6376 (_2!11498 lt!384555))) (currentByte!11772 (_2!11498 lt!384555)) (currentBit!11767 (_2!11498 lt!384555))) lt!384551)))))

(assert (=> b!246519 (= lt!384551 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246520 () Bool)

(assert (=> b!246520 (= e!170780 (invariant!0 (currentBit!11767 thiss!1005) (currentByte!11772 thiss!1005) (size!5895 (buf!6376 (_2!11498 lt!384541)))))))

(declare-fun res!206227 () Bool)

(assert (=> start!53118 (=> (not res!206227) (not e!170789))))

(assert (=> start!53118 (= res!206227 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53118 e!170789))

(assert (=> start!53118 true))

(declare-fun inv!12 (BitStream!10712) Bool)

(assert (=> start!53118 (and (inv!12 thiss!1005) e!170784)))

(declare-fun b!246512 () Bool)

(assert (=> b!246512 (= e!170789 (not e!170788))))

(declare-fun res!206229 () Bool)

(assert (=> b!246512 (=> res!206229 e!170788)))

(declare-fun lt!384553 () tuple2!21154)

(assert (=> b!246512 (= res!206229 (not (= (_1!11497 lt!384540) (_2!11499 lt!384553))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10712 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21150)

(assert (=> b!246512 (= lt!384540 (checkBitsLoopPure!0 (_1!11499 lt!384553) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384542 () (_ BitVec 64))

(assert (=> b!246512 (validate_offset_bits!1 ((_ sign_extend 32) (size!5895 (buf!6376 (_2!11498 lt!384541)))) ((_ sign_extend 32) (currentByte!11772 (_2!11498 lt!384555))) ((_ sign_extend 32) (currentBit!11767 (_2!11498 lt!384555))) lt!384542)))

(declare-fun lt!384546 () Unit!17902)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10712 array!13446 (_ BitVec 64)) Unit!17902)

(assert (=> b!246512 (= lt!384546 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11498 lt!384555) (buf!6376 (_2!11498 lt!384541)) lt!384542))))

(assert (=> b!246512 (= lt!384535 (checkBitsLoopPure!0 (_1!11499 lt!384545) nBits!297 bit!26 from!289))))

(assert (=> b!246512 (validate_offset_bits!1 ((_ sign_extend 32) (size!5895 (buf!6376 (_2!11498 lt!384541)))) ((_ sign_extend 32) (currentByte!11772 thiss!1005)) ((_ sign_extend 32) (currentBit!11767 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!384538 () Unit!17902)

(assert (=> b!246512 (= lt!384538 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6376 (_2!11498 lt!384541)) (bvsub nBits!297 from!289)))))

(assert (=> b!246512 (= (_2!11497 (readBitPure!0 (_1!11499 lt!384545))) bit!26)))

(declare-fun reader!0 (BitStream!10712 BitStream!10712) tuple2!21154)

(assert (=> b!246512 (= lt!384553 (reader!0 (_2!11498 lt!384555) (_2!11498 lt!384541)))))

(assert (=> b!246512 (= lt!384545 (reader!0 thiss!1005 (_2!11498 lt!384541)))))

(assert (=> b!246512 e!170778))

(declare-fun res!206230 () Bool)

(assert (=> b!246512 (=> (not res!206230) (not e!170778))))

(assert (=> b!246512 (= res!206230 (= (bitIndex!0 (size!5895 (buf!6376 (_1!11497 lt!384557))) (currentByte!11772 (_1!11497 lt!384557)) (currentBit!11767 (_1!11497 lt!384557))) (bitIndex!0 (size!5895 (buf!6376 (_1!11497 lt!384537))) (currentByte!11772 (_1!11497 lt!384537)) (currentBit!11767 (_1!11497 lt!384537)))))))

(declare-fun lt!384552 () Unit!17902)

(declare-fun lt!384536 () BitStream!10712)

(declare-fun readBitPrefixLemma!0 (BitStream!10712 BitStream!10712) Unit!17902)

(assert (=> b!246512 (= lt!384552 (readBitPrefixLemma!0 lt!384536 (_2!11498 lt!384541)))))

(assert (=> b!246512 (= lt!384537 (readBitPure!0 (BitStream!10713 (buf!6376 (_2!11498 lt!384541)) (currentByte!11772 thiss!1005) (currentBit!11767 thiss!1005))))))

(assert (=> b!246512 (= lt!384557 (readBitPure!0 lt!384536))))

(assert (=> b!246512 (= lt!384536 (BitStream!10713 (buf!6376 (_2!11498 lt!384555)) (currentByte!11772 thiss!1005) (currentBit!11767 thiss!1005)))))

(assert (=> b!246512 e!170780))

(declare-fun res!206220 () Bool)

(assert (=> b!246512 (=> (not res!206220) (not e!170780))))

(assert (=> b!246512 (= res!206220 (isPrefixOf!0 thiss!1005 (_2!11498 lt!384541)))))

(declare-fun lt!384556 () Unit!17902)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10712 BitStream!10712 BitStream!10712) Unit!17902)

(assert (=> b!246512 (= lt!384556 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11498 lt!384555) (_2!11498 lt!384541)))))

(assert (=> b!246512 e!170783))

(declare-fun res!206231 () Bool)

(assert (=> b!246512 (=> (not res!206231) (not e!170783))))

(assert (=> b!246512 (= res!206231 (= (size!5895 (buf!6376 (_2!11498 lt!384555))) (size!5895 (buf!6376 (_2!11498 lt!384541)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10712 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21152)

(assert (=> b!246512 (= lt!384541 (appendNBitsLoop!0 (_2!11498 lt!384555) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246512 (validate_offset_bits!1 ((_ sign_extend 32) (size!5895 (buf!6376 (_2!11498 lt!384555)))) ((_ sign_extend 32) (currentByte!11772 (_2!11498 lt!384555))) ((_ sign_extend 32) (currentBit!11767 (_2!11498 lt!384555))) lt!384542)))

(assert (=> b!246512 (= lt!384542 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!384539 () Unit!17902)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10712 BitStream!10712 (_ BitVec 64) (_ BitVec 64)) Unit!17902)

(assert (=> b!246512 (= lt!384539 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11498 lt!384555) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!246512 e!170785))

(declare-fun res!206234 () Bool)

(assert (=> b!246512 (=> (not res!206234) (not e!170785))))

(assert (=> b!246512 (= res!206234 (= (size!5895 (buf!6376 thiss!1005)) (size!5895 (buf!6376 (_2!11498 lt!384555)))))))

(declare-fun appendBit!0 (BitStream!10712 Bool) tuple2!21152)

(assert (=> b!246512 (= lt!384555 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246521 () Bool)

(assert (=> b!246521 (= e!170781 true)))

(declare-fun lt!384554 () (_ BitVec 64))

(assert (=> b!246521 (= lt!384554 (bitIndex!0 (size!5895 (buf!6376 (_2!11498 lt!384541))) (currentByte!11772 (_2!11498 lt!384541)) (currentBit!11767 (_2!11498 lt!384541))))))

(declare-fun lt!384548 () (_ BitVec 64))

(assert (=> b!246521 (= lt!384548 (bitIndex!0 (size!5895 (buf!6376 thiss!1005)) (currentByte!11772 thiss!1005) (currentBit!11767 thiss!1005)))))

(declare-fun b!246522 () Bool)

(declare-fun res!206224 () Bool)

(assert (=> b!246522 (=> (not res!206224) (not e!170779))))

(assert (=> b!246522 (= res!206224 (isPrefixOf!0 (_2!11498 lt!384555) (_2!11498 lt!384541)))))

(declare-fun b!246523 () Bool)

(declare-fun res!206226 () Bool)

(assert (=> b!246523 (=> res!206226 e!170788)))

(declare-fun withMovedBitIndex!0 (BitStream!10712 (_ BitVec 64)) BitStream!10712)

(assert (=> b!246523 (= res!206226 (not (= (_1!11499 lt!384553) (withMovedBitIndex!0 (_1!11499 lt!384545) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246524 () Bool)

(declare-fun lt!384549 () tuple2!21150)

(declare-fun lt!384544 () tuple2!21154)

(assert (=> b!246524 (= e!170779 (not (or (not (_2!11497 lt!384549)) (not (= (_1!11497 lt!384549) (_2!11499 lt!384544))))))))

(assert (=> b!246524 (= lt!384549 (checkBitsLoopPure!0 (_1!11499 lt!384544) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246524 (validate_offset_bits!1 ((_ sign_extend 32) (size!5895 (buf!6376 (_2!11498 lt!384541)))) ((_ sign_extend 32) (currentByte!11772 (_2!11498 lt!384555))) ((_ sign_extend 32) (currentBit!11767 (_2!11498 lt!384555))) lt!384551)))

(declare-fun lt!384543 () Unit!17902)

(assert (=> b!246524 (= lt!384543 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11498 lt!384555) (buf!6376 (_2!11498 lt!384541)) lt!384551))))

(assert (=> b!246524 (= lt!384544 (reader!0 (_2!11498 lt!384555) (_2!11498 lt!384541)))))

(assert (= (and start!53118 res!206227) b!246515))

(assert (= (and b!246515 res!206233) b!246509))

(assert (= (and b!246509 res!206232) b!246512))

(assert (= (and b!246512 res!206234) b!246517))

(assert (= (and b!246517 res!206223) b!246511))

(assert (= (and b!246511 res!206222) b!246514))

(assert (= (and b!246514 res!206225) b!246516))

(assert (= (and b!246512 res!206231) b!246519))

(assert (= (and b!246519 res!206235) b!246522))

(assert (= (and b!246522 res!206224) b!246524))

(assert (= (and b!246512 res!206220) b!246518))

(assert (= (and b!246518 res!206221) b!246520))

(assert (= (and b!246512 res!206230) b!246510))

(assert (= (and b!246512 (not res!206229)) b!246523))

(assert (= (and b!246523 (not res!206226)) b!246513))

(assert (= (and b!246513 (not res!206228)) b!246521))

(assert (= start!53118 b!246508))

(declare-fun m!371775 () Bool)

(assert (=> b!246517 m!371775))

(declare-fun m!371777 () Bool)

(assert (=> b!246517 m!371777))

(declare-fun m!371779 () Bool)

(assert (=> b!246515 m!371779))

(declare-fun m!371781 () Bool)

(assert (=> b!246520 m!371781))

(declare-fun m!371783 () Bool)

(assert (=> b!246514 m!371783))

(assert (=> b!246514 m!371783))

(declare-fun m!371785 () Bool)

(assert (=> b!246514 m!371785))

(declare-fun m!371787 () Bool)

(assert (=> b!246511 m!371787))

(declare-fun m!371789 () Bool)

(assert (=> b!246524 m!371789))

(declare-fun m!371791 () Bool)

(assert (=> b!246524 m!371791))

(declare-fun m!371793 () Bool)

(assert (=> b!246524 m!371793))

(declare-fun m!371795 () Bool)

(assert (=> b!246524 m!371795))

(declare-fun m!371797 () Bool)

(assert (=> b!246518 m!371797))

(declare-fun m!371799 () Bool)

(assert (=> b!246512 m!371799))

(declare-fun m!371801 () Bool)

(assert (=> b!246512 m!371801))

(declare-fun m!371803 () Bool)

(assert (=> b!246512 m!371803))

(assert (=> b!246512 m!371795))

(declare-fun m!371805 () Bool)

(assert (=> b!246512 m!371805))

(declare-fun m!371807 () Bool)

(assert (=> b!246512 m!371807))

(declare-fun m!371809 () Bool)

(assert (=> b!246512 m!371809))

(declare-fun m!371811 () Bool)

(assert (=> b!246512 m!371811))

(declare-fun m!371813 () Bool)

(assert (=> b!246512 m!371813))

(declare-fun m!371815 () Bool)

(assert (=> b!246512 m!371815))

(declare-fun m!371817 () Bool)

(assert (=> b!246512 m!371817))

(declare-fun m!371819 () Bool)

(assert (=> b!246512 m!371819))

(declare-fun m!371821 () Bool)

(assert (=> b!246512 m!371821))

(declare-fun m!371823 () Bool)

(assert (=> b!246512 m!371823))

(declare-fun m!371825 () Bool)

(assert (=> b!246512 m!371825))

(declare-fun m!371827 () Bool)

(assert (=> b!246512 m!371827))

(declare-fun m!371829 () Bool)

(assert (=> b!246512 m!371829))

(declare-fun m!371831 () Bool)

(assert (=> b!246512 m!371831))

(declare-fun m!371833 () Bool)

(assert (=> b!246512 m!371833))

(declare-fun m!371835 () Bool)

(assert (=> b!246512 m!371835))

(declare-fun m!371837 () Bool)

(assert (=> start!53118 m!371837))

(declare-fun m!371839 () Bool)

(assert (=> b!246508 m!371839))

(declare-fun m!371841 () Bool)

(assert (=> b!246521 m!371841))

(assert (=> b!246521 m!371777))

(declare-fun m!371843 () Bool)

(assert (=> b!246516 m!371843))

(declare-fun m!371845 () Bool)

(assert (=> b!246523 m!371845))

(assert (=> b!246519 m!371841))

(assert (=> b!246519 m!371775))

(declare-fun m!371847 () Bool)

(assert (=> b!246522 m!371847))

(push 1)

(assert (not b!246518))

(assert (not b!246519))

(assert (not start!53118))

(assert (not b!246508))

(assert (not b!246524))

(assert (not b!246512))

(assert (not b!246520))

(assert (not b!246516))

(assert (not b!246523))

(assert (not b!246511))

(assert (not b!246517))

(assert (not b!246521))

(assert (not b!246514))

(assert (not b!246515))

(assert (not b!246522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

