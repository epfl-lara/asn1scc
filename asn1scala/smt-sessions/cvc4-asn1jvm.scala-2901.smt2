; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69506 () Bool)

(assert start!69506)

(declare-fun b!312363 () Bool)

(declare-fun e!224651 () Bool)

(declare-datatypes ((array!19127 0))(
  ( (array!19128 (arr!9372 (Array (_ BitVec 32) (_ BitVec 8))) (size!8292 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13688 0))(
  ( (BitStream!13689 (buf!7905 array!19127) (currentByte!14618 (_ BitVec 32)) (currentBit!14613 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13688)

(declare-fun array_inv!7844 (array!19127) Bool)

(assert (=> b!312363 (= e!224651 (array_inv!7844 (buf!7905 b2!97)))))

(declare-fun res!255845 () Bool)

(declare-fun e!224653 () Bool)

(assert (=> start!69506 (=> (not res!255845) (not e!224653))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b1!97 () BitStream!13688)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69506 (= res!255845 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8292 (buf!7905 b1!97)) (size!8292 (buf!7905 b2!97)))))))

(assert (=> start!69506 e!224653))

(assert (=> start!69506 true))

(declare-fun e!224650 () Bool)

(declare-fun inv!12 (BitStream!13688) Bool)

(assert (=> start!69506 (and (inv!12 b1!97) e!224650)))

(assert (=> start!69506 (and (inv!12 b2!97) e!224651)))

(declare-fun b!312361 () Bool)

(declare-fun lt!441926 () (_ BitVec 64))

(declare-fun lt!441925 () (_ BitVec 64))

(assert (=> b!312361 (= e!224653 (and (= lt!441926 (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!441926 (bvand (bvadd lt!441925 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!312361 (= lt!441926 (bvand lt!441925 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312361 (= lt!441925 (bitIndex!0 (size!8292 (buf!7905 b1!97)) (currentByte!14618 b1!97) (currentBit!14613 b1!97)))))

(declare-fun b!312360 () Bool)

(declare-fun res!255844 () Bool)

(assert (=> b!312360 (=> (not res!255844) (not e!224653))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312360 (= res!255844 (validate_offset_bits!1 ((_ sign_extend 32) (size!8292 (buf!7905 b1!97))) ((_ sign_extend 32) (currentByte!14618 b1!97)) ((_ sign_extend 32) (currentBit!14613 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312362 () Bool)

(assert (=> b!312362 (= e!224650 (array_inv!7844 (buf!7905 b1!97)))))

(assert (= (and start!69506 res!255845) b!312360))

(assert (= (and b!312360 res!255844) b!312361))

(assert (= start!69506 b!312362))

(assert (= start!69506 b!312363))

(declare-fun m!450035 () Bool)

(assert (=> b!312360 m!450035))

(declare-fun m!450037 () Bool)

(assert (=> b!312362 m!450037))

(declare-fun m!450039 () Bool)

(assert (=> start!69506 m!450039))

(declare-fun m!450041 () Bool)

(assert (=> start!69506 m!450041))

(declare-fun m!450043 () Bool)

(assert (=> b!312363 m!450043))

(declare-fun m!450045 () Bool)

(assert (=> b!312361 m!450045))

(push 1)

(assert (not b!312360))

(assert (not b!312361))

(assert (not b!312362))

(assert (not b!312363))

(assert (not start!69506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103754 () Bool)

(assert (=> d!103754 (= (array_inv!7844 (buf!7905 b1!97)) (bvsge (size!8292 (buf!7905 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!312362 d!103754))

(declare-fun d!103756 () Bool)

(declare-fun e!224662 () Bool)

(assert (=> d!103756 e!224662))

(declare-fun res!255863 () Bool)

(assert (=> d!103756 (=> (not res!255863) (not e!224662))))

(declare-fun lt!441975 () (_ BitVec 64))

(declare-fun lt!441980 () (_ BitVec 64))

(declare-fun lt!441976 () (_ BitVec 64))

(assert (=> d!103756 (= res!255863 (= lt!441975 (bvsub lt!441976 lt!441980)))))

(assert (=> d!103756 (or (= (bvand lt!441976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441976 lt!441980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!103756 (= lt!441980 (remainingBits!0 ((_ sign_extend 32) (size!8292 (buf!7905 b1!97))) ((_ sign_extend 32) (currentByte!14618 b1!97)) ((_ sign_extend 32) (currentBit!14613 b1!97))))))

(declare-fun lt!441978 () (_ BitVec 64))

(declare-fun lt!441979 () (_ BitVec 64))

(assert (=> d!103756 (= lt!441976 (bvmul lt!441978 lt!441979))))

(assert (=> d!103756 (or (= lt!441978 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441979 (bvsdiv (bvmul lt!441978 lt!441979) lt!441978)))))

(assert (=> d!103756 (= lt!441979 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103756 (= lt!441978 ((_ sign_extend 32) (size!8292 (buf!7905 b1!97))))))

(assert (=> d!103756 (= lt!441975 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14618 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14613 b1!97))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103756 (invariant!0 (currentBit!14613 b1!97) (currentByte!14618 b1!97) (size!8292 (buf!7905 b1!97)))))

(assert (=> d!103756 (= (bitIndex!0 (size!8292 (buf!7905 b1!97)) (currentByte!14618 b1!97) (currentBit!14613 b1!97)) lt!441975)))

(declare-fun b!312380 () Bool)

(declare-fun res!255862 () Bool)

(assert (=> b!312380 (=> (not res!255862) (not e!224662))))

(assert (=> b!312380 (= res!255862 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441975))))

(declare-fun b!312381 () Bool)

(declare-fun lt!441977 () (_ BitVec 64))

(assert (=> b!312381 (= e!224662 (bvsle lt!441975 (bvmul lt!441977 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312381 (or (= lt!441977 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441977 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441977)))))

(assert (=> b!312381 (= lt!441977 ((_ sign_extend 32) (size!8292 (buf!7905 b1!97))))))

(assert (= (and d!103756 res!255863) b!312380))

(assert (= (and b!312380 res!255862) b!312381))

(declare-fun m!450059 () Bool)

(assert (=> d!103756 m!450059))

(declare-fun m!450061 () Bool)

(assert (=> d!103756 m!450061))

(assert (=> b!312361 d!103756))

(declare-fun d!103758 () Bool)

(assert (=> d!103758 (= (inv!12 b1!97) (invariant!0 (currentBit!14613 b1!97) (currentByte!14618 b1!97) (size!8292 (buf!7905 b1!97))))))

(declare-fun bs!26846 () Bool)

(assert (= bs!26846 d!103758))

(assert (=> bs!26846 m!450061))

(assert (=> start!69506 d!103758))

(declare-fun d!103760 () Bool)

(assert (=> d!103760 (= (inv!12 b2!97) (invariant!0 (currentBit!14613 b2!97) (currentByte!14618 b2!97) (size!8292 (buf!7905 b2!97))))))

(declare-fun bs!26847 () Bool)

(assert (= bs!26847 d!103760))

(declare-fun m!450063 () Bool)

(assert (=> bs!26847 m!450063))

(assert (=> start!69506 d!103760))

(declare-fun d!103762 () Bool)

(assert (=> d!103762 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8292 (buf!7905 b1!97))) ((_ sign_extend 32) (currentByte!14618 b1!97)) ((_ sign_extend 32) (currentBit!14613 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8292 (buf!7905 b1!97))) ((_ sign_extend 32) (currentByte!14618 b1!97)) ((_ sign_extend 32) (currentBit!14613 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26848 () Bool)

(assert (= bs!26848 d!103762))

(assert (=> bs!26848 m!450059))

(assert (=> b!312360 d!103762))

(declare-fun d!103764 () Bool)

(assert (=> d!103764 (= (array_inv!7844 (buf!7905 b2!97)) (bvsge (size!8292 (buf!7905 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!312363 d!103764))

(push 1)

(assert (not d!103762))

(assert (not d!103760))

(assert (not d!103758))

(assert (not d!103756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

