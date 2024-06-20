; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21866 () Bool)

(assert start!21866)

(declare-fun b!110360 () Bool)

(declare-fun e!72364 () Bool)

(assert (=> b!110360 (= e!72364 true)))

(declare-datatypes ((array!5046 0))(
  ( (array!5047 (arr!2888 (Array (_ BitVec 32) (_ BitVec 8))) (size!2295 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4064 0))(
  ( (BitStream!4065 (buf!2689 array!5046) (currentByte!5243 (_ BitVec 32)) (currentBit!5238 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9184 0))(
  ( (tuple2!9185 (_1!4849 BitStream!4064) (_2!4849 BitStream!4064)) )
))
(declare-fun lt!167075 () tuple2!9184)

(declare-fun thiss!1305 () BitStream!4064)

(declare-fun reader!0 (BitStream!4064 BitStream!4064) tuple2!9184)

(assert (=> b!110360 (= lt!167075 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110361 () Bool)

(declare-fun res!91101 () Bool)

(declare-fun e!72366 () Bool)

(assert (=> b!110361 (=> (not res!91101) (not e!72366))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!110361 (= res!91101 (bvsge i!615 nBits!396))))

(declare-fun res!91102 () Bool)

(declare-fun e!72367 () Bool)

(assert (=> start!21866 (=> (not res!91102) (not e!72367))))

(assert (=> start!21866 (= res!91102 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21866 e!72367))

(assert (=> start!21866 true))

(declare-fun e!72368 () Bool)

(declare-fun inv!12 (BitStream!4064) Bool)

(assert (=> start!21866 (and (inv!12 thiss!1305) e!72368)))

(declare-fun b!110362 () Bool)

(declare-fun res!91105 () Bool)

(assert (=> b!110362 (=> (not res!91105) (not e!72366))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110362 (= res!91105 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110363 () Bool)

(assert (=> b!110363 (= e!72366 (not e!72364))))

(declare-fun res!91103 () Bool)

(assert (=> b!110363 (=> res!91103 e!72364)))

(declare-fun lt!167077 () (_ BitVec 64))

(declare-fun lt!167076 () (_ BitVec 64))

(assert (=> b!110363 (= res!91103 (not (= lt!167077 (bvadd lt!167077 lt!167076))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110363 (= lt!167077 (bitIndex!0 (size!2295 (buf!2689 thiss!1305)) (currentByte!5243 thiss!1305) (currentBit!5238 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4064 BitStream!4064) Bool)

(assert (=> b!110363 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6755 0))(
  ( (Unit!6756) )
))
(declare-fun lt!167078 () Unit!6755)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4064) Unit!6755)

(assert (=> b!110363 (= lt!167078 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110364 () Bool)

(assert (=> b!110364 (= e!72367 e!72366)))

(declare-fun res!91104 () Bool)

(assert (=> b!110364 (=> (not res!91104) (not e!72366))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110364 (= res!91104 (validate_offset_bits!1 ((_ sign_extend 32) (size!2295 (buf!2689 thiss!1305))) ((_ sign_extend 32) (currentByte!5243 thiss!1305)) ((_ sign_extend 32) (currentBit!5238 thiss!1305)) lt!167076))))

(assert (=> b!110364 (= lt!167076 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110365 () Bool)

(declare-fun array_inv!2097 (array!5046) Bool)

(assert (=> b!110365 (= e!72368 (array_inv!2097 (buf!2689 thiss!1305)))))

(assert (= (and start!21866 res!91102) b!110364))

(assert (= (and b!110364 res!91104) b!110362))

(assert (= (and b!110362 res!91105) b!110361))

(assert (= (and b!110361 res!91101) b!110363))

(assert (= (and b!110363 (not res!91103)) b!110360))

(assert (= start!21866 b!110365))

(declare-fun m!163933 () Bool)

(assert (=> b!110363 m!163933))

(declare-fun m!163935 () Bool)

(assert (=> b!110363 m!163935))

(declare-fun m!163937 () Bool)

(assert (=> b!110363 m!163937))

(declare-fun m!163939 () Bool)

(assert (=> b!110362 m!163939))

(declare-fun m!163941 () Bool)

(assert (=> b!110365 m!163941))

(declare-fun m!163943 () Bool)

(assert (=> b!110360 m!163943))

(declare-fun m!163945 () Bool)

(assert (=> b!110364 m!163945))

(declare-fun m!163947 () Bool)

(assert (=> start!21866 m!163947))

(push 1)

(assert (not b!110365))

(assert (not b!110364))

(assert (not b!110360))

(assert (not b!110363))

(assert (not b!110362))

(assert (not start!21866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

