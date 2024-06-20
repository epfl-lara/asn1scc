; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58020 () Bool)

(assert start!58020)

(declare-fun res!222441 () Bool)

(declare-fun e!186156 () Bool)

(assert (=> start!58020 (=> (not res!222441) (not e!186156))))

(declare-datatypes ((array!14834 0))(
  ( (array!14835 (arr!7453 (Array (_ BitVec 32) (_ BitVec 8))) (size!6466 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11746 0))(
  ( (BitStream!11747 (buf!6934 array!14834) (currentByte!12828 (_ BitVec 32)) (currentBit!12823 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11746)

(declare-fun w2!580 () BitStream!11746)

(declare-fun isPrefixOf!0 (BitStream!11746 BitStream!11746) Bool)

(assert (=> start!58020 (= res!222441 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58020 e!186156))

(declare-fun e!186158 () Bool)

(declare-fun inv!12 (BitStream!11746) Bool)

(assert (=> start!58020 (and (inv!12 w1!584) e!186158)))

(declare-fun e!186159 () Bool)

(assert (=> start!58020 (and (inv!12 w2!580) e!186159)))

(declare-fun b!266237 () Bool)

(declare-fun res!222445 () Bool)

(declare-fun e!186162 () Bool)

(assert (=> b!266237 (=> res!222445 e!186162)))

(assert (=> b!266237 (= res!222445 (= (size!6466 (buf!6934 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266238 () Bool)

(assert (=> b!266238 (= e!186156 (not e!186162))))

(declare-fun res!222443 () Bool)

(assert (=> b!266238 (=> res!222443 e!186162)))

(declare-fun e!186155 () Bool)

(assert (=> b!266238 (= res!222443 e!186155)))

(declare-fun res!222442 () Bool)

(assert (=> b!266238 (=> (not res!222442) (not e!186155))))

(assert (=> b!266238 (= res!222442 (not (= (size!6466 (buf!6934 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266238 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18899 0))(
  ( (Unit!18900) )
))
(declare-fun lt!406997 () Unit!18899)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11746) Unit!18899)

(assert (=> b!266238 (= lt!406997 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!407000 () BitStream!11746)

(assert (=> b!266238 (isPrefixOf!0 lt!407000 lt!407000)))

(declare-fun lt!406996 () Unit!18899)

(assert (=> b!266238 (= lt!406996 (lemmaIsPrefixRefl!0 lt!407000))))

(assert (=> b!266238 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406998 () Unit!18899)

(assert (=> b!266238 (= lt!406998 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266238 (= lt!407000 (BitStream!11747 (buf!6934 w2!580) (currentByte!12828 w1!584) (currentBit!12823 w1!584)))))

(declare-fun b!266239 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14834 array!14834 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266239 (= e!186155 (not (arrayBitRangesEq!0 (buf!6934 w1!584) (buf!6934 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6466 (buf!6934 w1!584)) (currentByte!12828 w1!584) (currentBit!12823 w1!584)))))))

(declare-fun b!266240 () Bool)

(declare-fun array_inv!6190 (array!14834) Bool)

(assert (=> b!266240 (= e!186159 (array_inv!6190 (buf!6934 w2!580)))))

(declare-fun e!186161 () Bool)

(declare-fun b!266241 () Bool)

(declare-fun lt!406999 () (_ BitVec 64))

(assert (=> b!266241 (= e!186161 (arrayBitRangesEq!0 (buf!6934 w1!584) (buf!6934 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!406999))))

(declare-fun b!266242 () Bool)

(assert (=> b!266242 (= e!186158 (array_inv!6190 (buf!6934 w1!584)))))

(declare-fun b!266243 () Bool)

(assert (=> b!266243 (= e!186162 e!186161)))

(declare-fun res!222444 () Bool)

(assert (=> b!266243 (=> res!222444 e!186161)))

(assert (=> b!266243 (= res!222444 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!406999) (not (= (size!6466 (buf!6934 w1!584)) (size!6466 (buf!6934 w2!580)))) (bvsgt lt!406999 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6466 (buf!6934 w1!584)))))))))

(assert (=> b!266243 (= lt!406999 (bitIndex!0 (size!6466 (buf!6934 w1!584)) (currentByte!12828 w1!584) (currentBit!12823 w1!584)))))

(assert (= (and start!58020 res!222441) b!266238))

(assert (= (and b!266238 res!222442) b!266239))

(assert (= (and b!266238 (not res!222443)) b!266237))

(assert (= (and b!266237 (not res!222445)) b!266243))

(assert (= (and b!266243 (not res!222444)) b!266241))

(assert (= start!58020 b!266242))

(assert (= start!58020 b!266240))

(declare-fun m!396995 () Bool)

(assert (=> b!266242 m!396995))

(declare-fun m!396997 () Bool)

(assert (=> b!266239 m!396997))

(assert (=> b!266239 m!396997))

(declare-fun m!396999 () Bool)

(assert (=> b!266239 m!396999))

(declare-fun m!397001 () Bool)

(assert (=> start!58020 m!397001))

(declare-fun m!397003 () Bool)

(assert (=> start!58020 m!397003))

(declare-fun m!397005 () Bool)

(assert (=> start!58020 m!397005))

(assert (=> b!266243 m!396997))

(declare-fun m!397007 () Bool)

(assert (=> b!266238 m!397007))

(declare-fun m!397009 () Bool)

(assert (=> b!266238 m!397009))

(declare-fun m!397011 () Bool)

(assert (=> b!266238 m!397011))

(declare-fun m!397013 () Bool)

(assert (=> b!266238 m!397013))

(declare-fun m!397015 () Bool)

(assert (=> b!266238 m!397015))

(declare-fun m!397017 () Bool)

(assert (=> b!266238 m!397017))

(declare-fun m!397019 () Bool)

(assert (=> b!266241 m!397019))

(declare-fun m!397021 () Bool)

(assert (=> b!266240 m!397021))

(push 1)

(assert (not b!266243))

(assert (not b!266240))

(assert (not b!266241))

(assert (not b!266238))

(assert (not start!58020))

(assert (not b!266242))

(assert (not b!266239))

(check-sat)

(pop 1)

