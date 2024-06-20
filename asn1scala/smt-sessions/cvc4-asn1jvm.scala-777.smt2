; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22336 () Bool)

(assert start!22336)

(declare-fun b!112947 () Bool)

(declare-fun res!93254 () Bool)

(declare-fun e!74112 () Bool)

(assert (=> b!112947 (=> (not res!93254) (not e!74112))))

(declare-datatypes ((array!5127 0))(
  ( (array!5128 (arr!2924 (Array (_ BitVec 32) (_ BitVec 8))) (size!2331 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4136 0))(
  ( (BitStream!4137 (buf!2739 array!5127) (currentByte!5313 (_ BitVec 32)) (currentBit!5308 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4136)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112947 (= res!93254 (validate_offset_bits!1 ((_ sign_extend 32) (size!2331 (buf!2739 thiss!1305))) ((_ sign_extend 32) (currentByte!5313 thiss!1305)) ((_ sign_extend 32) (currentBit!5308 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!112948 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112948 (= e!74112 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2331 (buf!2739 thiss!1305))) ((_ sign_extend 32) (currentByte!5313 thiss!1305)) ((_ sign_extend 32) (currentBit!5308 thiss!1305)))))))

(declare-fun b!112949 () Bool)

(declare-fun res!93257 () Bool)

(assert (=> b!112949 (=> (not res!93257) (not e!74112))))

(assert (=> b!112949 (= res!93257 (bvslt i!615 nBits!396))))

(declare-fun b!112950 () Bool)

(declare-fun res!93255 () Bool)

(assert (=> b!112950 (=> (not res!93255) (not e!74112))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112950 (= res!93255 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!93256 () Bool)

(assert (=> start!22336 (=> (not res!93256) (not e!74112))))

(assert (=> start!22336 (= res!93256 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22336 e!74112))

(assert (=> start!22336 true))

(declare-fun e!74110 () Bool)

(declare-fun inv!12 (BitStream!4136) Bool)

(assert (=> start!22336 (and (inv!12 thiss!1305) e!74110)))

(declare-fun b!112951 () Bool)

(declare-fun array_inv!2133 (array!5127) Bool)

(assert (=> b!112951 (= e!74110 (array_inv!2133 (buf!2739 thiss!1305)))))

(assert (= (and start!22336 res!93256) b!112947))

(assert (= (and b!112947 res!93254) b!112950))

(assert (= (and b!112950 res!93255) b!112949))

(assert (= (and b!112949 res!93257) b!112948))

(assert (= start!22336 b!112951))

(declare-fun m!169005 () Bool)

(assert (=> start!22336 m!169005))

(declare-fun m!169007 () Bool)

(assert (=> b!112948 m!169007))

(declare-fun m!169009 () Bool)

(assert (=> b!112951 m!169009))

(declare-fun m!169011 () Bool)

(assert (=> b!112947 m!169011))

(declare-fun m!169013 () Bool)

(assert (=> b!112950 m!169013))

(push 1)

(assert (not start!22336))

(assert (not b!112951))

(assert (not b!112950))

(assert (not b!112948))

(assert (not b!112947))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!36386 () Bool)

(assert (=> d!36386 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!112950 d!36386))

(declare-fun d!36388 () Bool)

(assert (=> d!36388 (= (array_inv!2133 (buf!2739 thiss!1305)) (bvsge (size!2331 (buf!2739 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!112951 d!36388))

(declare-fun d!36390 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!36390 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5308 thiss!1305) (currentByte!5313 thiss!1305) (size!2331 (buf!2739 thiss!1305))))))

(declare-fun bs!8841 () Bool)

(assert (= bs!8841 d!36390))

(declare-fun m!169023 () Bool)

(assert (=> bs!8841 m!169023))

(assert (=> start!22336 d!36390))

(declare-fun d!36392 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36392 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2331 (buf!2739 thiss!1305))) ((_ sign_extend 32) (currentByte!5313 thiss!1305)) ((_ sign_extend 32) (currentBit!5308 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2331 (buf!2739 thiss!1305))) ((_ sign_extend 32) (currentByte!5313 thiss!1305)) ((_ sign_extend 32) (currentBit!5308 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8842 () Bool)

(assert (= bs!8842 d!36392))

(declare-fun m!169025 () Bool)

(assert (=> bs!8842 m!169025))

(assert (=> b!112947 d!36392))

(declare-fun d!36394 () Bool)

(assert (=> d!36394 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2331 (buf!2739 thiss!1305))) ((_ sign_extend 32) (currentByte!5313 thiss!1305)) ((_ sign_extend 32) (currentBit!5308 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2331 (buf!2739 thiss!1305))) ((_ sign_extend 32) (currentByte!5313 thiss!1305)) ((_ sign_extend 32) (currentBit!5308 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8843 () Bool)

(assert (= bs!8843 d!36394))

(assert (=> bs!8843 m!169025))

(assert (=> b!112948 d!36394))

(push 1)

