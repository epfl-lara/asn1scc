; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31836 () Bool)

(assert start!31836)

(declare-fun res!132466 () Bool)

(declare-fun e!107923 () Bool)

(assert (=> start!31836 (=> (not res!132466) (not e!107923))))

(declare-datatypes ((array!7420 0))(
  ( (array!7421 (arr!4286 (Array (_ BitVec 32) (_ BitVec 8))) (size!3365 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5898 0))(
  ( (BitStream!5899 (buf!3823 array!7420) (currentByte!7026 (_ BitVec 32)) (currentBit!7021 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5898)

(declare-fun buf!77 () array!7420)

(declare-fun bytes!14 () (_ BitVec 32))

(assert (=> start!31836 (= res!132466 (and (= (size!3365 (buf!3823 b1!99)) (size!3365 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31836 e!107923))

(declare-fun e!107924 () Bool)

(declare-fun inv!12 (BitStream!5898) Bool)

(assert (=> start!31836 (and (inv!12 b1!99) e!107924)))

(declare-fun array_inv!3112 (array!7420) Bool)

(assert (=> start!31836 (array_inv!3112 buf!77)))

(assert (=> start!31836 true))

(declare-fun b!158611 () Bool)

(declare-fun res!132467 () Bool)

(assert (=> b!158611 (=> (not res!132467) (not e!107923))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158611 (= res!132467 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3365 (buf!3823 b1!99))) ((_ sign_extend 32) (currentByte!7026 b1!99)) ((_ sign_extend 32) (currentBit!7021 b1!99)) bytes!14))))

(declare-fun b!158612 () Bool)

(assert (=> b!158612 (= e!107923 (not (inv!12 (BitStream!5899 buf!77 (currentByte!7026 b1!99) (currentBit!7021 b1!99)))))))

(declare-fun b!158613 () Bool)

(assert (=> b!158613 (= e!107924 (array_inv!3112 (buf!3823 b1!99)))))

(assert (= (and start!31836 res!132466) b!158611))

(assert (= (and b!158611 res!132467) b!158612))

(assert (= start!31836 b!158613))

(declare-fun m!249117 () Bool)

(assert (=> start!31836 m!249117))

(declare-fun m!249119 () Bool)

(assert (=> start!31836 m!249119))

(declare-fun m!249121 () Bool)

(assert (=> b!158611 m!249121))

(declare-fun m!249123 () Bool)

(assert (=> b!158612 m!249123))

(declare-fun m!249125 () Bool)

(assert (=> b!158613 m!249125))

(check-sat (not b!158611) (not b!158613) (not start!31836) (not b!158612))
(check-sat)
(get-model)

(declare-fun d!53241 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53241 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3365 (buf!3823 b1!99))) ((_ sign_extend 32) (currentByte!7026 b1!99)) ((_ sign_extend 32) (currentBit!7021 b1!99)) bytes!14) (bvsle ((_ sign_extend 32) bytes!14) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3365 (buf!3823 b1!99))) ((_ sign_extend 32) (currentByte!7026 b1!99)) ((_ sign_extend 32) (currentBit!7021 b1!99))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!13133 () Bool)

(assert (= bs!13133 d!53241))

(declare-fun m!249137 () Bool)

(assert (=> bs!13133 m!249137))

(assert (=> b!158611 d!53241))

(declare-fun d!53245 () Bool)

(assert (=> d!53245 (= (array_inv!3112 (buf!3823 b1!99)) (bvsge (size!3365 (buf!3823 b1!99)) #b00000000000000000000000000000000))))

(assert (=> b!158613 d!53245))

(declare-fun d!53247 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53247 (= (inv!12 b1!99) (invariant!0 (currentBit!7021 b1!99) (currentByte!7026 b1!99) (size!3365 (buf!3823 b1!99))))))

(declare-fun bs!13136 () Bool)

(assert (= bs!13136 d!53247))

(declare-fun m!249143 () Bool)

(assert (=> bs!13136 m!249143))

(assert (=> start!31836 d!53247))

(declare-fun d!53255 () Bool)

(assert (=> d!53255 (= (array_inv!3112 buf!77) (bvsge (size!3365 buf!77) #b00000000000000000000000000000000))))

(assert (=> start!31836 d!53255))

(declare-fun d!53259 () Bool)

(assert (=> d!53259 (= (inv!12 (BitStream!5899 buf!77 (currentByte!7026 b1!99) (currentBit!7021 b1!99))) (invariant!0 (currentBit!7021 (BitStream!5899 buf!77 (currentByte!7026 b1!99) (currentBit!7021 b1!99))) (currentByte!7026 (BitStream!5899 buf!77 (currentByte!7026 b1!99) (currentBit!7021 b1!99))) (size!3365 (buf!3823 (BitStream!5899 buf!77 (currentByte!7026 b1!99) (currentBit!7021 b1!99))))))))

(declare-fun bs!13137 () Bool)

(assert (= bs!13137 d!53259))

(declare-fun m!249145 () Bool)

(assert (=> bs!13137 m!249145))

(assert (=> b!158612 d!53259))

(check-sat (not d!53247) (not d!53259) (not d!53241))
