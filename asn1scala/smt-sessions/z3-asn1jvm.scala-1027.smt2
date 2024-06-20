; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29508 () Bool)

(assert start!29508)

(declare-fun res!127857 () Bool)

(declare-fun e!101996 () Bool)

(assert (=> start!29508 (=> (not res!127857) (not e!101996))))

(declare-datatypes ((array!6805 0))(
  ( (array!6806 (arr!3900 (Array (_ BitVec 32) (_ BitVec 8))) (size!3077 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5412 0))(
  ( (BitStream!5413 (buf!3580 array!6805) (currentByte!6530 (_ BitVec 32)) (currentBit!6525 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5412)

(declare-fun bs2!18 () BitStream!5412)

(assert (=> start!29508 (= res!127857 (= (size!3077 (buf!3580 bs1!10)) (size!3077 (buf!3580 bs2!18))))))

(assert (=> start!29508 e!101996))

(declare-fun e!101995 () Bool)

(declare-fun inv!12 (BitStream!5412) Bool)

(assert (=> start!29508 (and (inv!12 bs1!10) e!101995)))

(declare-fun e!101993 () Bool)

(assert (=> start!29508 (and (inv!12 bs2!18) e!101993)))

(declare-fun b!152508 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152508 (= e!101996 (not (invariant!0 (currentBit!6525 bs1!10) (currentByte!6530 bs1!10) (size!3077 (buf!3580 bs1!10)))))))

(declare-fun b!152509 () Bool)

(declare-fun array_inv!2866 (array!6805) Bool)

(assert (=> b!152509 (= e!101995 (array_inv!2866 (buf!3580 bs1!10)))))

(declare-fun b!152510 () Bool)

(assert (=> b!152510 (= e!101993 (array_inv!2866 (buf!3580 bs2!18)))))

(assert (= (and start!29508 res!127857) b!152508))

(assert (= start!29508 b!152509))

(assert (= start!29508 b!152510))

(declare-fun m!238367 () Bool)

(assert (=> start!29508 m!238367))

(declare-fun m!238369 () Bool)

(assert (=> start!29508 m!238369))

(declare-fun m!238371 () Bool)

(assert (=> b!152508 m!238371))

(declare-fun m!238373 () Bool)

(assert (=> b!152509 m!238373))

(declare-fun m!238375 () Bool)

(assert (=> b!152510 m!238375))

(check-sat (not b!152508) (not b!152509) (not start!29508) (not b!152510))
(check-sat)
(get-model)

(declare-fun d!50068 () Bool)

(assert (=> d!50068 (= (invariant!0 (currentBit!6525 bs1!10) (currentByte!6530 bs1!10) (size!3077 (buf!3580 bs1!10))) (and (bvsge (currentBit!6525 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6525 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6530 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6530 bs1!10) (size!3077 (buf!3580 bs1!10))) (and (= (currentBit!6525 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6530 bs1!10) (size!3077 (buf!3580 bs1!10)))))))))

(assert (=> b!152508 d!50068))

(declare-fun d!50072 () Bool)

(assert (=> d!50072 (= (array_inv!2866 (buf!3580 bs1!10)) (bvsge (size!3077 (buf!3580 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152509 d!50072))

(declare-fun d!50076 () Bool)

(assert (=> d!50076 (= (inv!12 bs1!10) (invariant!0 (currentBit!6525 bs1!10) (currentByte!6530 bs1!10) (size!3077 (buf!3580 bs1!10))))))

(declare-fun bs!12242 () Bool)

(assert (= bs!12242 d!50076))

(assert (=> bs!12242 m!238371))

(assert (=> start!29508 d!50076))

(declare-fun d!50078 () Bool)

(assert (=> d!50078 (= (inv!12 bs2!18) (invariant!0 (currentBit!6525 bs2!18) (currentByte!6530 bs2!18) (size!3077 (buf!3580 bs2!18))))))

(declare-fun bs!12243 () Bool)

(assert (= bs!12243 d!50078))

(declare-fun m!238387 () Bool)

(assert (=> bs!12243 m!238387))

(assert (=> start!29508 d!50078))

(declare-fun d!50080 () Bool)

(assert (=> d!50080 (= (array_inv!2866 (buf!3580 bs2!18)) (bvsge (size!3077 (buf!3580 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152510 d!50080))

(check-sat (not d!50076) (not d!50078))
(check-sat)
