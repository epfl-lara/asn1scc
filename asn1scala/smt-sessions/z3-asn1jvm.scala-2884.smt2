; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69050 () Bool)

(assert start!69050)

(declare-fun b!311149 () Bool)

(declare-fun e!223663 () Bool)

(declare-datatypes ((array!18987 0))(
  ( (array!18988 (arr!9320 (Array (_ BitVec 32) (_ BitVec 8))) (size!8240 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13584 0))(
  ( (BitStream!13585 (buf!7853 array!18987) (currentByte!14460 (_ BitVec 32)) (currentBit!14455 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13584)

(declare-fun array_inv!7792 (array!18987) Bool)

(assert (=> b!311149 (= e!223663 (array_inv!7792 (buf!7853 b1!97)))))

(declare-fun b!311148 () Bool)

(declare-fun e!223662 () Bool)

(declare-fun b2!97 () BitStream!13584)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311148 (= e!223662 (not (invariant!0 (currentBit!14455 b2!97) (currentByte!14460 b2!97) (size!8240 (buf!7853 b2!97)))))))

(declare-fun res!254943 () Bool)

(assert (=> start!69050 (=> (not res!254943) (not e!223662))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(assert (=> start!69050 (= res!254943 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8240 (buf!7853 b1!97)) (size!8240 (buf!7853 b2!97)))))))

(assert (=> start!69050 e!223662))

(assert (=> start!69050 true))

(declare-fun inv!12 (BitStream!13584) Bool)

(assert (=> start!69050 (and (inv!12 b1!97) e!223663)))

(declare-fun e!223664 () Bool)

(assert (=> start!69050 (and (inv!12 b2!97) e!223664)))

(declare-fun b!311147 () Bool)

(declare-fun res!254944 () Bool)

(assert (=> b!311147 (=> (not res!254944) (not e!223662))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311147 (= res!254944 (validate_offset_bits!1 ((_ sign_extend 32) (size!8240 (buf!7853 b1!97))) ((_ sign_extend 32) (currentByte!14460 b1!97)) ((_ sign_extend 32) (currentBit!14455 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311150 () Bool)

(assert (=> b!311150 (= e!223664 (array_inv!7792 (buf!7853 b2!97)))))

(assert (= (and start!69050 res!254943) b!311147))

(assert (= (and b!311147 res!254944) b!311148))

(assert (= start!69050 b!311149))

(assert (= start!69050 b!311150))

(declare-fun m!449023 () Bool)

(assert (=> b!311150 m!449023))

(declare-fun m!449025 () Bool)

(assert (=> b!311147 m!449025))

(declare-fun m!449027 () Bool)

(assert (=> b!311149 m!449027))

(declare-fun m!449029 () Bool)

(assert (=> b!311148 m!449029))

(declare-fun m!449031 () Bool)

(assert (=> start!69050 m!449031))

(declare-fun m!449033 () Bool)

(assert (=> start!69050 m!449033))

(check-sat (not b!311150) (not start!69050) (not b!311147) (not b!311148) (not b!311149))
(check-sat)
(get-model)

(declare-fun d!103128 () Bool)

(assert (=> d!103128 (= (array_inv!7792 (buf!7853 b2!97)) (bvsge (size!8240 (buf!7853 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311150 d!103128))

(declare-fun d!103134 () Bool)

(assert (=> d!103134 (= (array_inv!7792 (buf!7853 b1!97)) (bvsge (size!8240 (buf!7853 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311149 d!103134))

(declare-fun d!103136 () Bool)

(assert (=> d!103136 (= (inv!12 b1!97) (invariant!0 (currentBit!14455 b1!97) (currentByte!14460 b1!97) (size!8240 (buf!7853 b1!97))))))

(declare-fun bs!26688 () Bool)

(assert (= bs!26688 d!103136))

(declare-fun m!449049 () Bool)

(assert (=> bs!26688 m!449049))

(assert (=> start!69050 d!103136))

(declare-fun d!103140 () Bool)

(assert (=> d!103140 (= (inv!12 b2!97) (invariant!0 (currentBit!14455 b2!97) (currentByte!14460 b2!97) (size!8240 (buf!7853 b2!97))))))

(declare-fun bs!26689 () Bool)

(assert (= bs!26689 d!103140))

(assert (=> bs!26689 m!449029))

(assert (=> start!69050 d!103140))

(declare-fun d!103142 () Bool)

(assert (=> d!103142 (= (invariant!0 (currentBit!14455 b2!97) (currentByte!14460 b2!97) (size!8240 (buf!7853 b2!97))) (and (bvsge (currentBit!14455 b2!97) #b00000000000000000000000000000000) (bvslt (currentBit!14455 b2!97) #b00000000000000000000000000001000) (bvsge (currentByte!14460 b2!97) #b00000000000000000000000000000000) (or (bvslt (currentByte!14460 b2!97) (size!8240 (buf!7853 b2!97))) (and (= (currentBit!14455 b2!97) #b00000000000000000000000000000000) (= (currentByte!14460 b2!97) (size!8240 (buf!7853 b2!97)))))))))

(assert (=> b!311148 d!103142))

(declare-fun d!103144 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

