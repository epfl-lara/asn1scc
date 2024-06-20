; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21752 () Bool)

(assert start!21752)

(declare-fun b!110055 () Bool)

(declare-fun e!72143 () Bool)

(declare-datatypes ((array!5010 0))(
  ( (array!5011 (arr!2873 (Array (_ BitVec 32) (_ BitVec 8))) (size!2280 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4034 0))(
  ( (BitStream!4035 (buf!2674 array!5010) (currentByte!5216 (_ BitVec 32)) (currentBit!5211 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4034)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!110055 (= e!72143 (not (invariant!0 (currentBit!5211 thiss!1305) (currentByte!5216 thiss!1305) (size!2280 (buf!2674 thiss!1305)))))))

(declare-fun isPrefixOf!0 (BitStream!4034 BitStream!4034) Bool)

(assert (=> b!110055 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6725 0))(
  ( (Unit!6726) )
))
(declare-fun lt!166925 () Unit!6725)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4034) Unit!6725)

(assert (=> b!110055 (= lt!166925 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110056 () Bool)

(declare-fun e!72141 () Bool)

(declare-fun array_inv!2082 (array!5010) Bool)

(assert (=> b!110056 (= e!72141 (array_inv!2082 (buf!2674 thiss!1305)))))

(declare-fun b!110057 () Bool)

(declare-fun res!90841 () Bool)

(assert (=> b!110057 (=> (not res!90841) (not e!72143))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110057 (= res!90841 (validate_offset_bits!1 ((_ sign_extend 32) (size!2280 (buf!2674 thiss!1305))) ((_ sign_extend 32) (currentByte!5216 thiss!1305)) ((_ sign_extend 32) (currentBit!5211 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!110058 () Bool)

(declare-fun res!90843 () Bool)

(assert (=> b!110058 (=> (not res!90843) (not e!72143))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110058 (= res!90843 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!90842 () Bool)

(assert (=> start!21752 (=> (not res!90842) (not e!72143))))

(assert (=> start!21752 (= res!90842 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21752 e!72143))

(assert (=> start!21752 true))

(declare-fun inv!12 (BitStream!4034) Bool)

(assert (=> start!21752 (and (inv!12 thiss!1305) e!72141)))

(declare-fun b!110059 () Bool)

(declare-fun res!90844 () Bool)

(assert (=> b!110059 (=> (not res!90844) (not e!72143))))

(assert (=> b!110059 (= res!90844 (bvsge i!615 nBits!396))))

(assert (= (and start!21752 res!90842) b!110057))

(assert (= (and b!110057 res!90841) b!110058))

(assert (= (and b!110058 res!90843) b!110059))

(assert (= (and b!110059 res!90844) b!110055))

(assert (= start!21752 b!110056))

(declare-fun m!163659 () Bool)

(assert (=> b!110058 m!163659))

(declare-fun m!163661 () Bool)

(assert (=> b!110055 m!163661))

(declare-fun m!163663 () Bool)

(assert (=> b!110055 m!163663))

(declare-fun m!163665 () Bool)

(assert (=> b!110055 m!163665))

(declare-fun m!163667 () Bool)

(assert (=> start!21752 m!163667))

(declare-fun m!163669 () Bool)

(assert (=> b!110056 m!163669))

(declare-fun m!163671 () Bool)

(assert (=> b!110057 m!163671))

(push 1)

(assert (not start!21752))

(assert (not b!110056))

(assert (not b!110058))

(assert (not b!110057))

(assert (not b!110055))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!34660 () Bool)

(assert (=> d!34660 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!110058 d!34660))

(declare-fun d!34664 () Bool)

(assert (=> d!34664 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5211 thiss!1305) (currentByte!5216 thiss!1305) (size!2280 (buf!2674 thiss!1305))))))

(declare-fun bs!8467 () Bool)

(assert (= bs!8467 d!34664))

(assert (=> bs!8467 m!163661))

(assert (=> start!21752 d!34664))

(declare-fun d!34668 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34668 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2280 (buf!2674 thiss!1305))) ((_ sign_extend 32) (currentByte!5216 thiss!1305)) ((_ sign_extend 32) (currentBit!5211 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2280 (buf!2674 thiss!1305))) ((_ sign_extend 32) (currentByte!5216 thiss!1305)) ((_ sign_extend 32) (currentBit!5211 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8468 () Bool)

(assert (= bs!8468 d!34668))

(declare-fun m!163675 () Bool)

(assert (=> bs!8468 m!163675))

(assert (=> b!110057 d!34668))

(declare-fun d!34670 () Bool)

(assert (=> d!34670 (= (array_inv!2082 (buf!2674 thiss!1305)) (bvsge (size!2280 (buf!2674 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!110056 d!34670))

(declare-fun d!34674 () Bool)

(assert (=> d!34674 (= (invariant!0 (currentBit!5211 thiss!1305) (currentByte!5216 thiss!1305) (size!2280 (buf!2674 thiss!1305))) (and (bvsge (currentBit!5211 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5211 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5216 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5216 thiss!1305) (size!2280 (buf!2674 thiss!1305))) (and (= (currentBit!5211 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5216 thiss!1305) (size!2280 (buf!2674 thiss!1305)))))))))

(assert (=> b!110055 d!34674))

(declare-fun d!34676 () Bool)

(declare-fun res!90869 () Bool)

(declare-fun e!72161 () Bool)

(assert (=> d!34676 (=> (not res!90869) (not e!72161))))

(assert (=> d!34676 (= res!90869 (= (size!2280 (buf!2674 thiss!1305)) (size!2280 (buf!2674 thiss!1305))))))

(assert (=> d!34676 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!72161)))

(declare-fun b!110084 () Bool)

(declare-fun res!90870 () Bool)

(assert (=> b!110084 (=> (not res!90870) (not e!72161))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110084 (= res!90870 (bvsle (bitIndex!0 (size!2280 (buf!2674 thiss!1305)) (currentByte!5216 thiss!1305) (currentBit!5211 thiss!1305)) (bitIndex!0 (size!2280 (buf!2674 thiss!1305)) (currentByte!5216 thiss!1305) (currentBit!5211 thiss!1305))))))

(declare-fun b!110085 () Bool)

(declare-fun e!72160 () Bool)

(assert (=> b!110085 (= e!72161 e!72160)))

(declare-fun res!90871 () Bool)

(assert (=> b!110085 (=> res!90871 e!72160)))

