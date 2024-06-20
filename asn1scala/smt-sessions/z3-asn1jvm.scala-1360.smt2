; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37652 () Bool)

(assert start!37652)

(declare-fun res!141749 () Bool)

(declare-fun e!119222 () Bool)

(assert (=> start!37652 (=> (not res!141749) (not e!119222))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37652 (= res!141749 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37652 e!119222))

(assert (=> start!37652 true))

(declare-datatypes ((array!9063 0))(
  ( (array!9064 (arr!4943 (Array (_ BitVec 32) (_ BitVec 8))) (size!4013 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7164 0))(
  ( (BitStream!7165 (buf!4456 array!9063) (currentByte!8443 (_ BitVec 32)) (currentBit!8438 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7164)

(declare-fun e!119223 () Bool)

(declare-fun inv!12 (BitStream!7164) Bool)

(assert (=> start!37652 (and (inv!12 bs!64) e!119223)))

(declare-fun b!170833 () Bool)

(declare-fun res!141750 () Bool)

(assert (=> b!170833 (=> (not res!141750) (not e!119222))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170833 (= res!141750 (validate_offset_bits!1 ((_ sign_extend 32) (size!4013 (buf!4456 bs!64))) ((_ sign_extend 32) (currentByte!8443 bs!64)) ((_ sign_extend 32) (currentBit!8438 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!170834 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170834 (= e!119222 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4013 (buf!4456 bs!64))) ((_ sign_extend 32) (currentByte!8443 bs!64)) ((_ sign_extend 32) (currentBit!8438 bs!64)))))))

(declare-datatypes ((tuple2!14662 0))(
  ( (tuple2!14663 (_1!7964 BitStream!7164) (_2!7964 Bool)) )
))
(declare-fun lt!263351 () tuple2!14662)

(declare-fun expected!82 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!7164 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14662)

(assert (=> b!170834 (= lt!263351 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!170835 () Bool)

(declare-fun array_inv!3754 (array!9063) Bool)

(assert (=> b!170835 (= e!119223 (array_inv!3754 (buf!4456 bs!64)))))

(assert (= (and start!37652 res!141749) b!170833))

(assert (= (and b!170833 res!141750) b!170834))

(assert (= start!37652 b!170835))

(declare-fun m!269969 () Bool)

(assert (=> start!37652 m!269969))

(declare-fun m!269971 () Bool)

(assert (=> b!170833 m!269971))

(declare-fun m!269973 () Bool)

(assert (=> b!170834 m!269973))

(declare-fun m!269975 () Bool)

(assert (=> b!170834 m!269975))

(declare-fun m!269977 () Bool)

(assert (=> b!170835 m!269977))

(check-sat (not b!170834) (not b!170835) (not start!37652) (not b!170833))
(check-sat)
(get-model)

(declare-fun d!60335 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!60335 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4013 (buf!4456 bs!64))) ((_ sign_extend 32) (currentByte!8443 bs!64)) ((_ sign_extend 32) (currentBit!8438 bs!64))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4013 (buf!4456 bs!64))) ((_ sign_extend 32) (currentByte!8443 bs!64)) ((_ sign_extend 32) (currentBit!8438 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!15013 () Bool)

(assert (= bs!15013 d!60335))

(declare-fun m!269995 () Bool)

(assert (=> bs!15013 m!269995))

(assert (=> b!170834 d!60335))

(declare-fun d!60341 () Bool)

(declare-datatypes ((tuple2!14668 0))(
  ( (tuple2!14669 (_1!7967 Bool) (_2!7967 BitStream!7164)) )
))
(declare-fun lt!263360 () tuple2!14668)

(declare-fun checkBitsLoop!0 (BitStream!7164 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14668)

(assert (=> d!60341 (= lt!263360 (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235))))

(assert (=> d!60341 (= (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235) (tuple2!14663 (_2!7967 lt!263360) (_1!7967 lt!263360)))))

(declare-fun bs!15018 () Bool)

(assert (= bs!15018 d!60341))

(declare-fun m!270001 () Bool)

(assert (=> bs!15018 m!270001))

(assert (=> b!170834 d!60341))

(declare-fun d!60353 () Bool)

(assert (=> d!60353 (= (array_inv!3754 (buf!4456 bs!64)) (bvsge (size!4013 (buf!4456 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!170835 d!60353))

(declare-fun d!60355 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60355 (= (inv!12 bs!64) (invariant!0 (currentBit!8438 bs!64) (currentByte!8443 bs!64) (size!4013 (buf!4456 bs!64))))))

(declare-fun bs!15019 () Bool)

(assert (= bs!15019 d!60355))

(declare-fun m!270003 () Bool)

(assert (=> bs!15019 m!270003))

(assert (=> start!37652 d!60355))

(declare-fun d!60357 () Bool)

(assert (=> d!60357 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4013 (buf!4456 bs!64))) ((_ sign_extend 32) (currentByte!8443 bs!64)) ((_ sign_extend 32) (currentBit!8438 bs!64)) (bvsub nBits!283 from!235)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4013 (buf!4456 bs!64))) ((_ sign_extend 32) (currentByte!8443 bs!64)) ((_ sign_extend 32) (currentBit!8438 bs!64))) (bvsub nBits!283 from!235)))))

(declare-fun bs!15021 () Bool)

(assert (= bs!15021 d!60357))

(assert (=> bs!15021 m!269995))

(assert (=> b!170833 d!60357))

(check-sat (not d!60357) (not d!60355) (not d!60335) (not d!60341))
(check-sat)
