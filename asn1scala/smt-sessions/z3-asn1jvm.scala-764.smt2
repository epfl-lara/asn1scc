; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21864 () Bool)

(assert start!21864)

(declare-fun b!110342 () Bool)

(declare-fun e!72351 () Bool)

(declare-fun e!72352 () Bool)

(assert (=> b!110342 (= e!72351 (not e!72352))))

(declare-fun res!91090 () Bool)

(assert (=> b!110342 (=> res!91090 e!72352)))

(declare-fun lt!167063 () (_ BitVec 64))

(declare-fun lt!167066 () (_ BitVec 64))

(assert (=> b!110342 (= res!91090 (not (= lt!167063 (bvadd lt!167063 lt!167066))))))

(declare-datatypes ((array!5044 0))(
  ( (array!5045 (arr!2887 (Array (_ BitVec 32) (_ BitVec 8))) (size!2294 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4062 0))(
  ( (BitStream!4063 (buf!2688 array!5044) (currentByte!5242 (_ BitVec 32)) (currentBit!5237 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4062)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110342 (= lt!167063 (bitIndex!0 (size!2294 (buf!2688 thiss!1305)) (currentByte!5242 thiss!1305) (currentBit!5237 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4062 BitStream!4062) Bool)

(assert (=> b!110342 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6753 0))(
  ( (Unit!6754) )
))
(declare-fun lt!167065 () Unit!6753)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4062) Unit!6753)

(assert (=> b!110342 (= lt!167065 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun res!91087 () Bool)

(declare-fun e!72350 () Bool)

(assert (=> start!21864 (=> (not res!91087) (not e!72350))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21864 (= res!91087 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21864 e!72350))

(assert (=> start!21864 true))

(declare-fun e!72353 () Bool)

(declare-fun inv!12 (BitStream!4062) Bool)

(assert (=> start!21864 (and (inv!12 thiss!1305) e!72353)))

(declare-fun b!110343 () Bool)

(assert (=> b!110343 (= e!72350 e!72351)))

(declare-fun res!91088 () Bool)

(assert (=> b!110343 (=> (not res!91088) (not e!72351))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110343 (= res!91088 (validate_offset_bits!1 ((_ sign_extend 32) (size!2294 (buf!2688 thiss!1305))) ((_ sign_extend 32) (currentByte!5242 thiss!1305)) ((_ sign_extend 32) (currentBit!5237 thiss!1305)) lt!167066))))

(assert (=> b!110343 (= lt!167066 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110344 () Bool)

(declare-fun array_inv!2096 (array!5044) Bool)

(assert (=> b!110344 (= e!72353 (array_inv!2096 (buf!2688 thiss!1305)))))

(declare-fun b!110345 () Bool)

(declare-fun res!91089 () Bool)

(assert (=> b!110345 (=> (not res!91089) (not e!72351))))

(assert (=> b!110345 (= res!91089 (bvsge i!615 nBits!396))))

(declare-fun b!110346 () Bool)

(assert (=> b!110346 (= e!72352 true)))

(declare-datatypes ((tuple2!9182 0))(
  ( (tuple2!9183 (_1!4848 BitStream!4062) (_2!4848 BitStream!4062)) )
))
(declare-fun lt!167064 () tuple2!9182)

(declare-fun reader!0 (BitStream!4062 BitStream!4062) tuple2!9182)

(assert (=> b!110346 (= lt!167064 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110347 () Bool)

(declare-fun res!91086 () Bool)

(assert (=> b!110347 (=> (not res!91086) (not e!72351))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110347 (= res!91086 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!21864 res!91087) b!110343))

(assert (= (and b!110343 res!91088) b!110347))

(assert (= (and b!110347 res!91086) b!110345))

(assert (= (and b!110345 res!91089) b!110342))

(assert (= (and b!110342 (not res!91090)) b!110346))

(assert (= start!21864 b!110344))

(declare-fun m!163917 () Bool)

(assert (=> b!110344 m!163917))

(declare-fun m!163919 () Bool)

(assert (=> start!21864 m!163919))

(declare-fun m!163921 () Bool)

(assert (=> b!110346 m!163921))

(declare-fun m!163923 () Bool)

(assert (=> b!110347 m!163923))

(declare-fun m!163925 () Bool)

(assert (=> b!110342 m!163925))

(declare-fun m!163927 () Bool)

(assert (=> b!110342 m!163927))

(declare-fun m!163929 () Bool)

(assert (=> b!110342 m!163929))

(declare-fun m!163931 () Bool)

(assert (=> b!110343 m!163931))

(check-sat (not b!110347) (not b!110343) (not b!110342) (not start!21864) (not b!110346) (not b!110344))
(check-sat)
