; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52634 () Bool)

(assert start!52634)

(declare-fun b!243442 () Bool)

(declare-fun res!203395 () Bool)

(declare-fun e!168755 () Bool)

(assert (=> b!243442 (=> (not res!203395) (not e!168755))))

(declare-datatypes ((array!13346 0))(
  ( (array!13347 (arr!6838 (Array (_ BitVec 32) (_ BitVec 8))) (size!5851 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10624 0))(
  ( (BitStream!10625 (buf!6320 array!13346) (currentByte!11692 (_ BitVec 32)) (currentBit!11687 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10624)

(declare-datatypes ((Unit!17791 0))(
  ( (Unit!17792) )
))
(declare-datatypes ((tuple2!20862 0))(
  ( (tuple2!20863 (_1!11353 Unit!17791) (_2!11353 BitStream!10624)) )
))
(declare-fun lt!379363 () tuple2!20862)

(declare-fun isPrefixOf!0 (BitStream!10624 BitStream!10624) Bool)

(assert (=> b!243442 (= res!203395 (isPrefixOf!0 thiss!1005 (_2!11353 lt!379363)))))

(declare-fun b!243443 () Bool)

(declare-fun e!168754 () Bool)

(declare-fun array_inv!5592 (array!13346) Bool)

(assert (=> b!243443 (= e!168754 (array_inv!5592 (buf!6320 thiss!1005)))))

(declare-fun b!243444 () Bool)

(declare-fun res!203394 () Bool)

(declare-fun e!168757 () Bool)

(assert (=> b!243444 (=> (not res!203394) (not e!168757))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243444 (= res!203394 (validate_offset_bits!1 ((_ sign_extend 32) (size!5851 (buf!6320 thiss!1005))) ((_ sign_extend 32) (currentByte!11692 thiss!1005)) ((_ sign_extend 32) (currentBit!11687 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!243445 () Bool)

(declare-fun res!203390 () Bool)

(declare-fun e!168760 () Bool)

(assert (=> b!243445 (=> (not res!203390) (not e!168760))))

(declare-fun lt!379362 () tuple2!20862)

(assert (=> b!243445 (= res!203390 (isPrefixOf!0 (_2!11353 lt!379363) (_2!11353 lt!379362)))))

(declare-fun b!243446 () Bool)

(declare-fun res!203396 () Bool)

(assert (=> b!243446 (=> (not res!203396) (not e!168757))))

(assert (=> b!243446 (= res!203396 (bvslt from!289 nBits!297))))

(declare-fun b!243447 () Bool)

(declare-datatypes ((tuple2!20864 0))(
  ( (tuple2!20865 (_1!11354 BitStream!10624) (_2!11354 Bool)) )
))
(declare-fun lt!379364 () tuple2!20864)

(declare-datatypes ((tuple2!20866 0))(
  ( (tuple2!20867 (_1!11355 BitStream!10624) (_2!11355 BitStream!10624)) )
))
(declare-fun lt!379352 () tuple2!20866)

(assert (=> b!243447 (= e!168760 (not (or (not (_2!11354 lt!379364)) (not (= (_1!11354 lt!379364) (_2!11355 lt!379352))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10624 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20864)

(assert (=> b!243447 (= lt!379364 (checkBitsLoopPure!0 (_1!11355 lt!379352) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!379365 () (_ BitVec 64))

(assert (=> b!243447 (validate_offset_bits!1 ((_ sign_extend 32) (size!5851 (buf!6320 (_2!11353 lt!379362)))) ((_ sign_extend 32) (currentByte!11692 (_2!11353 lt!379363))) ((_ sign_extend 32) (currentBit!11687 (_2!11353 lt!379363))) lt!379365)))

(declare-fun lt!379357 () Unit!17791)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10624 array!13346 (_ BitVec 64)) Unit!17791)

(assert (=> b!243447 (= lt!379357 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11353 lt!379363) (buf!6320 (_2!11353 lt!379362)) lt!379365))))

(declare-fun reader!0 (BitStream!10624 BitStream!10624) tuple2!20866)

(assert (=> b!243447 (= lt!379352 (reader!0 (_2!11353 lt!379363) (_2!11353 lt!379362)))))

(declare-fun b!243448 () Bool)

(declare-fun e!168756 () Bool)

(declare-fun lt!379353 () tuple2!20864)

(declare-fun lt!379356 () tuple2!20864)

(assert (=> b!243448 (= e!168756 (= (_2!11354 lt!379353) (_2!11354 lt!379356)))))

(declare-fun b!243449 () Bool)

(declare-fun e!168753 () Bool)

(declare-fun lt!379367 () tuple2!20864)

(declare-fun lt!379360 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243449 (= e!168753 (= (bitIndex!0 (size!5851 (buf!6320 (_1!11354 lt!379367))) (currentByte!11692 (_1!11354 lt!379367)) (currentBit!11687 (_1!11354 lt!379367))) lt!379360))))

(declare-fun res!203386 () Bool)

(assert (=> start!52634 (=> (not res!203386) (not e!168757))))

(assert (=> start!52634 (= res!203386 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52634 e!168757))

(assert (=> start!52634 true))

(declare-fun inv!12 (BitStream!10624) Bool)

(assert (=> start!52634 (and (inv!12 thiss!1005) e!168754)))

(declare-fun b!243450 () Bool)

(assert (=> b!243450 (= e!168755 e!168753)))

(declare-fun res!203388 () Bool)

(assert (=> b!243450 (=> (not res!203388) (not e!168753))))

(assert (=> b!243450 (= res!203388 (and (= (_2!11354 lt!379367) bit!26) (= (_1!11354 lt!379367) (_2!11353 lt!379363))))))

(declare-fun readBitPure!0 (BitStream!10624) tuple2!20864)

(declare-fun readerFrom!0 (BitStream!10624 (_ BitVec 32) (_ BitVec 32)) BitStream!10624)

(assert (=> b!243450 (= lt!379367 (readBitPure!0 (readerFrom!0 (_2!11353 lt!379363) (currentBit!11687 thiss!1005) (currentByte!11692 thiss!1005))))))

(declare-fun b!243451 () Bool)

(assert (=> b!243451 (= e!168757 (not true))))

(assert (=> b!243451 (validate_offset_bits!1 ((_ sign_extend 32) (size!5851 (buf!6320 (_2!11353 lt!379362)))) ((_ sign_extend 32) (currentByte!11692 thiss!1005)) ((_ sign_extend 32) (currentBit!11687 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!379366 () Unit!17791)

(assert (=> b!243451 (= lt!379366 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6320 (_2!11353 lt!379362)) (bvsub nBits!297 from!289)))))

(declare-fun lt!379351 () tuple2!20866)

(assert (=> b!243451 (= (_2!11354 (readBitPure!0 (_1!11355 lt!379351))) bit!26)))

(declare-fun lt!379361 () tuple2!20866)

(assert (=> b!243451 (= lt!379361 (reader!0 (_2!11353 lt!379363) (_2!11353 lt!379362)))))

(assert (=> b!243451 (= lt!379351 (reader!0 thiss!1005 (_2!11353 lt!379362)))))

(assert (=> b!243451 e!168756))

(declare-fun res!203385 () Bool)

(assert (=> b!243451 (=> (not res!203385) (not e!168756))))

(assert (=> b!243451 (= res!203385 (= (bitIndex!0 (size!5851 (buf!6320 (_1!11354 lt!379353))) (currentByte!11692 (_1!11354 lt!379353)) (currentBit!11687 (_1!11354 lt!379353))) (bitIndex!0 (size!5851 (buf!6320 (_1!11354 lt!379356))) (currentByte!11692 (_1!11354 lt!379356)) (currentBit!11687 (_1!11354 lt!379356)))))))

(declare-fun lt!379354 () Unit!17791)

(declare-fun lt!379358 () BitStream!10624)

(declare-fun readBitPrefixLemma!0 (BitStream!10624 BitStream!10624) Unit!17791)

(assert (=> b!243451 (= lt!379354 (readBitPrefixLemma!0 lt!379358 (_2!11353 lt!379362)))))

(assert (=> b!243451 (= lt!379356 (readBitPure!0 (BitStream!10625 (buf!6320 (_2!11353 lt!379362)) (currentByte!11692 thiss!1005) (currentBit!11687 thiss!1005))))))

(assert (=> b!243451 (= lt!379353 (readBitPure!0 lt!379358))))

(assert (=> b!243451 (= lt!379358 (BitStream!10625 (buf!6320 (_2!11353 lt!379363)) (currentByte!11692 thiss!1005) (currentBit!11687 thiss!1005)))))

(declare-fun e!168761 () Bool)

(assert (=> b!243451 e!168761))

(declare-fun res!203391 () Bool)

(assert (=> b!243451 (=> (not res!203391) (not e!168761))))

(assert (=> b!243451 (= res!203391 (isPrefixOf!0 thiss!1005 (_2!11353 lt!379362)))))

(declare-fun lt!379368 () Unit!17791)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10624 BitStream!10624 BitStream!10624) Unit!17791)

(assert (=> b!243451 (= lt!379368 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11353 lt!379363) (_2!11353 lt!379362)))))

(declare-fun e!168752 () Bool)

(assert (=> b!243451 e!168752))

(declare-fun res!203393 () Bool)

(assert (=> b!243451 (=> (not res!203393) (not e!168752))))

(assert (=> b!243451 (= res!203393 (= (size!5851 (buf!6320 (_2!11353 lt!379363))) (size!5851 (buf!6320 (_2!11353 lt!379362)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10624 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20862)

(assert (=> b!243451 (= lt!379362 (appendNBitsLoop!0 (_2!11353 lt!379363) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243451 (validate_offset_bits!1 ((_ sign_extend 32) (size!5851 (buf!6320 (_2!11353 lt!379363)))) ((_ sign_extend 32) (currentByte!11692 (_2!11353 lt!379363))) ((_ sign_extend 32) (currentBit!11687 (_2!11353 lt!379363))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!379359 () Unit!17791)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10624 BitStream!10624 (_ BitVec 64) (_ BitVec 64)) Unit!17791)

(assert (=> b!243451 (= lt!379359 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11353 lt!379363) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168759 () Bool)

(assert (=> b!243451 e!168759))

(declare-fun res!203389 () Bool)

(assert (=> b!243451 (=> (not res!203389) (not e!168759))))

(assert (=> b!243451 (= res!203389 (= (size!5851 (buf!6320 thiss!1005)) (size!5851 (buf!6320 (_2!11353 lt!379363)))))))

(declare-fun appendBit!0 (BitStream!10624 Bool) tuple2!20862)

(assert (=> b!243451 (= lt!379363 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243452 () Bool)

(assert (=> b!243452 (= e!168759 e!168755)))

(declare-fun res!203387 () Bool)

(assert (=> b!243452 (=> (not res!203387) (not e!168755))))

(declare-fun lt!379355 () (_ BitVec 64))

(assert (=> b!243452 (= res!203387 (= lt!379360 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!379355)))))

(assert (=> b!243452 (= lt!379360 (bitIndex!0 (size!5851 (buf!6320 (_2!11353 lt!379363))) (currentByte!11692 (_2!11353 lt!379363)) (currentBit!11687 (_2!11353 lt!379363))))))

(assert (=> b!243452 (= lt!379355 (bitIndex!0 (size!5851 (buf!6320 thiss!1005)) (currentByte!11692 thiss!1005) (currentBit!11687 thiss!1005)))))

(declare-fun b!243453 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243453 (= e!168761 (invariant!0 (currentBit!11687 thiss!1005) (currentByte!11692 thiss!1005) (size!5851 (buf!6320 (_2!11353 lt!379362)))))))

(declare-fun b!243454 () Bool)

(declare-fun res!203392 () Bool)

(assert (=> b!243454 (=> (not res!203392) (not e!168761))))

(assert (=> b!243454 (= res!203392 (invariant!0 (currentBit!11687 thiss!1005) (currentByte!11692 thiss!1005) (size!5851 (buf!6320 (_2!11353 lt!379363)))))))

(declare-fun b!243455 () Bool)

(assert (=> b!243455 (= e!168752 e!168760)))

(declare-fun res!203397 () Bool)

(assert (=> b!243455 (=> (not res!203397) (not e!168760))))

(assert (=> b!243455 (= res!203397 (= (bitIndex!0 (size!5851 (buf!6320 (_2!11353 lt!379362))) (currentByte!11692 (_2!11353 lt!379362)) (currentBit!11687 (_2!11353 lt!379362))) (bvadd (bitIndex!0 (size!5851 (buf!6320 (_2!11353 lt!379363))) (currentByte!11692 (_2!11353 lt!379363)) (currentBit!11687 (_2!11353 lt!379363))) lt!379365)))))

(assert (=> b!243455 (= lt!379365 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (= (and start!52634 res!203386) b!243444))

(assert (= (and b!243444 res!203394) b!243446))

(assert (= (and b!243446 res!203396) b!243451))

(assert (= (and b!243451 res!203389) b!243452))

(assert (= (and b!243452 res!203387) b!243442))

(assert (= (and b!243442 res!203395) b!243450))

(assert (= (and b!243450 res!203388) b!243449))

(assert (= (and b!243451 res!203393) b!243455))

(assert (= (and b!243455 res!203397) b!243445))

(assert (= (and b!243445 res!203390) b!243447))

(assert (= (and b!243451 res!203391) b!243454))

(assert (= (and b!243454 res!203392) b!243453))

(assert (= (and b!243451 res!203385) b!243448))

(assert (= start!52634 b!243443))

(declare-fun m!366785 () Bool)

(assert (=> b!243443 m!366785))

(declare-fun m!366787 () Bool)

(assert (=> b!243455 m!366787))

(declare-fun m!366789 () Bool)

(assert (=> b!243455 m!366789))

(declare-fun m!366791 () Bool)

(assert (=> b!243444 m!366791))

(declare-fun m!366793 () Bool)

(assert (=> b!243445 m!366793))

(declare-fun m!366795 () Bool)

(assert (=> b!243442 m!366795))

(declare-fun m!366797 () Bool)

(assert (=> b!243451 m!366797))

(declare-fun m!366799 () Bool)

(assert (=> b!243451 m!366799))

(declare-fun m!366801 () Bool)

(assert (=> b!243451 m!366801))

(declare-fun m!366803 () Bool)

(assert (=> b!243451 m!366803))

(declare-fun m!366805 () Bool)

(assert (=> b!243451 m!366805))

(declare-fun m!366807 () Bool)

(assert (=> b!243451 m!366807))

(declare-fun m!366809 () Bool)

(assert (=> b!243451 m!366809))

(declare-fun m!366811 () Bool)

(assert (=> b!243451 m!366811))

(declare-fun m!366813 () Bool)

(assert (=> b!243451 m!366813))

(declare-fun m!366815 () Bool)

(assert (=> b!243451 m!366815))

(declare-fun m!366817 () Bool)

(assert (=> b!243451 m!366817))

(declare-fun m!366819 () Bool)

(assert (=> b!243451 m!366819))

(declare-fun m!366821 () Bool)

(assert (=> b!243451 m!366821))

(declare-fun m!366823 () Bool)

(assert (=> b!243451 m!366823))

(declare-fun m!366825 () Bool)

(assert (=> b!243451 m!366825))

(declare-fun m!366827 () Bool)

(assert (=> b!243451 m!366827))

(declare-fun m!366829 () Bool)

(assert (=> b!243449 m!366829))

(assert (=> b!243452 m!366789))

(declare-fun m!366831 () Bool)

(assert (=> b!243452 m!366831))

(declare-fun m!366833 () Bool)

(assert (=> b!243454 m!366833))

(declare-fun m!366835 () Bool)

(assert (=> start!52634 m!366835))

(declare-fun m!366837 () Bool)

(assert (=> b!243453 m!366837))

(declare-fun m!366839 () Bool)

(assert (=> b!243450 m!366839))

(assert (=> b!243450 m!366839))

(declare-fun m!366841 () Bool)

(assert (=> b!243450 m!366841))

(declare-fun m!366843 () Bool)

(assert (=> b!243447 m!366843))

(declare-fun m!366845 () Bool)

(assert (=> b!243447 m!366845))

(declare-fun m!366847 () Bool)

(assert (=> b!243447 m!366847))

(assert (=> b!243447 m!366827))

(push 1)

(assert (not b!243449))

(assert (not b!243452))

(assert (not start!52634))

(assert (not b!243454))

(assert (not b!243450))

(assert (not b!243447))

(assert (not b!243445))

(assert (not b!243451))

(assert (not b!243453))

(assert (not b!243442))

(assert (not b!243443))

(assert (not b!243444))

(assert (not b!243455))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

