; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57812 () Bool)

(assert start!57812)

(declare-fun b!265267 () Bool)

(declare-fun e!185284 () Bool)

(declare-datatypes ((array!14779 0))(
  ( (array!14780 (arr!7433 (Array (_ BitVec 32) (_ BitVec 8))) (size!6446 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11706 0))(
  ( (BitStream!11707 (buf!6914 array!14779) (currentByte!12796 (_ BitVec 32)) (currentBit!12791 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11706)

(declare-fun array_inv!6170 (array!14779) Bool)

(assert (=> b!265267 (= e!185284 (array_inv!6170 (buf!6914 w2!580)))))

(declare-fun b!265268 () Bool)

(declare-fun e!185286 () Bool)

(declare-fun w1!584 () BitStream!11706)

(declare-fun arrayBitRangesEq!0 (array!14779 array!14779 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!265268 (= e!185286 (arrayBitRangesEq!0 (buf!6914 w2!580) (buf!6914 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6446 (buf!6914 w1!584)) (currentByte!12796 w1!584) (currentBit!12791 w1!584))))))

(declare-fun b!265269 () Bool)

(declare-datatypes ((Unit!18866 0))(
  ( (Unit!18867) )
))
(declare-fun e!185279 () Unit!18866)

(declare-fun Unit!18868 () Unit!18866)

(assert (=> b!265269 (= e!185279 Unit!18868)))

(declare-fun b!265270 () Bool)

(declare-fun e!185283 () Bool)

(assert (=> b!265270 (= e!185283 (not (arrayBitRangesEq!0 (buf!6914 w1!584) (buf!6914 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6446 (buf!6914 w1!584)) (currentByte!12796 w1!584) (currentBit!12791 w1!584)))))))

(declare-fun b!265271 () Bool)

(declare-fun e!185280 () Bool)

(declare-fun e!185281 () Bool)

(assert (=> b!265271 (= e!185280 (not e!185281))))

(declare-fun res!221702 () Bool)

(assert (=> b!265271 (=> res!221702 e!185281)))

(assert (=> b!265271 (= res!221702 e!185283)))

(declare-fun res!221704 () Bool)

(assert (=> b!265271 (=> (not res!221704) (not e!185283))))

(assert (=> b!265271 (= res!221704 (not (= (size!6446 (buf!6914 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11706 BitStream!11706) Bool)

(assert (=> b!265271 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406368 () Unit!18866)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11706) Unit!18866)

(assert (=> b!265271 (= lt!406368 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406373 () BitStream!11706)

(assert (=> b!265271 (isPrefixOf!0 lt!406373 lt!406373)))

(declare-fun lt!406370 () Unit!18866)

(assert (=> b!265271 (= lt!406370 (lemmaIsPrefixRefl!0 lt!406373))))

(assert (=> b!265271 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406371 () Unit!18866)

(assert (=> b!265271 (= lt!406371 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!265271 (= lt!406373 (BitStream!11707 (buf!6914 w2!580) (currentByte!12796 w1!584) (currentBit!12791 w1!584)))))

(declare-fun b!265272 () Bool)

(declare-fun e!185285 () Bool)

(assert (=> b!265272 (= e!185285 (array_inv!6170 (buf!6914 w1!584)))))

(declare-fun res!221701 () Bool)

(assert (=> start!57812 (=> (not res!221701) (not e!185280))))

(assert (=> start!57812 (= res!221701 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57812 e!185280))

(declare-fun inv!12 (BitStream!11706) Bool)

(assert (=> start!57812 (and (inv!12 w1!584) e!185285)))

(assert (=> start!57812 (and (inv!12 w2!580) e!185284)))

(declare-fun b!265273 () Bool)

(declare-fun lt!406367 () Unit!18866)

(assert (=> b!265273 (= e!185279 lt!406367)))

(declare-fun lt!406369 () (_ BitVec 64))

(assert (=> b!265273 (= lt!406369 (bitIndex!0 (size!6446 (buf!6914 w1!584)) (currentByte!12796 w1!584) (currentBit!12791 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14779 array!14779 (_ BitVec 64) (_ BitVec 64)) Unit!18866)

(assert (=> b!265273 (= lt!406367 (arrayBitRangesEqSymmetric!0 (buf!6914 w1!584) (buf!6914 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406369))))

(assert (=> b!265273 (arrayBitRangesEq!0 (buf!6914 w2!580) (buf!6914 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406369)))

(declare-fun b!265274 () Bool)

(assert (=> b!265274 (= e!185281 e!185286)))

(declare-fun res!221703 () Bool)

(assert (=> b!265274 (=> res!221703 e!185286)))

(assert (=> b!265274 (= res!221703 (= (size!6446 (buf!6914 w1!584)) #b00000000000000000000000000000000))))

(declare-fun lt!406372 () Unit!18866)

(assert (=> b!265274 (= lt!406372 e!185279)))

(declare-fun c!12189 () Bool)

(assert (=> b!265274 (= c!12189 (not (= (size!6446 (buf!6914 w1!584)) #b00000000000000000000000000000000)))))

(assert (= (and start!57812 res!221701) b!265271))

(assert (= (and b!265271 res!221704) b!265270))

(assert (= (and b!265271 (not res!221702)) b!265274))

(assert (= (and b!265274 c!12189) b!265273))

(assert (= (and b!265274 (not c!12189)) b!265269))

(assert (= (and b!265274 (not res!221703)) b!265268))

(assert (= start!57812 b!265272))

(assert (= start!57812 b!265267))

(declare-fun m!395935 () Bool)

(assert (=> b!265267 m!395935))

(declare-fun m!395937 () Bool)

(assert (=> b!265272 m!395937))

(declare-fun m!395939 () Bool)

(assert (=> b!265271 m!395939))

(declare-fun m!395941 () Bool)

(assert (=> b!265271 m!395941))

(declare-fun m!395943 () Bool)

(assert (=> b!265271 m!395943))

(declare-fun m!395945 () Bool)

(assert (=> b!265271 m!395945))

(declare-fun m!395947 () Bool)

(assert (=> b!265271 m!395947))

(declare-fun m!395949 () Bool)

(assert (=> b!265271 m!395949))

(declare-fun m!395951 () Bool)

(assert (=> b!265273 m!395951))

(declare-fun m!395953 () Bool)

(assert (=> b!265273 m!395953))

(declare-fun m!395955 () Bool)

(assert (=> b!265273 m!395955))

(assert (=> b!265268 m!395951))

(assert (=> b!265268 m!395951))

(declare-fun m!395957 () Bool)

(assert (=> b!265268 m!395957))

(declare-fun m!395959 () Bool)

(assert (=> start!57812 m!395959))

(declare-fun m!395961 () Bool)

(assert (=> start!57812 m!395961))

(declare-fun m!395963 () Bool)

(assert (=> start!57812 m!395963))

(assert (=> b!265270 m!395951))

(assert (=> b!265270 m!395951))

(declare-fun m!395965 () Bool)

(assert (=> b!265270 m!395965))

(check-sat (not start!57812) (not b!265270) (not b!265268) (not b!265271) (not b!265267) (not b!265273) (not b!265272))
(check-sat)
