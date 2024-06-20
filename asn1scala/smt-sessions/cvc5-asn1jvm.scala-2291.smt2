; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58044 () Bool)

(assert start!58044)

(declare-fun b!266558 () Bool)

(declare-fun e!186505 () Bool)

(declare-datatypes ((array!14858 0))(
  ( (array!14859 (arr!7465 (Array (_ BitVec 32) (_ BitVec 8))) (size!6478 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11770 0))(
  ( (BitStream!11771 (buf!6946 array!14858) (currentByte!12840 (_ BitVec 32)) (currentBit!12835 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11770)

(declare-fun array_inv!6202 (array!14858) Bool)

(assert (=> b!266558 (= e!186505 (array_inv!6202 (buf!6946 w1!584)))))

(declare-fun b!266560 () Bool)

(declare-datatypes ((Unit!18932 0))(
  ( (Unit!18933) )
))
(declare-fun e!186510 () Unit!18932)

(declare-fun Unit!18934 () Unit!18932)

(assert (=> b!266560 (= e!186510 Unit!18934)))

(declare-fun b!266561 () Bool)

(declare-fun lt!407270 () Unit!18932)

(assert (=> b!266561 (= e!186510 lt!407270)))

(declare-fun lt!407265 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266561 (= lt!407265 (bitIndex!0 (size!6478 (buf!6946 w1!584)) (currentByte!12840 w1!584) (currentBit!12835 w1!584)))))

(declare-fun w2!580 () BitStream!11770)

(declare-fun arrayBitRangesEqSymmetric!0 (array!14858 array!14858 (_ BitVec 64) (_ BitVec 64)) Unit!18932)

(assert (=> b!266561 (= lt!407270 (arrayBitRangesEqSymmetric!0 (buf!6946 w1!584) (buf!6946 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407265))))

(declare-fun arrayBitRangesEq!0 (array!14858 array!14858 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!266561 (arrayBitRangesEq!0 (buf!6946 w2!580) (buf!6946 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407265)))

(declare-fun b!266562 () Bool)

(declare-fun e!186502 () Bool)

(assert (=> b!266562 (= e!186502 (not (arrayBitRangesEq!0 (buf!6946 w2!580) (buf!6946 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6478 (buf!6946 w1!584)) (currentByte!12840 w1!584) (currentBit!12835 w1!584)))))))

(declare-fun b!266563 () Bool)

(declare-fun e!186501 () Bool)

(assert (=> b!266563 (= e!186501 (not (arrayBitRangesEq!0 (buf!6946 w1!584) (buf!6946 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6478 (buf!6946 w1!584)) (currentByte!12840 w1!584) (currentBit!12835 w1!584)))))))

(declare-fun res!222637 () Bool)

(declare-fun e!186507 () Bool)

(assert (=> start!58044 (=> (not res!222637) (not e!186507))))

(declare-fun isPrefixOf!0 (BitStream!11770 BitStream!11770) Bool)

(assert (=> start!58044 (= res!222637 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58044 e!186507))

(declare-fun inv!12 (BitStream!11770) Bool)

(assert (=> start!58044 (and (inv!12 w1!584) e!186505)))

(declare-fun e!186503 () Bool)

(assert (=> start!58044 (and (inv!12 w2!580) e!186503)))

(declare-fun b!266559 () Bool)

(declare-fun e!186509 () Bool)

(assert (=> b!266559 (= e!186507 (not e!186509))))

(declare-fun res!222634 () Bool)

(assert (=> b!266559 (=> res!222634 e!186509)))

(assert (=> b!266559 (= res!222634 e!186501)))

(declare-fun res!222632 () Bool)

(assert (=> b!266559 (=> (not res!222632) (not e!186501))))

(assert (=> b!266559 (= res!222632 (not (= (size!6478 (buf!6946 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266559 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407263 () Unit!18932)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11770) Unit!18932)

(assert (=> b!266559 (= lt!407263 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!407268 () BitStream!11770)

(assert (=> b!266559 (isPrefixOf!0 lt!407268 lt!407268)))

(declare-fun lt!407264 () Unit!18932)

(assert (=> b!266559 (= lt!407264 (lemmaIsPrefixRefl!0 lt!407268))))

(assert (=> b!266559 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407266 () Unit!18932)

(assert (=> b!266559 (= lt!407266 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266559 (= lt!407268 (BitStream!11771 (buf!6946 w2!580) (currentByte!12840 w1!584) (currentBit!12835 w1!584)))))

(declare-fun b!266564 () Bool)

(declare-fun e!186504 () Bool)

(assert (=> b!266564 (= e!186509 e!186504)))

(declare-fun res!222636 () Bool)

(assert (=> b!266564 (=> res!222636 e!186504)))

(assert (=> b!266564 (= res!222636 e!186502)))

(declare-fun res!222633 () Bool)

(assert (=> b!266564 (=> (not res!222633) (not e!186502))))

(assert (=> b!266564 (= res!222633 (not (= (size!6478 (buf!6946 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!407269 () Unit!18932)

(assert (=> b!266564 (= lt!407269 e!186510)))

(declare-fun c!12273 () Bool)

(assert (=> b!266564 (= c!12273 (not (= (size!6478 (buf!6946 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!266565 () Bool)

(declare-fun res!222635 () Bool)

(assert (=> b!266565 (=> res!222635 e!186504)))

(assert (=> b!266565 (= res!222635 (not (isPrefixOf!0 lt!407268 w1!584)))))

(declare-fun b!266566 () Bool)

(assert (=> b!266566 (= e!186503 (array_inv!6202 (buf!6946 w2!580)))))

(declare-fun b!266567 () Bool)

(assert (=> b!266567 (= e!186504 true)))

(assert (=> b!266567 (isPrefixOf!0 lt!407268 w2!580)))

(declare-fun lt!407267 () Unit!18932)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11770 BitStream!11770 BitStream!11770) Unit!18932)

(assert (=> b!266567 (= lt!407267 (lemmaIsPrefixTransitive!0 lt!407268 w1!584 w2!580))))

(assert (= (and start!58044 res!222637) b!266559))

(assert (= (and b!266559 res!222632) b!266563))

(assert (= (and b!266559 (not res!222634)) b!266564))

(assert (= (and b!266564 c!12273) b!266561))

(assert (= (and b!266564 (not c!12273)) b!266560))

(assert (= (and b!266564 res!222633) b!266562))

(assert (= (and b!266564 (not res!222636)) b!266565))

(assert (= (and b!266565 (not res!222635)) b!266567))

(assert (= start!58044 b!266558))

(assert (= start!58044 b!266566))

(declare-fun m!397397 () Bool)

(assert (=> b!266559 m!397397))

(declare-fun m!397399 () Bool)

(assert (=> b!266559 m!397399))

(declare-fun m!397401 () Bool)

(assert (=> b!266559 m!397401))

(declare-fun m!397403 () Bool)

(assert (=> b!266559 m!397403))

(declare-fun m!397405 () Bool)

(assert (=> b!266559 m!397405))

(declare-fun m!397407 () Bool)

(assert (=> b!266559 m!397407))

(declare-fun m!397409 () Bool)

(assert (=> b!266567 m!397409))

(declare-fun m!397411 () Bool)

(assert (=> b!266567 m!397411))

(declare-fun m!397413 () Bool)

(assert (=> b!266558 m!397413))

(declare-fun m!397415 () Bool)

(assert (=> b!266561 m!397415))

(declare-fun m!397417 () Bool)

(assert (=> b!266561 m!397417))

(declare-fun m!397419 () Bool)

(assert (=> b!266561 m!397419))

(assert (=> b!266563 m!397415))

(assert (=> b!266563 m!397415))

(declare-fun m!397421 () Bool)

(assert (=> b!266563 m!397421))

(declare-fun m!397423 () Bool)

(assert (=> b!266566 m!397423))

(declare-fun m!397425 () Bool)

(assert (=> start!58044 m!397425))

(declare-fun m!397427 () Bool)

(assert (=> start!58044 m!397427))

(declare-fun m!397429 () Bool)

(assert (=> start!58044 m!397429))

(assert (=> b!266562 m!397415))

(assert (=> b!266562 m!397415))

(declare-fun m!397431 () Bool)

(assert (=> b!266562 m!397431))

(declare-fun m!397433 () Bool)

(assert (=> b!266565 m!397433))

(push 1)

