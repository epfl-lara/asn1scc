; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29506 () Bool)

(assert start!29506)

(declare-fun res!127854 () Bool)

(declare-fun e!101978 () Bool)

(assert (=> start!29506 (=> (not res!127854) (not e!101978))))

(declare-datatypes ((array!6803 0))(
  ( (array!6804 (arr!3899 (Array (_ BitVec 32) (_ BitVec 8))) (size!3076 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5410 0))(
  ( (BitStream!5411 (buf!3579 array!6803) (currentByte!6529 (_ BitVec 32)) (currentBit!6524 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5410)

(declare-fun bs2!18 () BitStream!5410)

(assert (=> start!29506 (= res!127854 (= (size!3076 (buf!3579 bs1!10)) (size!3076 (buf!3579 bs2!18))))))

(assert (=> start!29506 e!101978))

(declare-fun e!101979 () Bool)

(declare-fun inv!12 (BitStream!5410) Bool)

(assert (=> start!29506 (and (inv!12 bs1!10) e!101979)))

(declare-fun e!101981 () Bool)

(assert (=> start!29506 (and (inv!12 bs2!18) e!101981)))

(declare-fun b!152499 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152499 (= e!101978 (not (invariant!0 (currentBit!6524 bs1!10) (currentByte!6529 bs1!10) (size!3076 (buf!3579 bs1!10)))))))

(declare-fun b!152500 () Bool)

(declare-fun array_inv!2865 (array!6803) Bool)

(assert (=> b!152500 (= e!101979 (array_inv!2865 (buf!3579 bs1!10)))))

(declare-fun b!152501 () Bool)

(assert (=> b!152501 (= e!101981 (array_inv!2865 (buf!3579 bs2!18)))))

(assert (= (and start!29506 res!127854) b!152499))

(assert (= start!29506 b!152500))

(assert (= start!29506 b!152501))

(declare-fun m!238357 () Bool)

(assert (=> start!29506 m!238357))

(declare-fun m!238359 () Bool)

(assert (=> start!29506 m!238359))

(declare-fun m!238361 () Bool)

(assert (=> b!152499 m!238361))

(declare-fun m!238363 () Bool)

(assert (=> b!152500 m!238363))

(declare-fun m!238365 () Bool)

(assert (=> b!152501 m!238365))

(push 1)

(assert (not b!152500))

(assert (not b!152499))

(assert (not b!152501))

(assert (not start!29506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50070 () Bool)

(assert (=> d!50070 (= (array_inv!2865 (buf!3579 bs1!10)) (bvsge (size!3076 (buf!3579 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152500 d!50070))

(declare-fun d!50074 () Bool)

(assert (=> d!50074 (= (invariant!0 (currentBit!6524 bs1!10) (currentByte!6529 bs1!10) (size!3076 (buf!3579 bs1!10))) (and (bvsge (currentBit!6524 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6524 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6529 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6529 bs1!10) (size!3076 (buf!3579 bs1!10))) (and (= (currentBit!6524 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6529 bs1!10) (size!3076 (buf!3579 bs1!10)))))))))

(assert (=> b!152499 d!50074))

(declare-fun d!50082 () Bool)

(assert (=> d!50082 (= (array_inv!2865 (buf!3579 bs2!18)) (bvsge (size!3076 (buf!3579 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152501 d!50082))

(declare-fun d!50084 () Bool)

(assert (=> d!50084 (= (inv!12 bs1!10) (invariant!0 (currentBit!6524 bs1!10) (currentByte!6529 bs1!10) (size!3076 (buf!3579 bs1!10))))))

(declare-fun bs!12244 () Bool)

(assert (= bs!12244 d!50084))

(assert (=> bs!12244 m!238361))

(assert (=> start!29506 d!50084))

(declare-fun d!50088 () Bool)

(assert (=> d!50088 (= (inv!12 bs2!18) (invariant!0 (currentBit!6524 bs2!18) (currentByte!6529 bs2!18) (size!3076 (buf!3579 bs2!18))))))

(declare-fun bs!12245 () Bool)

(assert (= bs!12245 d!50088))

(declare-fun m!238389 () Bool)

(assert (=> bs!12245 m!238389))

(assert (=> start!29506 d!50088))

