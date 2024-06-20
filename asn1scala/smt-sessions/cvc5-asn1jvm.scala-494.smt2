; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14724 () Bool)

(assert start!14724)

(declare-fun b!75736 () Bool)

(declare-fun e!49514 () Bool)

(declare-fun e!49517 () Bool)

(assert (=> b!75736 (= e!49514 (not e!49517))))

(declare-fun res!62622 () Bool)

(assert (=> b!75736 (=> res!62622 e!49517)))

(declare-fun lt!121887 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!75736 (= res!62622 (or (bvslt i!635 to!314) (not (= lt!121887 (bvsub (bvadd lt!121887 to!314) i!635)))))))

(declare-datatypes ((array!3091 0))(
  ( (array!3092 (arr!2037 (Array (_ BitVec 32) (_ BitVec 8))) (size!1439 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2452 0))(
  ( (BitStream!2453 (buf!1820 array!3091) (currentByte!3611 (_ BitVec 32)) (currentBit!3606 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2452)

(declare-fun isPrefixOf!0 (BitStream!2452 BitStream!2452) Bool)

(assert (=> b!75736 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4978 0))(
  ( (Unit!4979) )
))
(declare-fun lt!121886 () Unit!4978)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2452) Unit!4978)

(assert (=> b!75736 (= lt!121886 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75736 (= lt!121887 (bitIndex!0 (size!1439 (buf!1820 thiss!1379)) (currentByte!3611 thiss!1379) (currentBit!3606 thiss!1379)))))

(declare-fun res!62623 () Bool)

(assert (=> start!14724 (=> (not res!62623) (not e!49514))))

(declare-fun srcBuffer!2 () array!3091)

(assert (=> start!14724 (= res!62623 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1439 srcBuffer!2))))))))

(assert (=> start!14724 e!49514))

(assert (=> start!14724 true))

(declare-fun array_inv!1285 (array!3091) Bool)

(assert (=> start!14724 (array_inv!1285 srcBuffer!2)))

(declare-fun e!49518 () Bool)

(declare-fun inv!12 (BitStream!2452) Bool)

(assert (=> start!14724 (and (inv!12 thiss!1379) e!49518)))

(declare-fun b!75737 () Bool)

(declare-fun e!49516 () Bool)

(assert (=> b!75737 (= e!49516 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!6514 0))(
  ( (tuple2!6515 (_1!3388 array!3091) (_2!3388 BitStream!2452)) )
))
(declare-fun lt!121885 () tuple2!6514)

(declare-fun checkByteArrayBitContent!0 (BitStream!2452 array!3091 array!3091 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75737 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3388 lt!121885) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75738 () Bool)

(declare-fun res!62620 () Bool)

(assert (=> b!75738 (=> (not res!62620) (not e!49514))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75738 (= res!62620 (validate_offset_bits!1 ((_ sign_extend 32) (size!1439 (buf!1820 thiss!1379))) ((_ sign_extend 32) (currentByte!3611 thiss!1379)) ((_ sign_extend 32) (currentBit!3606 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75739 () Bool)

(assert (=> b!75739 (= e!49517 e!49516)))

(declare-fun res!62619 () Bool)

(assert (=> b!75739 (=> res!62619 e!49516)))

(assert (=> b!75739 (= res!62619 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2452 (_ BitVec 64)) tuple2!6514)

(declare-datatypes ((tuple2!6516 0))(
  ( (tuple2!6517 (_1!3389 BitStream!2452) (_2!3389 BitStream!2452)) )
))
(declare-fun reader!0 (BitStream!2452 BitStream!2452) tuple2!6516)

(assert (=> b!75739 (= lt!121885 (readBits!0 (_1!3389 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75740 () Bool)

(declare-fun res!62621 () Bool)

(assert (=> b!75740 (=> res!62621 e!49517)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75740 (= res!62621 (not (invariant!0 (currentBit!3606 thiss!1379) (currentByte!3611 thiss!1379) (size!1439 (buf!1820 thiss!1379)))))))

(declare-fun b!75741 () Bool)

(assert (=> b!75741 (= e!49518 (array_inv!1285 (buf!1820 thiss!1379)))))

(assert (= (and start!14724 res!62623) b!75738))

(assert (= (and b!75738 res!62620) b!75736))

(assert (= (and b!75736 (not res!62622)) b!75740))

(assert (= (and b!75740 (not res!62621)) b!75739))

(assert (= (and b!75739 (not res!62619)) b!75737))

(assert (= start!14724 b!75741))

(declare-fun m!120821 () Bool)

(assert (=> b!75738 m!120821))

(declare-fun m!120823 () Bool)

(assert (=> b!75737 m!120823))

(declare-fun m!120825 () Bool)

(assert (=> b!75736 m!120825))

(declare-fun m!120827 () Bool)

(assert (=> b!75736 m!120827))

(declare-fun m!120829 () Bool)

(assert (=> b!75736 m!120829))

(declare-fun m!120831 () Bool)

(assert (=> start!14724 m!120831))

(declare-fun m!120833 () Bool)

(assert (=> start!14724 m!120833))

(declare-fun m!120835 () Bool)

(assert (=> b!75739 m!120835))

(declare-fun m!120837 () Bool)

(assert (=> b!75739 m!120837))

(declare-fun m!120839 () Bool)

(assert (=> b!75740 m!120839))

(declare-fun m!120841 () Bool)

(assert (=> b!75741 m!120841))

(push 1)

(assert (not start!14724))

(assert (not b!75740))

(assert (not b!75739))

(assert (not b!75741))

(assert (not b!75737))

(assert (not b!75736))

(assert (not b!75738))

(check-sat)

(pop 1)

(push 1)

(check-sat)

