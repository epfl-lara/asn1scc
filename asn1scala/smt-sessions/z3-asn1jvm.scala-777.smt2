; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22334 () Bool)

(assert start!22334)

(declare-fun b!112932 () Bool)

(declare-fun e!74103 () Bool)

(declare-datatypes ((array!5125 0))(
  ( (array!5126 (arr!2923 (Array (_ BitVec 32) (_ BitVec 8))) (size!2330 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4134 0))(
  ( (BitStream!4135 (buf!2738 array!5125) (currentByte!5312 (_ BitVec 32)) (currentBit!5307 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4134)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112932 (= e!74103 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2330 (buf!2738 thiss!1305))) ((_ sign_extend 32) (currentByte!5312 thiss!1305)) ((_ sign_extend 32) (currentBit!5307 thiss!1305)))))))

(declare-fun b!112934 () Bool)

(declare-fun e!74102 () Bool)

(declare-fun array_inv!2132 (array!5125) Bool)

(assert (=> b!112934 (= e!74102 (array_inv!2132 (buf!2738 thiss!1305)))))

(declare-fun b!112935 () Bool)

(declare-fun res!93245 () Bool)

(assert (=> b!112935 (=> (not res!93245) (not e!74103))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112935 (= res!93245 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!112936 () Bool)

(declare-fun res!93244 () Bool)

(assert (=> b!112936 (=> (not res!93244) (not e!74103))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!112936 (= res!93244 (bvslt i!615 nBits!396))))

(declare-fun b!112933 () Bool)

(declare-fun res!93242 () Bool)

(assert (=> b!112933 (=> (not res!93242) (not e!74103))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112933 (= res!93242 (validate_offset_bits!1 ((_ sign_extend 32) (size!2330 (buf!2738 thiss!1305))) ((_ sign_extend 32) (currentByte!5312 thiss!1305)) ((_ sign_extend 32) (currentBit!5307 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun res!93243 () Bool)

(assert (=> start!22334 (=> (not res!93243) (not e!74103))))

(assert (=> start!22334 (= res!93243 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22334 e!74103))

(assert (=> start!22334 true))

(declare-fun inv!12 (BitStream!4134) Bool)

(assert (=> start!22334 (and (inv!12 thiss!1305) e!74102)))

(assert (= (and start!22334 res!93243) b!112933))

(assert (= (and b!112933 res!93242) b!112935))

(assert (= (and b!112935 res!93245) b!112936))

(assert (= (and b!112936 res!93244) b!112932))

(assert (= start!22334 b!112934))

(declare-fun m!168995 () Bool)

(assert (=> b!112933 m!168995))

(declare-fun m!168997 () Bool)

(assert (=> b!112935 m!168997))

(declare-fun m!168999 () Bool)

(assert (=> start!22334 m!168999))

(declare-fun m!169001 () Bool)

(assert (=> b!112934 m!169001))

(declare-fun m!169003 () Bool)

(assert (=> b!112932 m!169003))

(check-sat (not b!112934) (not b!112932) (not start!22334) (not b!112935) (not b!112933))
(check-sat)
(get-model)

(declare-fun d!36366 () Bool)

(assert (=> d!36366 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!112935 d!36366))

(declare-fun d!36368 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36368 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2330 (buf!2738 thiss!1305))) ((_ sign_extend 32) (currentByte!5312 thiss!1305)) ((_ sign_extend 32) (currentBit!5307 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2330 (buf!2738 thiss!1305))) ((_ sign_extend 32) (currentByte!5312 thiss!1305)) ((_ sign_extend 32) (currentBit!5307 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8835 () Bool)

(assert (= bs!8835 d!36368))

(declare-fun m!169015 () Bool)

(assert (=> bs!8835 m!169015))

(assert (=> b!112932 d!36368))

(declare-fun d!36372 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!36372 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5307 thiss!1305) (currentByte!5312 thiss!1305) (size!2330 (buf!2738 thiss!1305))))))

(declare-fun bs!8836 () Bool)

(assert (= bs!8836 d!36372))

(declare-fun m!169017 () Bool)

(assert (=> bs!8836 m!169017))

(assert (=> start!22334 d!36372))

(declare-fun d!36378 () Bool)

(assert (=> d!36378 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2330 (buf!2738 thiss!1305))) ((_ sign_extend 32) (currentByte!5312 thiss!1305)) ((_ sign_extend 32) (currentBit!5307 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2330 (buf!2738 thiss!1305))) ((_ sign_extend 32) (currentByte!5312 thiss!1305)) ((_ sign_extend 32) (currentBit!5307 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8838 () Bool)

(assert (= bs!8838 d!36378))

(assert (=> bs!8838 m!169015))

(assert (=> b!112933 d!36378))

(declare-fun d!36382 () Bool)

(assert (=> d!36382 (= (array_inv!2132 (buf!2738 thiss!1305)) (bvsge (size!2330 (buf!2738 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!112934 d!36382))

(check-sat (not d!36378) (not d!36372) (not d!36368))
(check-sat)
