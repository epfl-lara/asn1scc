; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58042 () Bool)

(assert start!58042)

(declare-fun b!266528 () Bool)

(declare-fun e!186478 () Bool)

(declare-datatypes ((array!14856 0))(
  ( (array!14857 (arr!7464 (Array (_ BitVec 32) (_ BitVec 8))) (size!6477 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11768 0))(
  ( (BitStream!11769 (buf!6945 array!14856) (currentByte!12839 (_ BitVec 32)) (currentBit!12834 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11768)

(declare-fun array_inv!6201 (array!14856) Bool)

(assert (=> b!266528 (= e!186478 (array_inv!6201 (buf!6945 w1!584)))))

(declare-fun b!266529 () Bool)

(declare-fun e!186472 () Bool)

(declare-fun w2!580 () BitStream!11768)

(assert (=> b!266529 (= e!186472 (array_inv!6201 (buf!6945 w2!580)))))

(declare-fun b!266530 () Bool)

(declare-fun e!186473 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14856 array!14856 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266530 (= e!186473 (not (arrayBitRangesEq!0 (buf!6945 w2!580) (buf!6945 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6477 (buf!6945 w1!584)) (currentByte!12839 w1!584) (currentBit!12834 w1!584)))))))

(declare-fun b!266531 () Bool)

(declare-datatypes ((Unit!18929 0))(
  ( (Unit!18930) )
))
(declare-fun e!186476 () Unit!18929)

(declare-fun Unit!18931 () Unit!18929)

(assert (=> b!266531 (= e!186476 Unit!18931)))

(declare-fun res!222614 () Bool)

(declare-fun e!186475 () Bool)

(assert (=> start!58042 (=> (not res!222614) (not e!186475))))

(declare-fun isPrefixOf!0 (BitStream!11768 BitStream!11768) Bool)

(assert (=> start!58042 (= res!222614 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58042 e!186475))

(declare-fun inv!12 (BitStream!11768) Bool)

(assert (=> start!58042 (and (inv!12 w1!584) e!186478)))

(assert (=> start!58042 (and (inv!12 w2!580) e!186472)))

(declare-fun b!266532 () Bool)

(declare-fun e!186479 () Bool)

(declare-fun e!186474 () Bool)

(assert (=> b!266532 (= e!186479 e!186474)))

(declare-fun res!222618 () Bool)

(assert (=> b!266532 (=> res!222618 e!186474)))

(assert (=> b!266532 (= res!222618 e!186473)))

(declare-fun res!222619 () Bool)

(assert (=> b!266532 (=> (not res!222619) (not e!186473))))

(assert (=> b!266532 (= res!222619 (not (= (size!6477 (buf!6945 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!407243 () Unit!18929)

(assert (=> b!266532 (= lt!407243 e!186476)))

(declare-fun c!12270 () Bool)

(assert (=> b!266532 (= c!12270 (not (= (size!6477 (buf!6945 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!266533 () Bool)

(declare-fun lt!407244 () Unit!18929)

(assert (=> b!266533 (= e!186476 lt!407244)))

(declare-fun lt!407241 () (_ BitVec 64))

(assert (=> b!266533 (= lt!407241 (bitIndex!0 (size!6477 (buf!6945 w1!584)) (currentByte!12839 w1!584) (currentBit!12834 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14856 array!14856 (_ BitVec 64) (_ BitVec 64)) Unit!18929)

(assert (=> b!266533 (= lt!407244 (arrayBitRangesEqSymmetric!0 (buf!6945 w1!584) (buf!6945 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407241))))

(assert (=> b!266533 (arrayBitRangesEq!0 (buf!6945 w2!580) (buf!6945 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407241)))

(declare-fun b!266534 () Bool)

(assert (=> b!266534 (= e!186474 true)))

(declare-fun lt!407246 () BitStream!11768)

(assert (=> b!266534 (isPrefixOf!0 lt!407246 w2!580)))

(declare-fun lt!407242 () Unit!18929)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11768 BitStream!11768 BitStream!11768) Unit!18929)

(assert (=> b!266534 (= lt!407242 (lemmaIsPrefixTransitive!0 lt!407246 w1!584 w2!580))))

(declare-fun b!266535 () Bool)

(assert (=> b!266535 (= e!186475 (not e!186479))))

(declare-fun res!222617 () Bool)

(assert (=> b!266535 (=> res!222617 e!186479)))

(declare-fun e!186480 () Bool)

(assert (=> b!266535 (= res!222617 e!186480)))

(declare-fun res!222615 () Bool)

(assert (=> b!266535 (=> (not res!222615) (not e!186480))))

(assert (=> b!266535 (= res!222615 (not (= (size!6477 (buf!6945 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266535 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407240 () Unit!18929)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11768) Unit!18929)

(assert (=> b!266535 (= lt!407240 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!266535 (isPrefixOf!0 lt!407246 lt!407246)))

(declare-fun lt!407239 () Unit!18929)

(assert (=> b!266535 (= lt!407239 (lemmaIsPrefixRefl!0 lt!407246))))

(assert (=> b!266535 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407245 () Unit!18929)

(assert (=> b!266535 (= lt!407245 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266535 (= lt!407246 (BitStream!11769 (buf!6945 w2!580) (currentByte!12839 w1!584) (currentBit!12834 w1!584)))))

(declare-fun b!266536 () Bool)

(declare-fun res!222616 () Bool)

(assert (=> b!266536 (=> res!222616 e!186474)))

(assert (=> b!266536 (= res!222616 (not (isPrefixOf!0 lt!407246 w1!584)))))

(declare-fun b!266537 () Bool)

(assert (=> b!266537 (= e!186480 (not (arrayBitRangesEq!0 (buf!6945 w1!584) (buf!6945 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6477 (buf!6945 w1!584)) (currentByte!12839 w1!584) (currentBit!12834 w1!584)))))))

(assert (= (and start!58042 res!222614) b!266535))

(assert (= (and b!266535 res!222615) b!266537))

(assert (= (and b!266535 (not res!222617)) b!266532))

(assert (= (and b!266532 c!12270) b!266533))

(assert (= (and b!266532 (not c!12270)) b!266531))

(assert (= (and b!266532 res!222619) b!266530))

(assert (= (and b!266532 (not res!222618)) b!266536))

(assert (= (and b!266536 (not res!222616)) b!266534))

(assert (= start!58042 b!266528))

(assert (= start!58042 b!266529))

(declare-fun m!397359 () Bool)

(assert (=> b!266535 m!397359))

(declare-fun m!397361 () Bool)

(assert (=> b!266535 m!397361))

(declare-fun m!397363 () Bool)

(assert (=> b!266535 m!397363))

(declare-fun m!397365 () Bool)

(assert (=> b!266535 m!397365))

(declare-fun m!397367 () Bool)

(assert (=> b!266535 m!397367))

(declare-fun m!397369 () Bool)

(assert (=> b!266535 m!397369))

(declare-fun m!397371 () Bool)

(assert (=> b!266536 m!397371))

(declare-fun m!397373 () Bool)

(assert (=> b!266534 m!397373))

(declare-fun m!397375 () Bool)

(assert (=> b!266534 m!397375))

(declare-fun m!397377 () Bool)

(assert (=> b!266529 m!397377))

(declare-fun m!397379 () Bool)

(assert (=> b!266528 m!397379))

(declare-fun m!397381 () Bool)

(assert (=> b!266533 m!397381))

(declare-fun m!397383 () Bool)

(assert (=> b!266533 m!397383))

(declare-fun m!397385 () Bool)

(assert (=> b!266533 m!397385))

(declare-fun m!397387 () Bool)

(assert (=> start!58042 m!397387))

(declare-fun m!397389 () Bool)

(assert (=> start!58042 m!397389))

(declare-fun m!397391 () Bool)

(assert (=> start!58042 m!397391))

(assert (=> b!266530 m!397381))

(assert (=> b!266530 m!397381))

(declare-fun m!397393 () Bool)

(assert (=> b!266530 m!397393))

(assert (=> b!266537 m!397381))

(assert (=> b!266537 m!397381))

(declare-fun m!397395 () Bool)

(assert (=> b!266537 m!397395))

(push 1)

