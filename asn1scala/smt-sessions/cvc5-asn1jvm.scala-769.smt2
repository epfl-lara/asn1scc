; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21946 () Bool)

(assert start!21946)

(declare-fun res!91381 () Bool)

(declare-fun e!72618 () Bool)

(assert (=> start!21946 (=> (not res!91381) (not e!72618))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21946 (= res!91381 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21946 e!72618))

(assert (=> start!21946 true))

(declare-datatypes ((array!5075 0))(
  ( (array!5076 (arr!2901 (Array (_ BitVec 32) (_ BitVec 8))) (size!2308 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4090 0))(
  ( (BitStream!4091 (buf!2705 array!5075) (currentByte!5262 (_ BitVec 32)) (currentBit!5257 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4090)

(declare-fun e!72620 () Bool)

(declare-fun inv!12 (BitStream!4090) Bool)

(assert (=> start!21946 (and (inv!12 thiss!1305) e!72620)))

(declare-fun b!110693 () Bool)

(declare-fun e!72619 () Bool)

(assert (=> b!110693 (= e!72618 e!72619)))

(declare-fun res!91377 () Bool)

(assert (=> b!110693 (=> (not res!91377) (not e!72619))))

(declare-fun lt!167528 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110693 (= res!91377 (validate_offset_bits!1 ((_ sign_extend 32) (size!2308 (buf!2705 thiss!1305))) ((_ sign_extend 32) (currentByte!5262 thiss!1305)) ((_ sign_extend 32) (currentBit!5257 thiss!1305)) lt!167528))))

(assert (=> b!110693 (= lt!167528 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110694 () Bool)

(declare-fun array_inv!2110 (array!5075) Bool)

(assert (=> b!110694 (= e!72620 (array_inv!2110 (buf!2705 thiss!1305)))))

(declare-fun b!110695 () Bool)

(declare-fun e!72623 () Bool)

(declare-fun e!72622 () Bool)

(assert (=> b!110695 (= e!72623 e!72622)))

(declare-fun res!91378 () Bool)

(assert (=> b!110695 (=> res!91378 e!72622)))

(declare-datatypes ((tuple2!9210 0))(
  ( (tuple2!9211 (_1!4862 BitStream!4090) (_2!4862 BitStream!4090)) )
))
(declare-fun lt!167531 () tuple2!9210)

(assert (=> b!110695 (= res!91378 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2308 (buf!2705 (_1!4862 lt!167531)))) ((_ sign_extend 32) (currentByte!5262 (_1!4862 lt!167531))) ((_ sign_extend 32) (currentBit!5257 (_1!4862 lt!167531))) lt!167528)))))

(declare-datatypes ((Unit!6784 0))(
  ( (Unit!6785) )
))
(declare-fun lt!167533 () Unit!6784)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4090 array!5075 (_ BitVec 64)) Unit!6784)

(assert (=> b!110695 (= lt!167533 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2705 thiss!1305) lt!167528))))

(declare-fun lt!167529 () (_ BitVec 64))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun lt!167532 () (_ BitVec 64))

(assert (=> b!110695 (= lt!167529 (bvand v!199 (bvnot lt!167532)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110695 (= lt!167532 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun reader!0 (BitStream!4090 BitStream!4090) tuple2!9210)

(assert (=> b!110695 (= lt!167531 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110696 () Bool)

(declare-fun e!72617 () Bool)

(assert (=> b!110696 (= e!72617 (not e!72623))))

(declare-fun res!91379 () Bool)

(assert (=> b!110696 (=> res!91379 e!72623)))

(declare-fun lt!167530 () (_ BitVec 64))

(assert (=> b!110696 (= res!91379 (not (= lt!167530 (bvadd lt!167530 lt!167528))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110696 (= lt!167530 (bitIndex!0 (size!2308 (buf!2705 thiss!1305)) (currentByte!5262 thiss!1305) (currentBit!5257 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4090 BitStream!4090) Bool)

(assert (=> b!110696 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!167527 () Unit!6784)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4090) Unit!6784)

(assert (=> b!110696 (= lt!167527 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110697 () Bool)

(assert (=> b!110697 (= e!72619 e!72617)))

(declare-fun res!91380 () Bool)

(assert (=> b!110697 (=> (not res!91380) (not e!72617))))

(declare-fun lt!167534 () (_ BitVec 64))

(assert (=> b!110697 (= res!91380 (and (= (bvand v!199 lt!167534) v!199) (bvsge i!615 nBits!396)))))

(assert (=> b!110697 (= lt!167534 (onesLSBLong!0 nBits!396))))

(declare-fun b!110698 () Bool)

(assert (=> b!110698 (= e!72622 (or (not (= (bvand lt!167529 lt!167532) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167529 lt!167534) lt!167529)))))

(assert (= (and start!21946 res!91381) b!110693))

(assert (= (and b!110693 res!91377) b!110697))

(assert (= (and b!110697 res!91380) b!110696))

(assert (= (and b!110696 (not res!91379)) b!110695))

(assert (= (and b!110695 (not res!91378)) b!110698))

(assert (= start!21946 b!110694))

(declare-fun m!164273 () Bool)

(assert (=> b!110695 m!164273))

(declare-fun m!164275 () Bool)

(assert (=> b!110695 m!164275))

(declare-fun m!164277 () Bool)

(assert (=> b!110695 m!164277))

(declare-fun m!164279 () Bool)

(assert (=> b!110695 m!164279))

(declare-fun m!164281 () Bool)

(assert (=> b!110693 m!164281))

(declare-fun m!164283 () Bool)

(assert (=> b!110696 m!164283))

(declare-fun m!164285 () Bool)

(assert (=> b!110696 m!164285))

(declare-fun m!164287 () Bool)

(assert (=> b!110696 m!164287))

(declare-fun m!164289 () Bool)

(assert (=> b!110694 m!164289))

(declare-fun m!164291 () Bool)

(assert (=> b!110697 m!164291))

(declare-fun m!164293 () Bool)

(assert (=> start!21946 m!164293))

(push 1)

(assert (not b!110694))

(assert (not b!110695))

(assert (not b!110697))

(assert (not b!110693))

(assert (not b!110696))

(assert (not start!21946))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

