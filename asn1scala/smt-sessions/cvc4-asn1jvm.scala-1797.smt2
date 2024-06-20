; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48898 () Bool)

(assert start!48898)

(declare-fun b!231437 () Bool)

(declare-fun res!193854 () Bool)

(declare-fun e!159160 () Bool)

(assert (=> b!231437 (=> (not res!193854) (not e!159160))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-datatypes ((array!11867 0))(
  ( (array!11868 (arr!6186 (Array (_ BitVec 32) (_ BitVec 8))) (size!5199 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9494 0))(
  ( (BitStream!9495 (buf!5740 array!11867) (currentByte!10747 (_ BitVec 32)) (currentBit!10742 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9494)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231437 (= res!193854 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5199 (buf!5740 b1!101))) ((_ sign_extend 32) (currentByte!10747 b1!101)) ((_ sign_extend 32) (currentBit!10742 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231438 () Bool)

(declare-fun res!193853 () Bool)

(assert (=> b!231438 (=> (not res!193853) (not e!159160))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368696 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231438 (= res!193853 (= lt!368696 (bvadd (bitIndex!0 (size!5199 (buf!5740 b1!101)) (currentByte!10747 b1!101) (currentBit!10742 b1!101)) bits!86)))))

(declare-fun b!231439 () Bool)

(declare-fun e!159159 () Bool)

(declare-fun b2!99 () BitStream!9494)

(declare-fun array_inv!4940 (array!11867) Bool)

(assert (=> b!231439 (= e!159159 (array_inv!4940 (buf!5740 b2!99)))))

(declare-fun b!231440 () Bool)

(declare-fun e!159156 () Bool)

(assert (=> b!231440 (= e!159156 (array_inv!4940 (buf!5740 b1!101)))))

(declare-fun res!193857 () Bool)

(declare-fun e!159157 () Bool)

(assert (=> start!48898 (=> (not res!193857) (not e!159157))))

(assert (=> start!48898 (= res!193857 (and (= (size!5199 (buf!5740 b1!101)) (size!5199 (buf!5740 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48898 e!159157))

(declare-fun inv!12 (BitStream!9494) Bool)

(assert (=> start!48898 (and (inv!12 b1!101) e!159156)))

(assert (=> start!48898 (and (inv!12 b2!99) e!159159)))

(assert (=> start!48898 true))

(declare-fun b!231441 () Bool)

(assert (=> b!231441 (= e!159157 e!159160)))

(declare-fun res!193855 () Bool)

(assert (=> b!231441 (=> (not res!193855) (not e!159160))))

(assert (=> b!231441 (= res!193855 (and (bvsle bits!86 lt!368696) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!231441 (= lt!368696 (bitIndex!0 (size!5199 (buf!5740 b2!99)) (currentByte!10747 b2!99) (currentBit!10742 b2!99)))))

(declare-fun b!231442 () Bool)

(declare-fun lt!368694 () (_ BitVec 64))

(declare-fun lt!368695 () (_ BitVec 64))

(declare-fun lt!368697 () (_ BitVec 64))

(assert (=> b!231442 (= e!159160 (and (not (= lt!368697 (bvand lt!368695 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!368697 (bvand (bvsub lt!368694 lt!368695) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!231442 (= lt!368697 (bvand lt!368694 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!231442 (= lt!368695 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10747 b1!101))) ((_ sign_extend 32) (currentBit!10742 b1!101))))))

(assert (=> b!231442 (= lt!368694 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5199 (buf!5740 b1!101)))))))

(declare-fun b!231443 () Bool)

(declare-fun res!193856 () Bool)

(assert (=> b!231443 (=> (not res!193856) (not e!159160))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231443 (= res!193856 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5199 (buf!5740 b1!101))) ((_ sign_extend 32) (currentByte!10747 b1!101)) ((_ sign_extend 32) (currentBit!10742 b1!101)) bytes!19))))

(assert (= (and start!48898 res!193857) b!231441))

(assert (= (and b!231441 res!193855) b!231443))

(assert (= (and b!231443 res!193856) b!231438))

(assert (= (and b!231438 res!193853) b!231437))

(assert (= (and b!231437 res!193854) b!231442))

(assert (= start!48898 b!231440))

(assert (= start!48898 b!231439))

(declare-fun m!354559 () Bool)

(assert (=> b!231441 m!354559))

(declare-fun m!354561 () Bool)

(assert (=> b!231440 m!354561))

(declare-fun m!354563 () Bool)

(assert (=> start!48898 m!354563))

(declare-fun m!354565 () Bool)

(assert (=> start!48898 m!354565))

(declare-fun m!354567 () Bool)

(assert (=> b!231438 m!354567))

(declare-fun m!354569 () Bool)

(assert (=> b!231443 m!354569))

(declare-fun m!354571 () Bool)

(assert (=> b!231437 m!354571))

(declare-fun m!354573 () Bool)

(assert (=> b!231439 m!354573))

(push 1)

(assert (not b!231438))

(assert (not b!231443))

(assert (not b!231439))

(assert (not start!48898))

(assert (not b!231440))

(assert (not b!231437))

(assert (not b!231441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

