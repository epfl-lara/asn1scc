; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60242 () Bool)

(assert start!60242)

(declare-fun res!227866 () Bool)

(declare-fun e!193703 () Bool)

(assert (=> start!60242 (=> (not res!227866) (not e!193703))))

(declare-datatypes ((array!15404 0))(
  ( (array!15405 (arr!7676 (Array (_ BitVec 32) (_ BitVec 8))) (size!6689 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12192 0))(
  ( (BitStream!12193 (buf!7157 array!15404) (currentByte!13210 (_ BitVec 32)) (currentBit!13205 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12192)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12192 (_ BitVec 64)) Bool)

(assert (=> start!60242 (= res!227866 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60242 e!193703))

(declare-fun e!193704 () Bool)

(declare-fun inv!12 (BitStream!12192) Bool)

(assert (=> start!60242 (and (inv!12 thiss!882) e!193704)))

(assert (=> start!60242 true))

(declare-fun b!273810 () Bool)

(assert (=> b!273810 (= e!193703 (bvsge (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))

(declare-fun b!273811 () Bool)

(declare-fun array_inv!6413 (array!15404) Bool)

(assert (=> b!273811 (= e!193704 (array_inv!6413 (buf!7157 thiss!882)))))

(assert (= (and start!60242 res!227866) b!273810))

(assert (= start!60242 b!273811))

(declare-fun m!406587 () Bool)

(assert (=> start!60242 m!406587))

(declare-fun m!406589 () Bool)

(assert (=> start!60242 m!406589))

(declare-fun m!406591 () Bool)

(assert (=> b!273811 m!406591))

(check-sat (not b!273811) (not start!60242))
(check-sat)
(get-model)

(declare-fun d!93800 () Bool)

(assert (=> d!93800 (= (array_inv!6413 (buf!7157 thiss!882)) (bvsge (size!6689 (buf!7157 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!273811 d!93800))

(declare-fun d!93804 () Bool)

(declare-fun res!227875 () Bool)

(declare-fun e!193720 () Bool)

(assert (=> d!93804 (=> (not res!227875) (not e!193720))))

(assert (=> d!93804 (= res!227875 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6689 (buf!7157 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6689 (buf!7157 thiss!882)))))))))

(assert (=> d!93804 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193720)))

(declare-fun b!273825 () Bool)

(declare-fun lt!411854 () (_ BitVec 64))

(assert (=> b!273825 (= e!193720 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!411854) (bvsle lt!411854 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6689 (buf!7157 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273825 (= lt!411854 (bvadd (bitIndex!0 (size!6689 (buf!7157 thiss!882)) (currentByte!13210 thiss!882) (currentBit!13205 thiss!882)) diffInBits!15))))

(assert (= (and d!93804 res!227875) b!273825))

(declare-fun m!406601 () Bool)

(assert (=> b!273825 m!406601))

(assert (=> start!60242 d!93804))

(declare-fun d!93812 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93812 (= (inv!12 thiss!882) (invariant!0 (currentBit!13205 thiss!882) (currentByte!13210 thiss!882) (size!6689 (buf!7157 thiss!882))))))

(declare-fun bs!23635 () Bool)

(assert (= bs!23635 d!93812))

(declare-fun m!406605 () Bool)

(assert (=> bs!23635 m!406605))

(assert (=> start!60242 d!93812))

(check-sat (not b!273825) (not d!93812))
(check-sat)
