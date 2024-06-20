; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5144 () Bool)

(assert start!5144)

(declare-datatypes ((array!1479 0))(
  ( (array!1480 (arr!1074 (Array (_ BitVec 32) (_ BitVec 8))) (size!630 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1479)

(declare-datatypes ((BitStream!1094 0))(
  ( (BitStream!1095 (buf!939 array!1479) (currentByte!2228 (_ BitVec 32)) (currentBit!2223 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2428 0))(
  ( (tuple2!2429 (_1!1299 BitStream!1094) (_2!1299 BitStream!1094)) )
))
(declare-fun lt!29313 () tuple2!2428)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!13914 () Bool)

(declare-fun b!20610 () Bool)

(declare-datatypes ((Unit!1813 0))(
  ( (Unit!1814) )
))
(declare-datatypes ((tuple2!2430 0))(
  ( (tuple2!2431 (_1!1300 Unit!1813) (_2!1300 BitStream!1094)) )
))
(declare-fun lt!29312 () tuple2!2430)

(declare-datatypes ((List!248 0))(
  ( (Nil!245) (Cons!244 (h!363 Bool) (t!998 List!248)) )
))
(declare-fun head!85 (List!248) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1094 array!1479 (_ BitVec 64) (_ BitVec 64)) List!248)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1094 BitStream!1094 (_ BitVec 64)) List!248)

(assert (=> b!20610 (= e!13914 (= (head!85 (byteArrayBitContentToList!0 (_2!1300 lt!29312) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!85 (bitStreamReadBitsIntoList!0 (_2!1300 lt!29312) (_1!1299 lt!29313) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20611 () Bool)

(declare-fun e!13920 () Bool)

(assert (=> b!20611 (= e!13920 true)))

(assert (=> b!20611 e!13914))

(declare-fun res!17898 () Bool)

(assert (=> b!20611 (=> (not res!17898) (not e!13914))))

(declare-fun thiss!1379 () BitStream!1094)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20611 (= res!17898 (validate_offset_bits!1 ((_ sign_extend 32) (size!630 (buf!939 (_2!1300 lt!29312)))) ((_ sign_extend 32) (currentByte!2228 thiss!1379)) ((_ sign_extend 32) (currentBit!2223 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29317 () Unit!1813)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1094 array!1479 (_ BitVec 64)) Unit!1813)

(assert (=> b!20611 (= lt!29317 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!939 (_2!1300 lt!29312)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1094 BitStream!1094) tuple2!2428)

(assert (=> b!20611 (= lt!29313 (reader!0 thiss!1379 (_2!1300 lt!29312)))))

(declare-fun res!17897 () Bool)

(declare-fun e!13915 () Bool)

(assert (=> start!5144 (=> (not res!17897) (not e!13915))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5144 (= res!17897 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!630 srcBuffer!2))))))))

(assert (=> start!5144 e!13915))

(assert (=> start!5144 true))

(declare-fun array_inv!600 (array!1479) Bool)

(assert (=> start!5144 (array_inv!600 srcBuffer!2)))

(declare-fun e!13918 () Bool)

(declare-fun inv!12 (BitStream!1094) Bool)

(assert (=> start!5144 (and (inv!12 thiss!1379) e!13918)))

(declare-fun b!20612 () Bool)

(assert (=> b!20612 (= e!13918 (array_inv!600 (buf!939 thiss!1379)))))

(declare-fun b!20613 () Bool)

(declare-fun e!13919 () Bool)

(assert (=> b!20613 (= e!13919 e!13920)))

(declare-fun res!17896 () Bool)

(assert (=> b!20613 (=> res!17896 e!13920)))

(declare-fun isPrefixOf!0 (BitStream!1094 BitStream!1094) Bool)

(assert (=> b!20613 (= res!17896 (not (isPrefixOf!0 thiss!1379 (_2!1300 lt!29312))))))

(assert (=> b!20613 (validate_offset_bits!1 ((_ sign_extend 32) (size!630 (buf!939 (_2!1300 lt!29312)))) ((_ sign_extend 32) (currentByte!2228 (_2!1300 lt!29312))) ((_ sign_extend 32) (currentBit!2223 (_2!1300 lt!29312))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29316 () Unit!1813)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1094 BitStream!1094 (_ BitVec 64) (_ BitVec 64)) Unit!1813)

(assert (=> b!20613 (= lt!29316 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1300 lt!29312) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1094 (_ BitVec 8) (_ BitVec 32)) tuple2!2430)

(assert (=> b!20613 (= lt!29312 (appendBitFromByte!0 thiss!1379 (select (arr!1074 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20614 () Bool)

(assert (=> b!20614 (= e!13915 (not e!13919))))

(declare-fun res!17900 () Bool)

(assert (=> b!20614 (=> res!17900 e!13919)))

(assert (=> b!20614 (= res!17900 (bvsge i!635 to!314))))

(assert (=> b!20614 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29315 () Unit!1813)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1094) Unit!1813)

(assert (=> b!20614 (= lt!29315 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29314 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20614 (= lt!29314 (bitIndex!0 (size!630 (buf!939 thiss!1379)) (currentByte!2228 thiss!1379) (currentBit!2223 thiss!1379)))))

(declare-fun b!20615 () Bool)

(declare-fun res!17899 () Bool)

(assert (=> b!20615 (=> (not res!17899) (not e!13915))))

(assert (=> b!20615 (= res!17899 (validate_offset_bits!1 ((_ sign_extend 32) (size!630 (buf!939 thiss!1379))) ((_ sign_extend 32) (currentByte!2228 thiss!1379)) ((_ sign_extend 32) (currentBit!2223 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5144 res!17897) b!20615))

(assert (= (and b!20615 res!17899) b!20614))

(assert (= (and b!20614 (not res!17900)) b!20613))

(assert (= (and b!20613 (not res!17896)) b!20611))

(assert (= (and b!20611 res!17898) b!20610))

(assert (= start!5144 b!20612))

(declare-fun m!28081 () Bool)

(assert (=> start!5144 m!28081))

(declare-fun m!28083 () Bool)

(assert (=> start!5144 m!28083))

(declare-fun m!28085 () Bool)

(assert (=> b!20613 m!28085))

(declare-fun m!28087 () Bool)

(assert (=> b!20613 m!28087))

(declare-fun m!28089 () Bool)

(assert (=> b!20613 m!28089))

(declare-fun m!28091 () Bool)

(assert (=> b!20613 m!28091))

(assert (=> b!20613 m!28085))

(declare-fun m!28093 () Bool)

(assert (=> b!20613 m!28093))

(declare-fun m!28095 () Bool)

(assert (=> b!20612 m!28095))

(declare-fun m!28097 () Bool)

(assert (=> b!20610 m!28097))

(assert (=> b!20610 m!28097))

(declare-fun m!28099 () Bool)

(assert (=> b!20610 m!28099))

(declare-fun m!28101 () Bool)

(assert (=> b!20610 m!28101))

(assert (=> b!20610 m!28101))

(declare-fun m!28103 () Bool)

(assert (=> b!20610 m!28103))

(declare-fun m!28105 () Bool)

(assert (=> b!20614 m!28105))

(declare-fun m!28107 () Bool)

(assert (=> b!20614 m!28107))

(declare-fun m!28109 () Bool)

(assert (=> b!20614 m!28109))

(declare-fun m!28111 () Bool)

(assert (=> b!20611 m!28111))

(declare-fun m!28113 () Bool)

(assert (=> b!20611 m!28113))

(declare-fun m!28115 () Bool)

(assert (=> b!20611 m!28115))

(declare-fun m!28117 () Bool)

(assert (=> b!20615 m!28117))

(push 1)

(assert (not b!20610))

(assert (not b!20615))

(assert (not b!20614))

(assert (not b!20613))

(assert (not b!20612))

(assert (not start!5144))

(assert (not b!20611))

(check-sat)

(pop 1)

(push 1)

(check-sat)

