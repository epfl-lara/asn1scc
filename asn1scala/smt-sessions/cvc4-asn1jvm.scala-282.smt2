; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5676 () Bool)

(assert start!5676)

(declare-fun res!20529 () Bool)

(declare-fun e!16176 () Bool)

(assert (=> start!5676 (=> (not res!20529) (not e!16176))))

(declare-datatypes ((array!1599 0))(
  ( (array!1600 (arr!1141 (Array (_ BitVec 32) (_ BitVec 8))) (size!685 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1599)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5676 (= res!20529 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!685 srcBuffer!2))))))))

(assert (=> start!5676 e!16176))

(assert (=> start!5676 true))

(declare-fun array_inv!654 (array!1599) Bool)

(assert (=> start!5676 (array_inv!654 srcBuffer!2)))

(declare-datatypes ((BitStream!1202 0))(
  ( (BitStream!1203 (buf!1006 array!1599) (currentByte!2319 (_ BitVec 32)) (currentBit!2314 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1202)

(declare-fun e!16177 () Bool)

(declare-fun inv!12 (BitStream!1202) Bool)

(assert (=> start!5676 (and (inv!12 thiss!1379) e!16177)))

(declare-fun b!23832 () Bool)

(declare-fun e!16181 () Bool)

(declare-fun e!16180 () Bool)

(assert (=> b!23832 (= e!16181 e!16180)))

(declare-fun res!20531 () Bool)

(assert (=> b!23832 (=> res!20531 e!16180)))

(declare-datatypes ((Unit!2013 0))(
  ( (Unit!2014) )
))
(declare-datatypes ((tuple2!2722 0))(
  ( (tuple2!2723 (_1!1448 Unit!2013) (_2!1448 BitStream!1202)) )
))
(declare-fun lt!34310 () tuple2!2722)

(declare-fun lt!34319 () tuple2!2722)

(declare-fun isPrefixOf!0 (BitStream!1202 BitStream!1202) Bool)

(assert (=> b!23832 (= res!20531 (not (isPrefixOf!0 (_2!1448 lt!34310) (_2!1448 lt!34319))))))

(assert (=> b!23832 (isPrefixOf!0 thiss!1379 (_2!1448 lt!34319))))

(declare-fun lt!34320 () Unit!2013)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1202 BitStream!1202 BitStream!1202) Unit!2013)

(assert (=> b!23832 (= lt!34320 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1448 lt!34310) (_2!1448 lt!34319)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1202 array!1599 (_ BitVec 64) (_ BitVec 64)) tuple2!2722)

(assert (=> b!23832 (= lt!34319 (appendBitsMSBFirstLoop!0 (_2!1448 lt!34310) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!16182 () Bool)

(assert (=> b!23832 e!16182))

(declare-fun res!20537 () Bool)

(assert (=> b!23832 (=> (not res!20537) (not e!16182))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23832 (= res!20537 (validate_offset_bits!1 ((_ sign_extend 32) (size!685 (buf!1006 (_2!1448 lt!34310)))) ((_ sign_extend 32) (currentByte!2319 thiss!1379)) ((_ sign_extend 32) (currentBit!2314 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34316 () Unit!2013)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1202 array!1599 (_ BitVec 64)) Unit!2013)

(assert (=> b!23832 (= lt!34316 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1006 (_2!1448 lt!34310)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2724 0))(
  ( (tuple2!2725 (_1!1449 BitStream!1202) (_2!1449 BitStream!1202)) )
))
(declare-fun lt!34318 () tuple2!2724)

(declare-fun reader!0 (BitStream!1202 BitStream!1202) tuple2!2724)

(assert (=> b!23832 (= lt!34318 (reader!0 thiss!1379 (_2!1448 lt!34310)))))

(declare-fun b!23833 () Bool)

(declare-fun res!20534 () Bool)

(declare-fun e!16186 () Bool)

(assert (=> b!23833 (=> res!20534 e!16186)))

(assert (=> b!23833 (= res!20534 (not (= (size!685 (buf!1006 thiss!1379)) (size!685 (buf!1006 (_2!1448 lt!34319))))))))

(declare-fun b!23834 () Bool)

(assert (=> b!23834 (= e!16177 (array_inv!654 (buf!1006 thiss!1379)))))

(declare-fun b!23835 () Bool)

(declare-fun e!16179 () Bool)

(assert (=> b!23835 (= e!16179 true)))

(declare-fun lt!34313 () tuple2!2724)

(assert (=> b!23835 (= lt!34313 (reader!0 (_2!1448 lt!34310) (_2!1448 lt!34319)))))

(assert (=> b!23835 (validate_offset_bits!1 ((_ sign_extend 32) (size!685 (buf!1006 (_2!1448 lt!34319)))) ((_ sign_extend 32) (currentByte!2319 thiss!1379)) ((_ sign_extend 32) (currentBit!2314 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34317 () Unit!2013)

(assert (=> b!23835 (= lt!34317 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1006 (_2!1448 lt!34319)) (bvsub to!314 i!635)))))

(declare-fun lt!34321 () tuple2!2724)

(assert (=> b!23835 (= lt!34321 (reader!0 thiss!1379 (_2!1448 lt!34319)))))

(declare-fun b!23836 () Bool)

(declare-fun res!20532 () Bool)

(assert (=> b!23836 (=> (not res!20532) (not e!16176))))

(assert (=> b!23836 (= res!20532 (validate_offset_bits!1 ((_ sign_extend 32) (size!685 (buf!1006 thiss!1379))) ((_ sign_extend 32) (currentByte!2319 thiss!1379)) ((_ sign_extend 32) (currentBit!2314 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun lt!34314 () (_ BitVec 64))

(declare-fun e!16178 () Bool)

(declare-fun b!23837 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23837 (= e!16178 (= lt!34314 (bvsub (bvsub (bvadd (bitIndex!0 (size!685 (buf!1006 (_2!1448 lt!34310))) (currentByte!2319 (_2!1448 lt!34310)) (currentBit!2314 (_2!1448 lt!34310))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23838 () Bool)

(declare-fun e!16183 () Bool)

(assert (=> b!23838 (= e!16183 e!16181)))

(declare-fun res!20538 () Bool)

(assert (=> b!23838 (=> res!20538 e!16181)))

(assert (=> b!23838 (= res!20538 (not (isPrefixOf!0 thiss!1379 (_2!1448 lt!34310))))))

(assert (=> b!23838 (validate_offset_bits!1 ((_ sign_extend 32) (size!685 (buf!1006 (_2!1448 lt!34310)))) ((_ sign_extend 32) (currentByte!2319 (_2!1448 lt!34310))) ((_ sign_extend 32) (currentBit!2314 (_2!1448 lt!34310))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34312 () Unit!2013)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1202 BitStream!1202 (_ BitVec 64) (_ BitVec 64)) Unit!2013)

(assert (=> b!23838 (= lt!34312 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1448 lt!34310) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1202 (_ BitVec 8) (_ BitVec 32)) tuple2!2722)

(assert (=> b!23838 (= lt!34310 (appendBitFromByte!0 thiss!1379 (select (arr!1141 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23839 () Bool)

(assert (=> b!23839 (= e!16180 e!16186)))

(declare-fun res!20526 () Bool)

(assert (=> b!23839 (=> res!20526 e!16186)))

(declare-fun lt!34311 () (_ BitVec 64))

(assert (=> b!23839 (= res!20526 (not (= lt!34314 (bvsub (bvadd lt!34311 to!314) i!635))))))

(assert (=> b!23839 (= lt!34314 (bitIndex!0 (size!685 (buf!1006 (_2!1448 lt!34319))) (currentByte!2319 (_2!1448 lt!34319)) (currentBit!2314 (_2!1448 lt!34319))))))

(declare-fun b!23840 () Bool)

(declare-fun res!20528 () Bool)

(assert (=> b!23840 (=> res!20528 e!16179)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23840 (= res!20528 (not (invariant!0 (currentBit!2314 (_2!1448 lt!34310)) (currentByte!2319 (_2!1448 lt!34310)) (size!685 (buf!1006 (_2!1448 lt!34319))))))))

(declare-fun b!23841 () Bool)

(declare-fun res!20536 () Bool)

(assert (=> b!23841 (=> res!20536 e!16186)))

(assert (=> b!23841 (= res!20536 (not (invariant!0 (currentBit!2314 (_2!1448 lt!34319)) (currentByte!2319 (_2!1448 lt!34319)) (size!685 (buf!1006 (_2!1448 lt!34319))))))))

(declare-fun b!23842 () Bool)

(assert (=> b!23842 (= e!16176 (not e!16183))))

(declare-fun res!20530 () Bool)

(assert (=> b!23842 (=> res!20530 e!16183)))

(assert (=> b!23842 (= res!20530 (bvsge i!635 to!314))))

(assert (=> b!23842 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34315 () Unit!2013)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1202) Unit!2013)

(assert (=> b!23842 (= lt!34315 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23842 (= lt!34311 (bitIndex!0 (size!685 (buf!1006 thiss!1379)) (currentByte!2319 thiss!1379) (currentBit!2314 thiss!1379)))))

(declare-fun b!23843 () Bool)

(declare-fun res!20527 () Bool)

(assert (=> b!23843 (=> res!20527 e!16179)))

(assert (=> b!23843 (= res!20527 (not (invariant!0 (currentBit!2314 (_2!1448 lt!34310)) (currentByte!2319 (_2!1448 lt!34310)) (size!685 (buf!1006 (_2!1448 lt!34310))))))))

(declare-fun b!23844 () Bool)

(assert (=> b!23844 (= e!16186 e!16179)))

(declare-fun res!20535 () Bool)

(assert (=> b!23844 (=> res!20535 e!16179)))

(assert (=> b!23844 (= res!20535 (not (= (size!685 (buf!1006 (_2!1448 lt!34310))) (size!685 (buf!1006 (_2!1448 lt!34319))))))))

(assert (=> b!23844 e!16178))

(declare-fun res!20533 () Bool)

(assert (=> b!23844 (=> (not res!20533) (not e!16178))))

(assert (=> b!23844 (= res!20533 (= (size!685 (buf!1006 (_2!1448 lt!34319))) (size!685 (buf!1006 thiss!1379))))))

(declare-fun b!23845 () Bool)

(declare-datatypes ((List!302 0))(
  ( (Nil!299) (Cons!298 (h!417 Bool) (t!1052 List!302)) )
))
(declare-fun head!139 (List!302) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1202 array!1599 (_ BitVec 64) (_ BitVec 64)) List!302)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1202 BitStream!1202 (_ BitVec 64)) List!302)

(assert (=> b!23845 (= e!16182 (= (head!139 (byteArrayBitContentToList!0 (_2!1448 lt!34310) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!139 (bitStreamReadBitsIntoList!0 (_2!1448 lt!34310) (_1!1449 lt!34318) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!5676 res!20529) b!23836))

(assert (= (and b!23836 res!20532) b!23842))

(assert (= (and b!23842 (not res!20530)) b!23838))

(assert (= (and b!23838 (not res!20538)) b!23832))

(assert (= (and b!23832 res!20537) b!23845))

(assert (= (and b!23832 (not res!20531)) b!23839))

(assert (= (and b!23839 (not res!20526)) b!23841))

(assert (= (and b!23841 (not res!20536)) b!23833))

(assert (= (and b!23833 (not res!20534)) b!23844))

(assert (= (and b!23844 res!20533) b!23837))

(assert (= (and b!23844 (not res!20535)) b!23843))

(assert (= (and b!23843 (not res!20527)) b!23840))

(assert (= (and b!23840 (not res!20528)) b!23835))

(assert (= start!5676 b!23834))

(declare-fun m!33533 () Bool)

(assert (=> b!23836 m!33533))

(declare-fun m!33535 () Bool)

(assert (=> b!23834 m!33535))

(declare-fun m!33537 () Bool)

(assert (=> start!5676 m!33537))

(declare-fun m!33539 () Bool)

(assert (=> start!5676 m!33539))

(declare-fun m!33541 () Bool)

(assert (=> b!23837 m!33541))

(declare-fun m!33543 () Bool)

(assert (=> b!23832 m!33543))

(declare-fun m!33545 () Bool)

(assert (=> b!23832 m!33545))

(declare-fun m!33547 () Bool)

(assert (=> b!23832 m!33547))

(declare-fun m!33549 () Bool)

(assert (=> b!23832 m!33549))

(declare-fun m!33551 () Bool)

(assert (=> b!23832 m!33551))

(declare-fun m!33553 () Bool)

(assert (=> b!23832 m!33553))

(declare-fun m!33555 () Bool)

(assert (=> b!23832 m!33555))

(declare-fun m!33557 () Bool)

(assert (=> b!23835 m!33557))

(declare-fun m!33559 () Bool)

(assert (=> b!23835 m!33559))

(declare-fun m!33561 () Bool)

(assert (=> b!23835 m!33561))

(declare-fun m!33563 () Bool)

(assert (=> b!23835 m!33563))

(declare-fun m!33565 () Bool)

(assert (=> b!23841 m!33565))

(declare-fun m!33567 () Bool)

(assert (=> b!23842 m!33567))

(declare-fun m!33569 () Bool)

(assert (=> b!23842 m!33569))

(declare-fun m!33571 () Bool)

(assert (=> b!23842 m!33571))

(declare-fun m!33573 () Bool)

(assert (=> b!23838 m!33573))

(declare-fun m!33575 () Bool)

(assert (=> b!23838 m!33575))

(declare-fun m!33577 () Bool)

(assert (=> b!23838 m!33577))

(assert (=> b!23838 m!33575))

(declare-fun m!33579 () Bool)

(assert (=> b!23838 m!33579))

(declare-fun m!33581 () Bool)

(assert (=> b!23838 m!33581))

(declare-fun m!33583 () Bool)

(assert (=> b!23840 m!33583))

(declare-fun m!33585 () Bool)

(assert (=> b!23843 m!33585))

(declare-fun m!33587 () Bool)

(assert (=> b!23845 m!33587))

(assert (=> b!23845 m!33587))

(declare-fun m!33589 () Bool)

(assert (=> b!23845 m!33589))

(declare-fun m!33591 () Bool)

(assert (=> b!23845 m!33591))

(assert (=> b!23845 m!33591))

(declare-fun m!33593 () Bool)

(assert (=> b!23845 m!33593))

(declare-fun m!33595 () Bool)

(assert (=> b!23839 m!33595))

(push 1)

(assert (not b!23840))

(assert (not b!23836))

(assert (not b!23835))

(assert (not b!23841))

(assert (not b!23834))

(assert (not b!23842))

(assert (not b!23843))

(assert (not b!23832))

(assert (not start!5676))

(assert (not b!23838))

(assert (not b!23839))

(assert (not b!23845))

(assert (not b!23837))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

