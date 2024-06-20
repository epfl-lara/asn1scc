; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37650 () Bool)

(assert start!37650)

(declare-fun res!141743 () Bool)

(declare-fun e!119214 () Bool)

(assert (=> start!37650 (=> (not res!141743) (not e!119214))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37650 (= res!141743 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37650 e!119214))

(assert (=> start!37650 true))

(declare-datatypes ((array!9061 0))(
  ( (array!9062 (arr!4942 (Array (_ BitVec 32) (_ BitVec 8))) (size!4012 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7162 0))(
  ( (BitStream!7163 (buf!4455 array!9061) (currentByte!8442 (_ BitVec 32)) (currentBit!8437 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7162)

(declare-fun e!119215 () Bool)

(declare-fun inv!12 (BitStream!7162) Bool)

(assert (=> start!37650 (and (inv!12 bs!64) e!119215)))

(declare-fun b!170824 () Bool)

(declare-fun res!141744 () Bool)

(assert (=> b!170824 (=> (not res!141744) (not e!119214))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170824 (= res!141744 (validate_offset_bits!1 ((_ sign_extend 32) (size!4012 (buf!4455 bs!64))) ((_ sign_extend 32) (currentByte!8442 bs!64)) ((_ sign_extend 32) (currentBit!8437 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!170825 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170825 (= e!119214 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!4012 (buf!4455 bs!64))) ((_ sign_extend 32) (currentByte!8442 bs!64)) ((_ sign_extend 32) (currentBit!8437 bs!64)))))))

(declare-fun expected!82 () Bool)

(declare-datatypes ((tuple2!14660 0))(
  ( (tuple2!14661 (_1!7963 BitStream!7162) (_2!7963 Bool)) )
))
(declare-fun lt!263348 () tuple2!14660)

(declare-fun checkBitsLoopPure!0 (BitStream!7162 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14660)

(assert (=> b!170825 (= lt!263348 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(declare-fun b!170826 () Bool)

(declare-fun array_inv!3753 (array!9061) Bool)

(assert (=> b!170826 (= e!119215 (array_inv!3753 (buf!4455 bs!64)))))

(assert (= (and start!37650 res!141743) b!170824))

(assert (= (and b!170824 res!141744) b!170825))

(assert (= start!37650 b!170826))

(declare-fun m!269959 () Bool)

(assert (=> start!37650 m!269959))

(declare-fun m!269961 () Bool)

(assert (=> b!170824 m!269961))

(declare-fun m!269963 () Bool)

(assert (=> b!170825 m!269963))

(declare-fun m!269965 () Bool)

(assert (=> b!170825 m!269965))

(declare-fun m!269967 () Bool)

(assert (=> b!170826 m!269967))

(push 1)

(assert (not b!170825))

(assert (not start!37650))

(assert (not b!170824))

(assert (not b!170826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60329 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!60329 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!4012 (buf!4455 bs!64))) ((_ sign_extend 32) (currentByte!8442 bs!64)) ((_ sign_extend 32) (currentBit!8437 bs!64))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4012 (buf!4455 bs!64))) ((_ sign_extend 32) (currentByte!8442 bs!64)) ((_ sign_extend 32) (currentBit!8437 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!15010 () Bool)

(assert (= bs!15010 d!60329))

(declare-fun m!269989 () Bool)

(assert (=> bs!15010 m!269989))

(assert (=> b!170825 d!60329))

(declare-datatypes ((tuple2!14666 0))(
  ( (tuple2!14667 (_1!7966 Bool) (_2!7966 BitStream!7162)) )
))
(declare-fun lt!263357 () tuple2!14666)

(declare-fun d!60331 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!7162 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14666)

(assert (=> d!60331 (= lt!263357 (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235))))

(assert (=> d!60331 (= (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235) (tuple2!14661 (_2!7966 lt!263357) (_1!7966 lt!263357)))))

(declare-fun bs!15011 () Bool)

(assert (= bs!15011 d!60331))

(declare-fun m!269991 () Bool)

(assert (=> bs!15011 m!269991))

(assert (=> b!170825 d!60331))

(declare-fun d!60333 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60333 (= (inv!12 bs!64) (invariant!0 (currentBit!8437 bs!64) (currentByte!8442 bs!64) (size!4012 (buf!4455 bs!64))))))

(declare-fun bs!15012 () Bool)

(assert (= bs!15012 d!60333))

(declare-fun m!269993 () Bool)

(assert (=> bs!15012 m!269993))

(assert (=> start!37650 d!60333))

(declare-fun d!60339 () Bool)

(assert (=> d!60339 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4012 (buf!4455 bs!64))) ((_ sign_extend 32) (currentByte!8442 bs!64)) ((_ sign_extend 32) (currentBit!8437 bs!64)) (bvsub nBits!283 from!235)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4012 (buf!4455 bs!64))) ((_ sign_extend 32) (currentByte!8442 bs!64)) ((_ sign_extend 32) (currentBit!8437 bs!64))) (bvsub nBits!283 from!235)))))

(declare-fun bs!15014 () Bool)

(assert (= bs!15014 d!60339))

(assert (=> bs!15014 m!269989))

(assert (=> b!170824 d!60339))

(declare-fun d!60343 () Bool)

(assert (=> d!60343 (= (array_inv!3753 (buf!4455 bs!64)) (bvsge (size!4012 (buf!4455 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!170826 d!60343))

(push 1)

(assert (not d!60329))

(assert (not d!60339))

(assert (not d!60331))

(assert (not d!60333))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

