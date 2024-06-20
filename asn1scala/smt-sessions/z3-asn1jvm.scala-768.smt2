; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21942 () Bool)

(assert start!21942)

(declare-fun b!110653 () Bool)

(declare-fun res!91347 () Bool)

(declare-fun e!72579 () Bool)

(assert (=> b!110653 (=> (not res!91347) (not e!72579))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!110653 (= res!91347 (bvsge i!615 nBits!396))))

(declare-fun b!110654 () Bool)

(declare-fun e!72583 () Bool)

(declare-datatypes ((array!5071 0))(
  ( (array!5072 (arr!2899 (Array (_ BitVec 32) (_ BitVec 8))) (size!2306 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4086 0))(
  ( (BitStream!4087 (buf!2703 array!5071) (currentByte!5260 (_ BitVec 32)) (currentBit!5255 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4086)

(declare-fun array_inv!2108 (array!5071) Bool)

(assert (=> b!110654 (= e!72583 (array_inv!2108 (buf!2703 thiss!1305)))))

(declare-fun b!110655 () Bool)

(declare-fun e!72582 () Bool)

(assert (=> b!110655 (= e!72582 e!72579)))

(declare-fun res!91348 () Bool)

(assert (=> b!110655 (=> (not res!91348) (not e!72579))))

(declare-fun lt!167492 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110655 (= res!91348 (validate_offset_bits!1 ((_ sign_extend 32) (size!2306 (buf!2703 thiss!1305))) ((_ sign_extend 32) (currentByte!5260 thiss!1305)) ((_ sign_extend 32) (currentBit!5255 thiss!1305)) lt!167492))))

(assert (=> b!110655 (= lt!167492 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110656 () Bool)

(declare-fun res!91346 () Bool)

(assert (=> b!110656 (=> (not res!91346) (not e!72579))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110656 (= res!91346 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110657 () Bool)

(declare-fun e!72580 () Bool)

(assert (=> b!110657 (= e!72579 (not e!72580))))

(declare-fun res!91344 () Bool)

(assert (=> b!110657 (=> res!91344 e!72580)))

(declare-fun lt!167489 () (_ BitVec 64))

(assert (=> b!110657 (= res!91344 (not (= lt!167489 (bvadd lt!167489 lt!167492))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110657 (= lt!167489 (bitIndex!0 (size!2306 (buf!2703 thiss!1305)) (currentByte!5260 thiss!1305) (currentBit!5255 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4086 BitStream!4086) Bool)

(assert (=> b!110657 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6780 0))(
  ( (Unit!6781) )
))
(declare-fun lt!167490 () Unit!6780)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4086) Unit!6780)

(assert (=> b!110657 (= lt!167490 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun res!91345 () Bool)

(assert (=> start!21942 (=> (not res!91345) (not e!72582))))

(assert (=> start!21942 (= res!91345 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21942 e!72582))

(assert (=> start!21942 true))

(declare-fun inv!12 (BitStream!4086) Bool)

(assert (=> start!21942 (and (inv!12 thiss!1305) e!72583)))

(declare-fun b!110658 () Bool)

(declare-fun e!72581 () Bool)

(assert (=> b!110658 (= e!72580 e!72581)))

(declare-fun res!91343 () Bool)

(assert (=> b!110658 (=> res!91343 e!72581)))

(declare-datatypes ((tuple2!9206 0))(
  ( (tuple2!9207 (_1!4860 BitStream!4086) (_2!4860 BitStream!4086)) )
))
(declare-fun lt!167488 () tuple2!9206)

(assert (=> b!110658 (= res!91343 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2306 (buf!2703 (_1!4860 lt!167488)))) ((_ sign_extend 32) (currentByte!5260 (_1!4860 lt!167488))) ((_ sign_extend 32) (currentBit!5255 (_1!4860 lt!167488))) lt!167492)))))

(declare-fun lt!167491 () Unit!6780)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4086 array!5071 (_ BitVec 64)) Unit!6780)

(assert (=> b!110658 (= lt!167491 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2703 thiss!1305) lt!167492))))

(declare-fun lt!167487 () (_ BitVec 64))

(assert (=> b!110658 (= lt!167487 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun reader!0 (BitStream!4086 BitStream!4086) tuple2!9206)

(assert (=> b!110658 (= lt!167488 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110659 () Bool)

(assert (=> b!110659 (= e!72581 (= (bvand (bvand v!199 (bvnot lt!167487)) lt!167487) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!21942 res!91345) b!110655))

(assert (= (and b!110655 res!91348) b!110656))

(assert (= (and b!110656 res!91346) b!110653))

(assert (= (and b!110653 res!91347) b!110657))

(assert (= (and b!110657 (not res!91344)) b!110658))

(assert (= (and b!110658 (not res!91343)) b!110659))

(assert (= start!21942 b!110654))

(declare-fun m!164229 () Bool)

(assert (=> b!110657 m!164229))

(declare-fun m!164231 () Bool)

(assert (=> b!110657 m!164231))

(declare-fun m!164233 () Bool)

(assert (=> b!110657 m!164233))

(declare-fun m!164235 () Bool)

(assert (=> b!110654 m!164235))

(declare-fun m!164237 () Bool)

(assert (=> start!21942 m!164237))

(declare-fun m!164239 () Bool)

(assert (=> b!110656 m!164239))

(declare-fun m!164241 () Bool)

(assert (=> b!110658 m!164241))

(declare-fun m!164243 () Bool)

(assert (=> b!110658 m!164243))

(declare-fun m!164245 () Bool)

(assert (=> b!110658 m!164245))

(declare-fun m!164247 () Bool)

(assert (=> b!110658 m!164247))

(declare-fun m!164249 () Bool)

(assert (=> b!110655 m!164249))

(check-sat (not b!110657) (not b!110656) (not b!110654) (not b!110658) (not b!110655) (not start!21942))
