; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21944 () Bool)

(assert start!21944)

(declare-fun b!110674 () Bool)

(declare-fun e!72597 () Bool)

(declare-fun e!72602 () Bool)

(assert (=> b!110674 (= e!72597 (not e!72602))))

(declare-fun res!91364 () Bool)

(assert (=> b!110674 (=> res!91364 e!72602)))

(declare-fun lt!167508 () (_ BitVec 64))

(declare-fun lt!167510 () (_ BitVec 64))

(assert (=> b!110674 (= res!91364 (not (= lt!167508 (bvadd lt!167508 lt!167510))))))

(declare-datatypes ((array!5073 0))(
  ( (array!5074 (arr!2900 (Array (_ BitVec 32) (_ BitVec 8))) (size!2307 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4088 0))(
  ( (BitStream!4089 (buf!2704 array!5073) (currentByte!5261 (_ BitVec 32)) (currentBit!5256 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4088)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110674 (= lt!167508 (bitIndex!0 (size!2307 (buf!2704 thiss!1305)) (currentByte!5261 thiss!1305) (currentBit!5256 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4088 BitStream!4088) Bool)

(assert (=> b!110674 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6782 0))(
  ( (Unit!6783) )
))
(declare-fun lt!167505 () Unit!6782)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4088) Unit!6782)

(assert (=> b!110674 (= lt!167505 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110675 () Bool)

(declare-fun res!91365 () Bool)

(assert (=> b!110675 (=> (not res!91365) (not e!72597))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110675 (= res!91365 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110676 () Bool)

(declare-fun e!72599 () Bool)

(assert (=> b!110676 (= e!72599 e!72597)))

(declare-fun res!91366 () Bool)

(assert (=> b!110676 (=> (not res!91366) (not e!72597))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110676 (= res!91366 (validate_offset_bits!1 ((_ sign_extend 32) (size!2307 (buf!2704 thiss!1305))) ((_ sign_extend 32) (currentByte!5261 thiss!1305)) ((_ sign_extend 32) (currentBit!5256 thiss!1305)) lt!167510))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!110676 (= lt!167510 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110677 () Bool)

(declare-fun e!72601 () Bool)

(declare-fun array_inv!2109 (array!5073) Bool)

(assert (=> b!110677 (= e!72601 (array_inv!2109 (buf!2704 thiss!1305)))))

(declare-fun b!110678 () Bool)

(declare-fun e!72600 () Bool)

(declare-fun lt!167506 () (_ BitVec 64))

(assert (=> b!110678 (= e!72600 (= (bvand (bvand v!199 (bvnot lt!167506)) lt!167506) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!110680 () Bool)

(assert (=> b!110680 (= e!72602 e!72600)))

(declare-fun res!91361 () Bool)

(assert (=> b!110680 (=> res!91361 e!72600)))

(declare-datatypes ((tuple2!9208 0))(
  ( (tuple2!9209 (_1!4861 BitStream!4088) (_2!4861 BitStream!4088)) )
))
(declare-fun lt!167507 () tuple2!9208)

(assert (=> b!110680 (= res!91361 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2307 (buf!2704 (_1!4861 lt!167507)))) ((_ sign_extend 32) (currentByte!5261 (_1!4861 lt!167507))) ((_ sign_extend 32) (currentBit!5256 (_1!4861 lt!167507))) lt!167510)))))

(declare-fun lt!167509 () Unit!6782)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4088 array!5073 (_ BitVec 64)) Unit!6782)

(assert (=> b!110680 (= lt!167509 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2704 thiss!1305) lt!167510))))

(assert (=> b!110680 (= lt!167506 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun reader!0 (BitStream!4088 BitStream!4088) tuple2!9208)

(assert (=> b!110680 (= lt!167507 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110679 () Bool)

(declare-fun res!91362 () Bool)

(assert (=> b!110679 (=> (not res!91362) (not e!72597))))

(assert (=> b!110679 (= res!91362 (bvsge i!615 nBits!396))))

(declare-fun res!91363 () Bool)

(assert (=> start!21944 (=> (not res!91363) (not e!72599))))

(assert (=> start!21944 (= res!91363 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21944 e!72599))

(assert (=> start!21944 true))

(declare-fun inv!12 (BitStream!4088) Bool)

(assert (=> start!21944 (and (inv!12 thiss!1305) e!72601)))

(assert (= (and start!21944 res!91363) b!110676))

(assert (= (and b!110676 res!91366) b!110675))

(assert (= (and b!110675 res!91365) b!110679))

(assert (= (and b!110679 res!91362) b!110674))

(assert (= (and b!110674 (not res!91364)) b!110680))

(assert (= (and b!110680 (not res!91361)) b!110678))

(assert (= start!21944 b!110677))

(declare-fun m!164251 () Bool)

(assert (=> b!110675 m!164251))

(declare-fun m!164253 () Bool)

(assert (=> b!110676 m!164253))

(declare-fun m!164255 () Bool)

(assert (=> b!110677 m!164255))

(declare-fun m!164257 () Bool)

(assert (=> b!110680 m!164257))

(declare-fun m!164259 () Bool)

(assert (=> b!110680 m!164259))

(declare-fun m!164261 () Bool)

(assert (=> b!110680 m!164261))

(declare-fun m!164263 () Bool)

(assert (=> b!110680 m!164263))

(declare-fun m!164265 () Bool)

(assert (=> start!21944 m!164265))

(declare-fun m!164267 () Bool)

(assert (=> b!110674 m!164267))

(declare-fun m!164269 () Bool)

(assert (=> b!110674 m!164269))

(declare-fun m!164271 () Bool)

(assert (=> b!110674 m!164271))

(push 1)

(assert (not b!110674))

(assert (not start!21944))

(assert (not b!110676))

(assert (not b!110680))

(assert (not b!110677))

(assert (not b!110675))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

