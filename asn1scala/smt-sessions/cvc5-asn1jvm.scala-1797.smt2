; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48894 () Bool)

(assert start!48894)

(declare-fun e!159123 () Bool)

(declare-fun lt!368673 () (_ BitVec 64))

(declare-fun lt!368671 () (_ BitVec 64))

(declare-fun b!231395 () Bool)

(declare-fun lt!368672 () (_ BitVec 64))

(assert (=> b!231395 (= e!159123 (and (not (= lt!368671 (bvand lt!368672 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!368671 (bvand (bvsub lt!368673 lt!368672) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!231395 (= lt!368671 (bvand lt!368673 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!11863 0))(
  ( (array!11864 (arr!6184 (Array (_ BitVec 32) (_ BitVec 8))) (size!5197 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9490 0))(
  ( (BitStream!9491 (buf!5738 array!11863) (currentByte!10745 (_ BitVec 32)) (currentBit!10740 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9490)

(assert (=> b!231395 (= lt!368672 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10745 b1!101))) ((_ sign_extend 32) (currentBit!10740 b1!101))))))

(assert (=> b!231395 (= lt!368673 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5197 (buf!5738 b1!101)))))))

(declare-fun b!231396 () Bool)

(declare-fun res!193827 () Bool)

(assert (=> b!231396 (=> (not res!193827) (not e!159123))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368670 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231396 (= res!193827 (= lt!368670 (bvadd (bitIndex!0 (size!5197 (buf!5738 b1!101)) (currentByte!10745 b1!101) (currentBit!10740 b1!101)) bits!86)))))

(declare-fun res!193825 () Bool)

(declare-fun e!159121 () Bool)

(assert (=> start!48894 (=> (not res!193825) (not e!159121))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9490)

(assert (=> start!48894 (= res!193825 (and (= (size!5197 (buf!5738 b1!101)) (size!5197 (buf!5738 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48894 e!159121))

(declare-fun e!159122 () Bool)

(declare-fun inv!12 (BitStream!9490) Bool)

(assert (=> start!48894 (and (inv!12 b1!101) e!159122)))

(declare-fun e!159120 () Bool)

(assert (=> start!48894 (and (inv!12 b2!99) e!159120)))

(assert (=> start!48894 true))

(declare-fun b!231397 () Bool)

(declare-fun res!193826 () Bool)

(assert (=> b!231397 (=> (not res!193826) (not e!159123))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231397 (= res!193826 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5197 (buf!5738 b1!101))) ((_ sign_extend 32) (currentByte!10745 b1!101)) ((_ sign_extend 32) (currentBit!10740 b1!101)) bytes!19))))

(declare-fun b!231398 () Bool)

(declare-fun res!193824 () Bool)

(assert (=> b!231398 (=> (not res!193824) (not e!159123))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231398 (= res!193824 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5197 (buf!5738 b1!101))) ((_ sign_extend 32) (currentByte!10745 b1!101)) ((_ sign_extend 32) (currentBit!10740 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!231399 () Bool)

(declare-fun array_inv!4938 (array!11863) Bool)

(assert (=> b!231399 (= e!159120 (array_inv!4938 (buf!5738 b2!99)))))

(declare-fun b!231400 () Bool)

(assert (=> b!231400 (= e!159122 (array_inv!4938 (buf!5738 b1!101)))))

(declare-fun b!231401 () Bool)

(assert (=> b!231401 (= e!159121 e!159123)))

(declare-fun res!193823 () Bool)

(assert (=> b!231401 (=> (not res!193823) (not e!159123))))

(assert (=> b!231401 (= res!193823 (and (bvsle bits!86 lt!368670) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!231401 (= lt!368670 (bitIndex!0 (size!5197 (buf!5738 b2!99)) (currentByte!10745 b2!99) (currentBit!10740 b2!99)))))

(assert (= (and start!48894 res!193825) b!231401))

(assert (= (and b!231401 res!193823) b!231397))

(assert (= (and b!231397 res!193826) b!231396))

(assert (= (and b!231396 res!193827) b!231398))

(assert (= (and b!231398 res!193824) b!231395))

(assert (= start!48894 b!231400))

(assert (= start!48894 b!231399))

(declare-fun m!354527 () Bool)

(assert (=> b!231398 m!354527))

(declare-fun m!354529 () Bool)

(assert (=> b!231397 m!354529))

(declare-fun m!354531 () Bool)

(assert (=> b!231399 m!354531))

(declare-fun m!354533 () Bool)

(assert (=> b!231401 m!354533))

(declare-fun m!354535 () Bool)

(assert (=> b!231396 m!354535))

(declare-fun m!354537 () Bool)

(assert (=> start!48894 m!354537))

(declare-fun m!354539 () Bool)

(assert (=> start!48894 m!354539))

(declare-fun m!354541 () Bool)

(assert (=> b!231400 m!354541))

(push 1)

(assert (not b!231401))

(assert (not b!231398))

(assert (not b!231399))

(assert (not start!48894))

(assert (not b!231400))

(assert (not b!231397))

(assert (not b!231396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

