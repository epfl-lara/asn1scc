; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52204 () Bool)

(assert start!52204)

(declare-fun res!200628 () Bool)

(declare-fun e!166580 () Bool)

(assert (=> start!52204 (=> (not res!200628) (not e!166580))))

(declare-fun nBits!288 () (_ BitVec 64))

(assert (=> start!52204 (= res!200628 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52204 e!166580))

(assert (=> start!52204 true))

(declare-datatypes ((array!13135 0))(
  ( (array!13136 (arr!6739 (Array (_ BitVec 32) (_ BitVec 8))) (size!5752 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10426 0))(
  ( (BitStream!10427 (buf!6212 array!13135) (currentByte!11566 (_ BitVec 32)) (currentBit!11561 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10426)

(declare-fun e!166579 () Bool)

(declare-fun inv!12 (BitStream!10426) Bool)

(assert (=> start!52204 (and (inv!12 thiss!982) e!166579)))

(declare-fun b!240324 () Bool)

(declare-fun e!166577 () Bool)

(declare-datatypes ((tuple2!20364 0))(
  ( (tuple2!20365 (_1!11104 BitStream!10426) (_2!11104 Bool)) )
))
(declare-fun lt!375368 () tuple2!20364)

(declare-datatypes ((tuple2!20366 0))(
  ( (tuple2!20367 (_1!11105 BitStream!10426) (_2!11105 BitStream!10426)) )
))
(declare-fun lt!375369 () tuple2!20366)

(assert (=> b!240324 (= e!166577 (not (or (not (_2!11104 lt!375368)) (not (= (_1!11104 lt!375368) (_2!11105 lt!375369))))))))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10426 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20364)

(assert (=> b!240324 (= lt!375368 (checkBitsLoopPure!0 (_1!11105 lt!375369) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!17605 0))(
  ( (Unit!17606) )
))
(declare-datatypes ((tuple2!20368 0))(
  ( (tuple2!20369 (_1!11106 Unit!17605) (_2!11106 BitStream!10426)) )
))
(declare-fun lt!375371 () tuple2!20368)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240324 (validate_offset_bits!1 ((_ sign_extend 32) (size!5752 (buf!6212 (_2!11106 lt!375371)))) ((_ sign_extend 32) (currentByte!11566 thiss!982)) ((_ sign_extend 32) (currentBit!11561 thiss!982)) nBits!288)))

(declare-fun lt!375373 () Unit!17605)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10426 array!13135 (_ BitVec 64)) Unit!17605)

(assert (=> b!240324 (= lt!375373 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6212 (_2!11106 lt!375371)) nBits!288))))

(declare-fun reader!0 (BitStream!10426 BitStream!10426) tuple2!20366)

(assert (=> b!240324 (= lt!375369 (reader!0 thiss!982 (_2!11106 lt!375371)))))

(declare-fun b!240325 () Bool)

(declare-fun array_inv!5493 (array!13135) Bool)

(assert (=> b!240325 (= e!166579 (array_inv!5493 (buf!6212 thiss!982)))))

(declare-fun b!240326 () Bool)

(declare-fun res!200626 () Bool)

(assert (=> b!240326 (=> (not res!200626) (not e!166577))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240326 (= res!200626 (= (bitIndex!0 (size!5752 (buf!6212 (_2!11106 lt!375371))) (currentByte!11566 (_2!11106 lt!375371)) (currentBit!11561 (_2!11106 lt!375371))) (bvadd (bitIndex!0 (size!5752 (buf!6212 thiss!982)) (currentByte!11566 thiss!982) (currentBit!11561 thiss!982)) nBits!288)))))

(declare-fun b!240327 () Bool)

(assert (=> b!240327 (= e!166580 (not true))))

(declare-fun lt!375370 () tuple2!20366)

(assert (=> b!240327 (= lt!375370 (reader!0 thiss!982 (_2!11106 lt!375371)))))

(declare-fun lt!375372 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10426 BitStream!10426) Bool)

(assert (=> b!240327 (= lt!375372 (isPrefixOf!0 thiss!982 (_2!11106 lt!375371)))))

(declare-fun lt!375375 () (_ BitVec 64))

(assert (=> b!240327 (= lt!375375 (bitIndex!0 (size!5752 (buf!6212 (_2!11106 lt!375371))) (currentByte!11566 (_2!11106 lt!375371)) (currentBit!11561 (_2!11106 lt!375371))))))

(declare-fun lt!375374 () (_ BitVec 64))

(assert (=> b!240327 (= lt!375374 (bitIndex!0 (size!5752 (buf!6212 thiss!982)) (currentByte!11566 thiss!982) (currentBit!11561 thiss!982)))))

(assert (=> b!240327 e!166577))

(declare-fun res!200624 () Bool)

(assert (=> b!240327 (=> (not res!200624) (not e!166577))))

(assert (=> b!240327 (= res!200624 (= (size!5752 (buf!6212 thiss!982)) (size!5752 (buf!6212 (_2!11106 lt!375371)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10426 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20368)

(assert (=> b!240327 (= lt!375371 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240328 () Bool)

(declare-fun res!200627 () Bool)

(assert (=> b!240328 (=> (not res!200627) (not e!166580))))

(assert (=> b!240328 (= res!200627 (validate_offset_bits!1 ((_ sign_extend 32) (size!5752 (buf!6212 thiss!982))) ((_ sign_extend 32) (currentByte!11566 thiss!982)) ((_ sign_extend 32) (currentBit!11561 thiss!982)) nBits!288))))

(declare-fun b!240329 () Bool)

(declare-fun res!200625 () Bool)

(assert (=> b!240329 (=> (not res!200625) (not e!166577))))

(assert (=> b!240329 (= res!200625 (isPrefixOf!0 thiss!982 (_2!11106 lt!375371)))))

(assert (= (and start!52204 res!200628) b!240328))

(assert (= (and b!240328 res!200627) b!240327))

(assert (= (and b!240327 res!200624) b!240326))

(assert (= (and b!240326 res!200626) b!240329))

(assert (= (and b!240329 res!200625) b!240324))

(assert (= start!52204 b!240325))

(declare-fun m!362793 () Bool)

(assert (=> b!240324 m!362793))

(declare-fun m!362795 () Bool)

(assert (=> b!240324 m!362795))

(declare-fun m!362797 () Bool)

(assert (=> b!240324 m!362797))

(declare-fun m!362799 () Bool)

(assert (=> b!240324 m!362799))

(declare-fun m!362801 () Bool)

(assert (=> b!240327 m!362801))

(declare-fun m!362803 () Bool)

(assert (=> b!240327 m!362803))

(declare-fun m!362805 () Bool)

(assert (=> b!240327 m!362805))

(assert (=> b!240327 m!362799))

(declare-fun m!362807 () Bool)

(assert (=> b!240327 m!362807))

(assert (=> b!240326 m!362801))

(assert (=> b!240326 m!362803))

(assert (=> b!240329 m!362807))

(declare-fun m!362809 () Bool)

(assert (=> b!240328 m!362809))

(declare-fun m!362811 () Bool)

(assert (=> b!240325 m!362811))

(declare-fun m!362813 () Bool)

(assert (=> start!52204 m!362813))

(push 1)

(assert (not b!240325))

(assert (not start!52204))

(assert (not b!240327))

(assert (not b!240326))

(assert (not b!240328))

(assert (not b!240324))

(assert (not b!240329))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

