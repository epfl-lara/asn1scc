; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14748 () Bool)

(assert start!14748)

(declare-fun b!75952 () Bool)

(declare-fun e!49733 () Bool)

(declare-datatypes ((array!3115 0))(
  ( (array!3116 (arr!2049 (Array (_ BitVec 32) (_ BitVec 8))) (size!1451 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2476 0))(
  ( (BitStream!2477 (buf!1832 array!3115) (currentByte!3623 (_ BitVec 32)) (currentBit!3618 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2476)

(declare-fun array_inv!1297 (array!3115) Bool)

(assert (=> b!75952 (= e!49733 (array_inv!1297 (buf!1832 thiss!1379)))))

(declare-fun b!75953 () Bool)

(declare-fun e!49730 () Bool)

(declare-fun e!49734 () Bool)

(assert (=> b!75953 (= e!49730 (not e!49734))))

(declare-fun res!62800 () Bool)

(assert (=> b!75953 (=> res!62800 e!49734)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!121998 () (_ BitVec 64))

(assert (=> b!75953 (= res!62800 (or (bvslt i!635 to!314) (not (= lt!121998 (bvsub (bvadd lt!121998 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2476 BitStream!2476) Bool)

(assert (=> b!75953 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5002 0))(
  ( (Unit!5003) )
))
(declare-fun lt!121997 () Unit!5002)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2476) Unit!5002)

(assert (=> b!75953 (= lt!121997 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75953 (= lt!121998 (bitIndex!0 (size!1451 (buf!1832 thiss!1379)) (currentByte!3623 thiss!1379) (currentBit!3618 thiss!1379)))))

(declare-fun b!75955 () Bool)

(declare-fun e!49732 () Bool)

(assert (=> b!75955 (= e!49732 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!121996 () Unit!5002)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2476 array!3115 (_ BitVec 64)) Unit!5002)

(assert (=> b!75955 (= lt!121996 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1832 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!3115)

(declare-datatypes ((tuple2!6562 0))(
  ( (tuple2!6563 (_1!3412 array!3115) (_2!3412 BitStream!2476)) )
))
(declare-fun lt!121995 () tuple2!6562)

(declare-fun checkByteArrayBitContent!0 (BitStream!2476 array!3115 array!3115 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75955 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3412 lt!121995) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75956 () Bool)

(declare-fun res!62802 () Bool)

(assert (=> b!75956 (=> (not res!62802) (not e!49730))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75956 (= res!62802 (validate_offset_bits!1 ((_ sign_extend 32) (size!1451 (buf!1832 thiss!1379))) ((_ sign_extend 32) (currentByte!3623 thiss!1379)) ((_ sign_extend 32) (currentBit!3618 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75957 () Bool)

(declare-fun res!62799 () Bool)

(assert (=> b!75957 (=> res!62799 e!49734)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75957 (= res!62799 (not (invariant!0 (currentBit!3618 thiss!1379) (currentByte!3623 thiss!1379) (size!1451 (buf!1832 thiss!1379)))))))

(declare-fun b!75954 () Bool)

(assert (=> b!75954 (= e!49734 e!49732)))

(declare-fun res!62803 () Bool)

(assert (=> b!75954 (=> res!62803 e!49732)))

(assert (=> b!75954 (= res!62803 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2476 (_ BitVec 64)) tuple2!6562)

(declare-datatypes ((tuple2!6564 0))(
  ( (tuple2!6565 (_1!3413 BitStream!2476) (_2!3413 BitStream!2476)) )
))
(declare-fun reader!0 (BitStream!2476 BitStream!2476) tuple2!6564)

(assert (=> b!75954 (= lt!121995 (readBits!0 (_1!3413 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!62801 () Bool)

(assert (=> start!14748 (=> (not res!62801) (not e!49730))))

(assert (=> start!14748 (= res!62801 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1451 srcBuffer!2))))))))

(assert (=> start!14748 e!49730))

(assert (=> start!14748 true))

(assert (=> start!14748 (array_inv!1297 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2476) Bool)

(assert (=> start!14748 (and (inv!12 thiss!1379) e!49733)))

(assert (= (and start!14748 res!62801) b!75956))

(assert (= (and b!75956 res!62802) b!75953))

(assert (= (and b!75953 (not res!62800)) b!75957))

(assert (= (and b!75957 (not res!62799)) b!75954))

(assert (= (and b!75954 (not res!62803)) b!75955))

(assert (= start!14748 b!75952))

(declare-fun m!121085 () Bool)

(assert (=> b!75956 m!121085))

(declare-fun m!121087 () Bool)

(assert (=> b!75953 m!121087))

(declare-fun m!121089 () Bool)

(assert (=> b!75953 m!121089))

(declare-fun m!121091 () Bool)

(assert (=> b!75953 m!121091))

(declare-fun m!121093 () Bool)

(assert (=> b!75957 m!121093))

(declare-fun m!121095 () Bool)

(assert (=> start!14748 m!121095))

(declare-fun m!121097 () Bool)

(assert (=> start!14748 m!121097))

(declare-fun m!121099 () Bool)

(assert (=> b!75955 m!121099))

(declare-fun m!121101 () Bool)

(assert (=> b!75955 m!121101))

(declare-fun m!121103 () Bool)

(assert (=> b!75952 m!121103))

(declare-fun m!121105 () Bool)

(assert (=> b!75954 m!121105))

(declare-fun m!121107 () Bool)

(assert (=> b!75954 m!121107))

(push 1)

(assert (not start!14748))

(assert (not b!75955))

(assert (not b!75957))

(assert (not b!75952))

(assert (not b!75954))

(assert (not b!75956))

(assert (not b!75953))

(check-sat)

(pop 1)

(push 1)

(check-sat)

