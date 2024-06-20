; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14754 () Bool)

(assert start!14754)

(declare-fun res!62845 () Bool)

(declare-fun e!49784 () Bool)

(assert (=> start!14754 (=> (not res!62845) (not e!49784))))

(declare-datatypes ((array!3121 0))(
  ( (array!3122 (arr!2052 (Array (_ BitVec 32) (_ BitVec 8))) (size!1454 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3121)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14754 (= res!62845 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1454 srcBuffer!2))))))))

(assert (=> start!14754 e!49784))

(assert (=> start!14754 true))

(declare-fun array_inv!1300 (array!3121) Bool)

(assert (=> start!14754 (array_inv!1300 srcBuffer!2)))

(declare-datatypes ((BitStream!2482 0))(
  ( (BitStream!2483 (buf!1835 array!3121) (currentByte!3626 (_ BitVec 32)) (currentBit!3621 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2482)

(declare-fun e!49788 () Bool)

(declare-fun inv!12 (BitStream!2482) Bool)

(assert (=> start!14754 (and (inv!12 thiss!1379) e!49788)))

(declare-fun b!76006 () Bool)

(assert (=> b!76006 (= e!49788 (array_inv!1300 (buf!1835 thiss!1379)))))

(declare-fun b!76007 () Bool)

(declare-fun e!49785 () Bool)

(declare-fun e!49783 () Bool)

(assert (=> b!76007 (= e!49785 e!49783)))

(declare-fun res!62847 () Bool)

(assert (=> b!76007 (=> res!62847 e!49783)))

(assert (=> b!76007 (= res!62847 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6574 0))(
  ( (tuple2!6575 (_1!3418 BitStream!2482) (_2!3418 BitStream!2482)) )
))
(declare-fun lt!122036 () tuple2!6574)

(declare-datatypes ((tuple2!6576 0))(
  ( (tuple2!6577 (_1!3419 array!3121) (_2!3419 BitStream!2482)) )
))
(declare-fun lt!122039 () tuple2!6576)

(declare-fun readBits!0 (BitStream!2482 (_ BitVec 64)) tuple2!6576)

(assert (=> b!76007 (= lt!122039 (readBits!0 (_1!3418 lt!122036) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!2482 BitStream!2482) tuple2!6574)

(assert (=> b!76007 (= lt!122036 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!76008 () Bool)

(declare-fun res!62846 () Bool)

(assert (=> b!76008 (=> (not res!62846) (not e!49784))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76008 (= res!62846 (validate_offset_bits!1 ((_ sign_extend 32) (size!1454 (buf!1835 thiss!1379))) ((_ sign_extend 32) (currentByte!3626 thiss!1379)) ((_ sign_extend 32) (currentBit!3621 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76009 () Bool)

(declare-fun res!62848 () Bool)

(assert (=> b!76009 (=> res!62848 e!49785)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76009 (= res!62848 (not (invariant!0 (currentBit!3621 thiss!1379) (currentByte!3626 thiss!1379) (size!1454 (buf!1835 thiss!1379)))))))

(declare-fun b!76010 () Bool)

(assert (=> b!76010 (= e!49784 (not e!49785))))

(declare-fun res!62844 () Bool)

(assert (=> b!76010 (=> res!62844 e!49785)))

(declare-fun lt!122035 () (_ BitVec 64))

(assert (=> b!76010 (= res!62844 (or (bvslt i!635 to!314) (not (= lt!122035 (bvsub (bvadd lt!122035 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2482 BitStream!2482) Bool)

(assert (=> b!76010 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5008 0))(
  ( (Unit!5009) )
))
(declare-fun lt!122037 () Unit!5008)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2482) Unit!5008)

(assert (=> b!76010 (= lt!122037 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76010 (= lt!122035 (bitIndex!0 (size!1454 (buf!1835 thiss!1379)) (currentByte!3626 thiss!1379) (currentBit!3621 thiss!1379)))))

(declare-fun b!76011 () Bool)

(assert (=> b!76011 (= e!49783 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((List!783 0))(
  ( (Nil!780) (Cons!779 (h!898 Bool) (t!1533 List!783)) )
))
(declare-fun lt!122040 () List!783)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2482 BitStream!2482 (_ BitVec 64)) List!783)

(assert (=> b!76011 (= lt!122040 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!3418 lt!122036) (bvsub to!314 i!635)))))

(declare-fun lt!122038 () Unit!5008)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2482 array!3121 (_ BitVec 64)) Unit!5008)

(assert (=> b!76011 (= lt!122038 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1835 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun checkByteArrayBitContent!0 (BitStream!2482 array!3121 array!3121 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76011 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3419 lt!122039) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(assert (= (and start!14754 res!62845) b!76008))

(assert (= (and b!76008 res!62846) b!76010))

(assert (= (and b!76010 (not res!62844)) b!76009))

(assert (= (and b!76009 (not res!62848)) b!76007))

(assert (= (and b!76007 (not res!62847)) b!76011))

(assert (= start!14754 b!76006))

(declare-fun m!121157 () Bool)

(assert (=> b!76010 m!121157))

(declare-fun m!121159 () Bool)

(assert (=> b!76010 m!121159))

(declare-fun m!121161 () Bool)

(assert (=> b!76010 m!121161))

(declare-fun m!121163 () Bool)

(assert (=> start!14754 m!121163))

(declare-fun m!121165 () Bool)

(assert (=> start!14754 m!121165))

(declare-fun m!121167 () Bool)

(assert (=> b!76011 m!121167))

(declare-fun m!121169 () Bool)

(assert (=> b!76011 m!121169))

(declare-fun m!121171 () Bool)

(assert (=> b!76011 m!121171))

(declare-fun m!121173 () Bool)

(assert (=> b!76009 m!121173))

(declare-fun m!121175 () Bool)

(assert (=> b!76007 m!121175))

(declare-fun m!121177 () Bool)

(assert (=> b!76007 m!121177))

(declare-fun m!121179 () Bool)

(assert (=> b!76008 m!121179))

(declare-fun m!121181 () Bool)

(assert (=> b!76006 m!121181))

(push 1)

(assert (not b!76009))

(assert (not start!14754))

(assert (not b!76006))

(assert (not b!76011))

(assert (not b!76007))

(assert (not b!76008))

(assert (not b!76010))

(check-sat)

(pop 1)

(push 1)

(check-sat)

