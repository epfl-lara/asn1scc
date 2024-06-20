; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57568 () Bool)

(assert start!57568)

(declare-fun b!263913 () Bool)

(declare-datatypes ((Unit!18800 0))(
  ( (Unit!18801) )
))
(declare-fun e!184078 () Unit!18800)

(declare-fun Unit!18802 () Unit!18800)

(assert (=> b!263913 (= e!184078 Unit!18802)))

(declare-fun res!220716 () Bool)

(declare-fun e!184077 () Bool)

(assert (=> start!57568 (=> (not res!220716) (not e!184077))))

(declare-datatypes ((array!14721 0))(
  ( (array!14722 (arr!7410 (Array (_ BitVec 32) (_ BitVec 8))) (size!6423 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11660 0))(
  ( (BitStream!11661 (buf!6891 array!14721) (currentByte!12755 (_ BitVec 32)) (currentBit!12750 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11660)

(declare-fun w2!580 () BitStream!11660)

(declare-fun isPrefixOf!0 (BitStream!11660 BitStream!11660) Bool)

(assert (=> start!57568 (= res!220716 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57568 e!184077))

(declare-fun e!184082 () Bool)

(declare-fun inv!12 (BitStream!11660) Bool)

(assert (=> start!57568 (and (inv!12 w1!584) e!184082)))

(declare-fun e!184083 () Bool)

(assert (=> start!57568 (and (inv!12 w2!580) e!184083)))

(declare-fun b!263914 () Bool)

(declare-fun e!184081 () Bool)

(assert (=> b!263914 (= e!184077 (not e!184081))))

(declare-fun res!220717 () Bool)

(assert (=> b!263914 (=> res!220717 e!184081)))

(declare-fun e!184080 () Bool)

(assert (=> b!263914 (= res!220717 e!184080)))

(declare-fun res!220720 () Bool)

(assert (=> b!263914 (=> (not res!220720) (not e!184080))))

(assert (=> b!263914 (= res!220720 (not (= (size!6423 (buf!6891 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!263914 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405293 () Unit!18800)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11660) Unit!18800)

(assert (=> b!263914 (= lt!405293 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!405294 () BitStream!11660)

(assert (=> b!263914 (isPrefixOf!0 lt!405294 lt!405294)))

(declare-fun lt!405298 () Unit!18800)

(assert (=> b!263914 (= lt!405298 (lemmaIsPrefixRefl!0 lt!405294))))

(assert (=> b!263914 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405299 () Unit!18800)

(assert (=> b!263914 (= lt!405299 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263914 (= lt!405294 (BitStream!11661 (buf!6891 w2!580) (currentByte!12755 w1!584) (currentBit!12750 w1!584)))))

(declare-fun b!263915 () Bool)

(declare-fun e!184084 () Bool)

(assert (=> b!263915 (= e!184084 true)))

(declare-fun lt!405297 () Bool)

(assert (=> b!263915 (= lt!405297 (isPrefixOf!0 lt!405294 w1!584))))

(declare-fun b!263916 () Bool)

(declare-fun e!184086 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14721 array!14721 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263916 (= e!184086 (not (arrayBitRangesEq!0 (buf!6891 w2!580) (buf!6891 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6423 (buf!6891 w1!584)) (currentByte!12755 w1!584) (currentBit!12750 w1!584)))))))

(declare-fun b!263917 () Bool)

(declare-fun lt!405292 () Unit!18800)

(assert (=> b!263917 (= e!184078 lt!405292)))

(declare-fun lt!405296 () (_ BitVec 64))

(assert (=> b!263917 (= lt!405296 (bitIndex!0 (size!6423 (buf!6891 w1!584)) (currentByte!12755 w1!584) (currentBit!12750 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14721 array!14721 (_ BitVec 64) (_ BitVec 64)) Unit!18800)

(assert (=> b!263917 (= lt!405292 (arrayBitRangesEqSymmetric!0 (buf!6891 w1!584) (buf!6891 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405296))))

(assert (=> b!263917 (arrayBitRangesEq!0 (buf!6891 w2!580) (buf!6891 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405296)))

(declare-fun b!263918 () Bool)

(declare-fun array_inv!6147 (array!14721) Bool)

(assert (=> b!263918 (= e!184083 (array_inv!6147 (buf!6891 w2!580)))))

(declare-fun b!263919 () Bool)

(assert (=> b!263919 (= e!184081 e!184084)))

(declare-fun res!220718 () Bool)

(assert (=> b!263919 (=> res!220718 e!184084)))

(assert (=> b!263919 (= res!220718 e!184086)))

(declare-fun res!220719 () Bool)

(assert (=> b!263919 (=> (not res!220719) (not e!184086))))

(assert (=> b!263919 (= res!220719 (not (= (size!6423 (buf!6891 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!405295 () Unit!18800)

(assert (=> b!263919 (= lt!405295 e!184078)))

(declare-fun c!12075 () Bool)

(assert (=> b!263919 (= c!12075 (not (= (size!6423 (buf!6891 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!263920 () Bool)

(assert (=> b!263920 (= e!184080 (not (arrayBitRangesEq!0 (buf!6891 w1!584) (buf!6891 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6423 (buf!6891 w1!584)) (currentByte!12755 w1!584) (currentBit!12750 w1!584)))))))

(declare-fun b!263921 () Bool)

(assert (=> b!263921 (= e!184082 (array_inv!6147 (buf!6891 w1!584)))))

(assert (= (and start!57568 res!220716) b!263914))

(assert (= (and b!263914 res!220720) b!263920))

(assert (= (and b!263914 (not res!220717)) b!263919))

(assert (= (and b!263919 c!12075) b!263917))

(assert (= (and b!263919 (not c!12075)) b!263913))

(assert (= (and b!263919 res!220719) b!263916))

(assert (= (and b!263919 (not res!220718)) b!263915))

(assert (= start!57568 b!263921))

(assert (= start!57568 b!263918))

(declare-fun m!394273 () Bool)

(assert (=> b!263916 m!394273))

(assert (=> b!263916 m!394273))

(declare-fun m!394275 () Bool)

(assert (=> b!263916 m!394275))

(declare-fun m!394277 () Bool)

(assert (=> b!263915 m!394277))

(declare-fun m!394279 () Bool)

(assert (=> start!57568 m!394279))

(declare-fun m!394281 () Bool)

(assert (=> start!57568 m!394281))

(declare-fun m!394283 () Bool)

(assert (=> start!57568 m!394283))

(declare-fun m!394285 () Bool)

(assert (=> b!263914 m!394285))

(declare-fun m!394287 () Bool)

(assert (=> b!263914 m!394287))

(declare-fun m!394289 () Bool)

(assert (=> b!263914 m!394289))

(declare-fun m!394291 () Bool)

(assert (=> b!263914 m!394291))

(declare-fun m!394293 () Bool)

(assert (=> b!263914 m!394293))

(declare-fun m!394295 () Bool)

(assert (=> b!263914 m!394295))

(declare-fun m!394297 () Bool)

(assert (=> b!263918 m!394297))

(assert (=> b!263917 m!394273))

(declare-fun m!394299 () Bool)

(assert (=> b!263917 m!394299))

(declare-fun m!394301 () Bool)

(assert (=> b!263917 m!394301))

(assert (=> b!263920 m!394273))

(assert (=> b!263920 m!394273))

(declare-fun m!394303 () Bool)

(assert (=> b!263920 m!394303))

(declare-fun m!394305 () Bool)

(assert (=> b!263921 m!394305))

(push 1)

