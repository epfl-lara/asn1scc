; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57564 () Bool)

(assert start!57564)

(declare-fun b!263859 () Bool)

(declare-fun e!184020 () Bool)

(assert (=> b!263859 (= e!184020 true)))

(declare-fun lt!405245 () Bool)

(declare-datatypes ((array!14717 0))(
  ( (array!14718 (arr!7408 (Array (_ BitVec 32) (_ BitVec 8))) (size!6421 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11656 0))(
  ( (BitStream!11657 (buf!6889 array!14717) (currentByte!12753 (_ BitVec 32)) (currentBit!12748 (_ BitVec 32))) )
))
(declare-fun lt!405249 () BitStream!11656)

(declare-fun w1!584 () BitStream!11656)

(declare-fun isPrefixOf!0 (BitStream!11656 BitStream!11656) Bool)

(assert (=> b!263859 (= lt!405245 (isPrefixOf!0 lt!405249 w1!584))))

(declare-fun b!263860 () Bool)

(declare-fun e!184022 () Bool)

(declare-fun w2!580 () BitStream!11656)

(declare-fun array_inv!6145 (array!14717) Bool)

(assert (=> b!263860 (= e!184022 (array_inv!6145 (buf!6889 w2!580)))))

(declare-fun b!263861 () Bool)

(declare-fun e!184023 () Bool)

(assert (=> b!263861 (= e!184023 e!184020)))

(declare-fun res!220688 () Bool)

(assert (=> b!263861 (=> res!220688 e!184020)))

(declare-fun e!184017 () Bool)

(assert (=> b!263861 (= res!220688 e!184017)))

(declare-fun res!220689 () Bool)

(assert (=> b!263861 (=> (not res!220689) (not e!184017))))

(assert (=> b!263861 (= res!220689 (not (= (size!6421 (buf!6889 w1!584)) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!18794 0))(
  ( (Unit!18795) )
))
(declare-fun lt!405251 () Unit!18794)

(declare-fun e!184018 () Unit!18794)

(assert (=> b!263861 (= lt!405251 e!184018)))

(declare-fun c!12069 () Bool)

(assert (=> b!263861 (= c!12069 (not (= (size!6421 (buf!6889 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun res!220687 () Bool)

(declare-fun e!184026 () Bool)

(assert (=> start!57564 (=> (not res!220687) (not e!184026))))

(assert (=> start!57564 (= res!220687 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57564 e!184026))

(declare-fun e!184019 () Bool)

(declare-fun inv!12 (BitStream!11656) Bool)

(assert (=> start!57564 (and (inv!12 w1!584) e!184019)))

(assert (=> start!57564 (and (inv!12 w2!580) e!184022)))

(declare-fun b!263862 () Bool)

(declare-fun e!184021 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14717 array!14717 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263862 (= e!184021 (not (arrayBitRangesEq!0 (buf!6889 w1!584) (buf!6889 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6421 (buf!6889 w1!584)) (currentByte!12753 w1!584) (currentBit!12748 w1!584)))))))

(declare-fun b!263863 () Bool)

(assert (=> b!263863 (= e!184017 (not (arrayBitRangesEq!0 (buf!6889 w2!580) (buf!6889 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6421 (buf!6889 w1!584)) (currentByte!12753 w1!584) (currentBit!12748 w1!584)))))))

(declare-fun b!263864 () Bool)

(declare-fun Unit!18796 () Unit!18794)

(assert (=> b!263864 (= e!184018 Unit!18796)))

(declare-fun b!263865 () Bool)

(assert (=> b!263865 (= e!184026 (not e!184023))))

(declare-fun res!220690 () Bool)

(assert (=> b!263865 (=> res!220690 e!184023)))

(assert (=> b!263865 (= res!220690 e!184021)))

(declare-fun res!220686 () Bool)

(assert (=> b!263865 (=> (not res!220686) (not e!184021))))

(assert (=> b!263865 (= res!220686 (not (= (size!6421 (buf!6889 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!263865 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405248 () Unit!18794)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11656) Unit!18794)

(assert (=> b!263865 (= lt!405248 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!263865 (isPrefixOf!0 lt!405249 lt!405249)))

(declare-fun lt!405247 () Unit!18794)

(assert (=> b!263865 (= lt!405247 (lemmaIsPrefixRefl!0 lt!405249))))

(assert (=> b!263865 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405250 () Unit!18794)

(assert (=> b!263865 (= lt!405250 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263865 (= lt!405249 (BitStream!11657 (buf!6889 w2!580) (currentByte!12753 w1!584) (currentBit!12748 w1!584)))))

(declare-fun b!263866 () Bool)

(declare-fun lt!405246 () Unit!18794)

(assert (=> b!263866 (= e!184018 lt!405246)))

(declare-fun lt!405244 () (_ BitVec 64))

(assert (=> b!263866 (= lt!405244 (bitIndex!0 (size!6421 (buf!6889 w1!584)) (currentByte!12753 w1!584) (currentBit!12748 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14717 array!14717 (_ BitVec 64) (_ BitVec 64)) Unit!18794)

(assert (=> b!263866 (= lt!405246 (arrayBitRangesEqSymmetric!0 (buf!6889 w1!584) (buf!6889 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405244))))

(assert (=> b!263866 (arrayBitRangesEq!0 (buf!6889 w2!580) (buf!6889 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405244)))

(declare-fun b!263867 () Bool)

(assert (=> b!263867 (= e!184019 (array_inv!6145 (buf!6889 w1!584)))))

(assert (= (and start!57564 res!220687) b!263865))

(assert (= (and b!263865 res!220686) b!263862))

(assert (= (and b!263865 (not res!220690)) b!263861))

(assert (= (and b!263861 c!12069) b!263866))

(assert (= (and b!263861 (not c!12069)) b!263864))

(assert (= (and b!263861 res!220689) b!263863))

(assert (= (and b!263861 (not res!220688)) b!263859))

(assert (= start!57564 b!263867))

(assert (= start!57564 b!263860))

(declare-fun m!394205 () Bool)

(assert (=> b!263860 m!394205))

(declare-fun m!394207 () Bool)

(assert (=> start!57564 m!394207))

(declare-fun m!394209 () Bool)

(assert (=> start!57564 m!394209))

(declare-fun m!394211 () Bool)

(assert (=> start!57564 m!394211))

(declare-fun m!394213 () Bool)

(assert (=> b!263862 m!394213))

(assert (=> b!263862 m!394213))

(declare-fun m!394215 () Bool)

(assert (=> b!263862 m!394215))

(assert (=> b!263863 m!394213))

(assert (=> b!263863 m!394213))

(declare-fun m!394217 () Bool)

(assert (=> b!263863 m!394217))

(declare-fun m!394219 () Bool)

(assert (=> b!263859 m!394219))

(declare-fun m!394221 () Bool)

(assert (=> b!263865 m!394221))

(declare-fun m!394223 () Bool)

(assert (=> b!263865 m!394223))

(declare-fun m!394225 () Bool)

(assert (=> b!263865 m!394225))

(declare-fun m!394227 () Bool)

(assert (=> b!263865 m!394227))

(declare-fun m!394229 () Bool)

(assert (=> b!263865 m!394229))

(declare-fun m!394231 () Bool)

(assert (=> b!263865 m!394231))

(declare-fun m!394233 () Bool)

(assert (=> b!263867 m!394233))

(assert (=> b!263866 m!394213))

(declare-fun m!394235 () Bool)

(assert (=> b!263866 m!394235))

(declare-fun m!394237 () Bool)

(assert (=> b!263866 m!394237))

(push 1)

(assert (not b!263860))

(assert (not b!263866))

(assert (not start!57564))

(assert (not b!263859))

(assert (not b!263867))

(assert (not b!263863))

(assert (not b!263862))

(assert (not b!263865))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

