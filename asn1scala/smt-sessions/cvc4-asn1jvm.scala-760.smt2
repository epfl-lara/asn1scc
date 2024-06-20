; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21800 () Bool)

(assert start!21800)

(declare-fun b!110127 () Bool)

(declare-fun res!90905 () Bool)

(declare-fun e!72188 () Bool)

(assert (=> b!110127 (=> (not res!90905) (not e!72188))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110127 (= res!90905 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110128 () Bool)

(declare-fun res!90906 () Bool)

(assert (=> b!110128 (=> (not res!90906) (not e!72188))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!110128 (= res!90906 (bvsge i!615 nBits!396))))

(declare-fun b!110129 () Bool)

(declare-fun res!90904 () Bool)

(assert (=> b!110129 (=> (not res!90904) (not e!72188))))

(declare-datatypes ((array!5019 0))(
  ( (array!5020 (arr!2876 (Array (_ BitVec 32) (_ BitVec 8))) (size!2283 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4040 0))(
  ( (BitStream!4041 (buf!2677 array!5019) (currentByte!5225 (_ BitVec 32)) (currentBit!5220 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4040)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110129 (= res!90904 (validate_offset_bits!1 ((_ sign_extend 32) (size!2283 (buf!2677 thiss!1305))) ((_ sign_extend 32) (currentByte!5225 thiss!1305)) ((_ sign_extend 32) (currentBit!5220 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!110130 () Bool)

(declare-fun e!72187 () Bool)

(declare-fun array_inv!2085 (array!5019) Bool)

(assert (=> b!110130 (= e!72187 (array_inv!2085 (buf!2677 thiss!1305)))))

(declare-fun b!110131 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!110131 (= e!72188 (not (invariant!0 (currentBit!5220 thiss!1305) (currentByte!5225 thiss!1305) (size!2283 (buf!2677 thiss!1305)))))))

(declare-fun isPrefixOf!0 (BitStream!4040 BitStream!4040) Bool)

(assert (=> b!110131 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6731 0))(
  ( (Unit!6732) )
))
(declare-fun lt!166943 () Unit!6731)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4040) Unit!6731)

(assert (=> b!110131 (= lt!166943 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun res!90907 () Bool)

(assert (=> start!21800 (=> (not res!90907) (not e!72188))))

(assert (=> start!21800 (= res!90907 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21800 e!72188))

(assert (=> start!21800 true))

(declare-fun inv!12 (BitStream!4040) Bool)

(assert (=> start!21800 (and (inv!12 thiss!1305) e!72187)))

(assert (= (and start!21800 res!90907) b!110129))

(assert (= (and b!110129 res!90904) b!110127))

(assert (= (and b!110127 res!90905) b!110128))

(assert (= (and b!110128 res!90906) b!110131))

(assert (= start!21800 b!110130))

(declare-fun m!163725 () Bool)

(assert (=> b!110131 m!163725))

(declare-fun m!163727 () Bool)

(assert (=> b!110131 m!163727))

(declare-fun m!163729 () Bool)

(assert (=> b!110131 m!163729))

(declare-fun m!163731 () Bool)

(assert (=> b!110130 m!163731))

(declare-fun m!163733 () Bool)

(assert (=> b!110127 m!163733))

(declare-fun m!163735 () Bool)

(assert (=> b!110129 m!163735))

(declare-fun m!163737 () Bool)

(assert (=> start!21800 m!163737))

(push 1)

(assert (not b!110129))

(assert (not b!110130))

(assert (not b!110127))

(assert (not start!21800))

(assert (not b!110131))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!34704 () Bool)

(assert (=> d!34704 (= (array_inv!2085 (buf!2677 thiss!1305)) (bvsge (size!2283 (buf!2677 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!110130 d!34704))

(declare-fun d!34706 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34706 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2283 (buf!2677 thiss!1305))) ((_ sign_extend 32) (currentByte!5225 thiss!1305)) ((_ sign_extend 32) (currentBit!5220 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2283 (buf!2677 thiss!1305))) ((_ sign_extend 32) (currentByte!5225 thiss!1305)) ((_ sign_extend 32) (currentBit!5220 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8480 () Bool)

(assert (= bs!8480 d!34706))

(declare-fun m!163739 () Bool)

(assert (=> bs!8480 m!163739))

(assert (=> b!110129 d!34706))

(declare-fun d!34708 () Bool)

(assert (=> d!34708 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5220 thiss!1305) (currentByte!5225 thiss!1305) (size!2283 (buf!2677 thiss!1305))))))

(declare-fun bs!8481 () Bool)

(assert (= bs!8481 d!34708))

(assert (=> bs!8481 m!163725))

(assert (=> start!21800 d!34708))

(declare-fun d!34710 () Bool)

(assert (=> d!34710 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!110127 d!34710))

(declare-fun d!34712 () Bool)

(assert (=> d!34712 (= (invariant!0 (currentBit!5220 thiss!1305) (currentByte!5225 thiss!1305) (size!2283 (buf!2677 thiss!1305))) (and (bvsge (currentBit!5220 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5220 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5225 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5225 thiss!1305) (size!2283 (buf!2677 thiss!1305))) (and (= (currentBit!5220 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5225 thiss!1305) (size!2283 (buf!2677 thiss!1305)))))))))

(assert (=> b!110131 d!34712))

(declare-fun d!34714 () Bool)

(declare-fun res!90932 () Bool)

(declare-fun e!72206 () Bool)

(assert (=> d!34714 (=> (not res!90932) (not e!72206))))

(assert (=> d!34714 (= res!90932 (= (size!2283 (buf!2677 thiss!1305)) (size!2283 (buf!2677 thiss!1305))))))

(assert (=> d!34714 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!72206)))

