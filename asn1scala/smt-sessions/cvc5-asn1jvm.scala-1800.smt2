; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48912 () Bool)

(assert start!48912)

(declare-fun b!231566 () Bool)

(declare-fun e!159268 () Bool)

(declare-datatypes ((array!11881 0))(
  ( (array!11882 (arr!6193 (Array (_ BitVec 32) (_ BitVec 8))) (size!5206 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9508 0))(
  ( (BitStream!9509 (buf!5747 array!11881) (currentByte!10754 (_ BitVec 32)) (currentBit!10749 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9508)

(declare-fun array_inv!4947 (array!11881) Bool)

(assert (=> b!231566 (= e!159268 (array_inv!4947 (buf!5747 b2!99)))))

(declare-fun res!193942 () Bool)

(declare-fun e!159265 () Bool)

(assert (=> start!48912 (=> (not res!193942) (not e!159265))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b1!101 () BitStream!9508)

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48912 (= res!193942 (and (= (size!5206 (buf!5747 b1!101)) (size!5206 (buf!5747 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48912 e!159265))

(declare-fun e!159266 () Bool)

(declare-fun inv!12 (BitStream!9508) Bool)

(assert (=> start!48912 (and (inv!12 b1!101) e!159266)))

(assert (=> start!48912 (and (inv!12 b2!99) e!159268)))

(assert (=> start!48912 true))

(declare-fun b!231567 () Bool)

(declare-fun e!159269 () Bool)

(assert (=> b!231567 (= e!159269 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5206 (buf!5747 b1!101)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10754 b1!101))) ((_ sign_extend 32) (currentBit!10749 b1!101)))) #b0000000000000000000000000000000000000000000000000000000000001000)) (not (= ((_ sign_extend 32) (currentByte!10754 b2!99)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10754 b2!99))) ((_ sign_extend 32) (currentByte!10754 b2!99)))))))))

(declare-fun b!231568 () Bool)

(assert (=> b!231568 (= e!159265 e!159269)))

(declare-fun res!193944 () Bool)

(assert (=> b!231568 (=> (not res!193944) (not e!159269))))

(declare-fun lt!368718 () (_ BitVec 64))

(assert (=> b!231568 (= res!193944 (and (bvsle bits!86 lt!368718) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231568 (= lt!368718 (bitIndex!0 (size!5206 (buf!5747 b2!99)) (currentByte!10754 b2!99) (currentBit!10749 b2!99)))))

(declare-fun b!231569 () Bool)

(assert (=> b!231569 (= e!159266 (array_inv!4947 (buf!5747 b1!101)))))

(declare-fun b!231570 () Bool)

(declare-fun res!193943 () Bool)

(assert (=> b!231570 (=> (not res!193943) (not e!159269))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231570 (= res!193943 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5206 (buf!5747 b1!101))) ((_ sign_extend 32) (currentByte!10754 b1!101)) ((_ sign_extend 32) (currentBit!10749 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231571 () Bool)

(declare-fun res!193940 () Bool)

(assert (=> b!231571 (=> (not res!193940) (not e!159269))))

(assert (=> b!231571 (= res!193940 (= lt!368718 (bvadd (bitIndex!0 (size!5206 (buf!5747 b1!101)) (currentByte!10754 b1!101) (currentBit!10749 b1!101)) bits!86)))))

(declare-fun b!231572 () Bool)

(declare-fun res!193941 () Bool)

(assert (=> b!231572 (=> (not res!193941) (not e!159269))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231572 (= res!193941 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5206 (buf!5747 b1!101))) ((_ sign_extend 32) (currentByte!10754 b1!101)) ((_ sign_extend 32) (currentBit!10749 b1!101)) bytes!19))))

(assert (= (and start!48912 res!193942) b!231568))

(assert (= (and b!231568 res!193944) b!231572))

(assert (= (and b!231572 res!193941) b!231571))

(assert (= (and b!231571 res!193940) b!231570))

(assert (= (and b!231570 res!193943) b!231567))

(assert (= start!48912 b!231569))

(assert (= start!48912 b!231566))

(declare-fun m!354659 () Bool)

(assert (=> start!48912 m!354659))

(declare-fun m!354661 () Bool)

(assert (=> start!48912 m!354661))

(declare-fun m!354663 () Bool)

(assert (=> b!231569 m!354663))

(declare-fun m!354665 () Bool)

(assert (=> b!231570 m!354665))

(declare-fun m!354667 () Bool)

(assert (=> b!231572 m!354667))

(declare-fun m!354669 () Bool)

(assert (=> b!231571 m!354669))

(declare-fun m!354671 () Bool)

(assert (=> b!231568 m!354671))

(declare-fun m!354673 () Bool)

(assert (=> b!231566 m!354673))

(push 1)

(assert (not b!231566))

(assert (not b!231568))

(assert (not b!231570))

(assert (not b!231569))

(assert (not b!231572))

(assert (not b!231571))

(assert (not start!48912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

