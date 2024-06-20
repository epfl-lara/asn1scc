; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57576 () Bool)

(assert start!57576)

(declare-fun b!264023 () Bool)

(declare-fun e!184201 () Bool)

(declare-datatypes ((array!14729 0))(
  ( (array!14730 (arr!7414 (Array (_ BitVec 32) (_ BitVec 8))) (size!6427 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11668 0))(
  ( (BitStream!11669 (buf!6895 array!14729) (currentByte!12759 (_ BitVec 32)) (currentBit!12754 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11668)

(declare-fun w1!584 () BitStream!11668)

(declare-fun arrayBitRangesEq!0 (array!14729 array!14729 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264023 (= e!184201 (not (arrayBitRangesEq!0 (buf!6895 w2!580) (buf!6895 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6427 (buf!6895 w1!584)) (currentByte!12759 w1!584) (currentBit!12754 w1!584)))))))

(declare-fun res!220779 () Bool)

(declare-fun e!184206 () Bool)

(assert (=> start!57576 (=> (not res!220779) (not e!184206))))

(declare-fun isPrefixOf!0 (BitStream!11668 BitStream!11668) Bool)

(assert (=> start!57576 (= res!220779 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57576 e!184206))

(declare-fun e!184197 () Bool)

(declare-fun inv!12 (BitStream!11668) Bool)

(assert (=> start!57576 (and (inv!12 w1!584) e!184197)))

(declare-fun e!184202 () Bool)

(assert (=> start!57576 (and (inv!12 w2!580) e!184202)))

(declare-fun b!264024 () Bool)

(declare-fun e!184199 () Bool)

(assert (=> b!264024 (= e!184199 (not (arrayBitRangesEq!0 (buf!6895 w1!584) (buf!6895 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6427 (buf!6895 w1!584)) (currentByte!12759 w1!584) (currentBit!12754 w1!584)))))))

(declare-fun b!264025 () Bool)

(declare-fun e!184200 () Bool)

(assert (=> b!264025 (= e!184200 true)))

(declare-fun lt!405395 () BitStream!11668)

(assert (=> b!264025 (isPrefixOf!0 lt!405395 w2!580)))

(declare-datatypes ((Unit!18812 0))(
  ( (Unit!18813) )
))
(declare-fun lt!405393 () Unit!18812)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11668 BitStream!11668 BitStream!11668) Unit!18812)

(assert (=> b!264025 (= lt!405393 (lemmaIsPrefixTransitive!0 lt!405395 w1!584 w2!580))))

(declare-fun b!264026 () Bool)

(declare-fun res!220782 () Bool)

(assert (=> b!264026 (=> res!220782 e!184200)))

(assert (=> b!264026 (= res!220782 (not (isPrefixOf!0 lt!405395 w1!584)))))

(declare-fun b!264027 () Bool)

(declare-fun e!184198 () Unit!18812)

(declare-fun lt!405390 () Unit!18812)

(assert (=> b!264027 (= e!184198 lt!405390)))

(declare-fun lt!405392 () (_ BitVec 64))

(assert (=> b!264027 (= lt!405392 (bitIndex!0 (size!6427 (buf!6895 w1!584)) (currentByte!12759 w1!584) (currentBit!12754 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14729 array!14729 (_ BitVec 64) (_ BitVec 64)) Unit!18812)

(assert (=> b!264027 (= lt!405390 (arrayBitRangesEqSymmetric!0 (buf!6895 w1!584) (buf!6895 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405392))))

(assert (=> b!264027 (arrayBitRangesEq!0 (buf!6895 w2!580) (buf!6895 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405392)))

(declare-fun b!264028 () Bool)

(declare-fun Unit!18814 () Unit!18812)

(assert (=> b!264028 (= e!184198 Unit!18814)))

(declare-fun b!264029 () Bool)

(declare-fun array_inv!6151 (array!14729) Bool)

(assert (=> b!264029 (= e!184197 (array_inv!6151 (buf!6895 w1!584)))))

(declare-fun b!264030 () Bool)

(assert (=> b!264030 (= e!184202 (array_inv!6151 (buf!6895 w2!580)))))

(declare-fun b!264031 () Bool)

(declare-fun e!184205 () Bool)

(assert (=> b!264031 (= e!184205 e!184200)))

(declare-fun res!220778 () Bool)

(assert (=> b!264031 (=> res!220778 e!184200)))

(assert (=> b!264031 (= res!220778 e!184201)))

(declare-fun res!220780 () Bool)

(assert (=> b!264031 (=> (not res!220780) (not e!184201))))

(assert (=> b!264031 (= res!220780 (not (= (size!6427 (buf!6895 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!405394 () Unit!18812)

(assert (=> b!264031 (= lt!405394 e!184198)))

(declare-fun c!12087 () Bool)

(assert (=> b!264031 (= c!12087 (not (= (size!6427 (buf!6895 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!264032 () Bool)

(assert (=> b!264032 (= e!184206 (not e!184205))))

(declare-fun res!220781 () Bool)

(assert (=> b!264032 (=> res!220781 e!184205)))

(assert (=> b!264032 (= res!220781 e!184199)))

(declare-fun res!220783 () Bool)

(assert (=> b!264032 (=> (not res!220783) (not e!184199))))

(assert (=> b!264032 (= res!220783 (not (= (size!6427 (buf!6895 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!264032 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405391 () Unit!18812)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11668) Unit!18812)

(assert (=> b!264032 (= lt!405391 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!264032 (isPrefixOf!0 lt!405395 lt!405395)))

(declare-fun lt!405389 () Unit!18812)

(assert (=> b!264032 (= lt!405389 (lemmaIsPrefixRefl!0 lt!405395))))

(assert (=> b!264032 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405388 () Unit!18812)

(assert (=> b!264032 (= lt!405388 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!264032 (= lt!405395 (BitStream!11669 (buf!6895 w2!580) (currentByte!12759 w1!584) (currentBit!12754 w1!584)))))

(assert (= (and start!57576 res!220779) b!264032))

(assert (= (and b!264032 res!220783) b!264024))

(assert (= (and b!264032 (not res!220781)) b!264031))

(assert (= (and b!264031 c!12087) b!264027))

(assert (= (and b!264031 (not c!12087)) b!264028))

(assert (= (and b!264031 res!220780) b!264023))

(assert (= (and b!264031 (not res!220778)) b!264026))

(assert (= (and b!264026 (not res!220782)) b!264025))

(assert (= start!57576 b!264029))

(assert (= start!57576 b!264030))

(declare-fun m!394409 () Bool)

(assert (=> b!264024 m!394409))

(assert (=> b!264024 m!394409))

(declare-fun m!394411 () Bool)

(assert (=> b!264024 m!394411))

(assert (=> b!264027 m!394409))

(declare-fun m!394413 () Bool)

(assert (=> b!264027 m!394413))

(declare-fun m!394415 () Bool)

(assert (=> b!264027 m!394415))

(declare-fun m!394417 () Bool)

(assert (=> b!264026 m!394417))

(declare-fun m!394419 () Bool)

(assert (=> b!264025 m!394419))

(declare-fun m!394421 () Bool)

(assert (=> b!264025 m!394421))

(declare-fun m!394423 () Bool)

(assert (=> b!264030 m!394423))

(declare-fun m!394425 () Bool)

(assert (=> b!264032 m!394425))

(declare-fun m!394427 () Bool)

(assert (=> b!264032 m!394427))

(declare-fun m!394429 () Bool)

(assert (=> b!264032 m!394429))

(declare-fun m!394431 () Bool)

(assert (=> b!264032 m!394431))

(declare-fun m!394433 () Bool)

(assert (=> b!264032 m!394433))

(declare-fun m!394435 () Bool)

(assert (=> b!264032 m!394435))

(assert (=> b!264023 m!394409))

(assert (=> b!264023 m!394409))

(declare-fun m!394437 () Bool)

(assert (=> b!264023 m!394437))

(declare-fun m!394439 () Bool)

(assert (=> start!57576 m!394439))

(declare-fun m!394441 () Bool)

(assert (=> start!57576 m!394441))

(declare-fun m!394443 () Bool)

(assert (=> start!57576 m!394443))

(declare-fun m!394445 () Bool)

(assert (=> b!264029 m!394445))

(push 1)

(assert (not start!57576))

(assert (not b!264032))

(assert (not b!264027))

(assert (not b!264029))

